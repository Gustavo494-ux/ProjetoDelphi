unit cCadCliente;

interface
{$region 'Uses'}
uses
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,ZConnection,
  ZAbstractRODataset,ZAbstractDataset,Zdataset;


{$endRegion}

type
  TCliente = Class

  private
    ConexaoDB :TZConnection;
    F_clienteId :Integer;
    F_nome :string;
    F_endereco :string;
    F_cidade :string;
    F_bairro :string;
    F_estado :string;
    F_cep :string;
    F_telefone :string;
    F_email :string;
    F_dataNascimento: TDateTime;


  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property codigo         :Integer    read F_clienteId      write F_clienteId;
    property nome           :string     read F_nome           write F_nome;
    property endereco       :string     read F_endereco       write F_endereco;
    property cidade         :string     read F_cidade         write F_cidade;
    property bairro         :string     read F_bairro         write F_Bairro;
    property estado         :string     read F_estado         write F_estado;
    property cep            :string     read F_cep            write F_cep;
    property telefone       :string     read F_telefone       write F_Telefone;
    property email          :string     read F_email          write F_email;
    property dataNascimento :TDateTime  read F_dataNascimento write F_dataNascimento;

  End;

implementation

{ TCliente }

{$Region 'Constructor and destructor'}

constructor TCliente.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;


{$endRegion}

{$Region 'CRUD'}

function TCliente.Apagar: Boolean;
  var Q :TZQuery;
begin
  if MessageDlg('Apagar o Registro: ' +#13+#13+
    'Código: '+ intToStr(F_clienteId) +  #13+
    'Descrição: '+ F_nome,mtConfirmation,[mbYes,mbNo],0) = mrNo then
    begin
      Result := false;
      abort;
    end;
    try
      Result:= true;
      Q := TZQuery.Create(nil);
      Q.Connection := ConexaoDB;
      Q.SQL.Clear;
      Q.SQL.Add('DELETE FROM clientes WHERE clienteId = :clienteId');
      Q.ParamByName('clienteId').AsInteger := F_clienteId;

      try
        Q.ExecSQL;
      Except
        Result := false;
      end;

    finally
      if Assigned(Q) then
          FreeAndNil(Q);
    end;
end;

function TCliente.Atualizar: Boolean;
var Q:TZQuery;
begin
  try
    Result := true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE clientes SET ' +
        ' nome = :nome, ' +
        ' endereco = :endereco, ' +
        ' cidade = :cidade, ' +
        ' bairro = :bairro, ' +
        ' estado = :estado, ' +
        ' cep = :cep, ' +
        ' telefone = :telefone, ' +
        ' email = :email, ' +
        ' dataNascimento = :dataNascimento ' +
        'WHERE clienteId = :clienteId'
     );
    Q.ParamByName('clienteId').AsInteger := self.F_clienteId;
    Q.ParamByName('nome').AsString :=  self.F_nome;
    Q.ParamByName('endereco').AsString := self.F_endereco;
    Q.ParamByName('cidade').AsString := self.F_cidade;
    Q.ParamByName('bairro').AsString := self.F_bairro;
    Q.ParamByName('estado').AsString := self.F_estado;
    Q.ParamByName('cep').AsString := self.F_cep;
    Q.ParamByName('telefone').AsString := self.F_Telefone;
    Q.ParamByName('email').AsString := self.F_email;
    Q.ParamByName('dataNascimento').AsDateTime := self.F_dataNascimento;
    try
     Q.ExecSQL;
    Except
      Result := false;
    end;
  finally
    if Assigned(Q) then
      FreeAndNil(Q);
  end;
end;

function TCliente.Inserir: Boolean;
var Q:TZQuery;

begin
  try
    Result := true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.SQL.Add('INSERT INTO clientes values(:nome,:endereco,:cidade, ' +
     ' :bairro,:estado,:cep,:telefone,:email,:dataNascimento)');

    Q.ParamByName('nome').AsString :=  self.F_nome;
    Q.ParamByName('endereco').AsString := self.F_endereco;
    Q.ParamByName('cidade').AsString := self.F_cidade;
    Q.ParamByName('bairro').AsString := self.F_bairro;
    Q.ParamByName('estado').AsString := self.F_estado;
    Q.ParamByName('cep').AsString := self.F_cep;
    Q.ParamByName('telefone').AsString := self.F_Telefone;
    Q.ParamByName('email').AsString := self.F_email;
    Q.ParamByName('dataNascimento').value := F_dataNascimento;

    try
      Q.ExecSQL;
    Except
      Result:= false;
    end;

  finally
  if Assigned(Q) then
        FreeAndNil(Q);
  end;
end;

function TCliente.Selecionar(id: Integer): Boolean;
var Q:TZQuery;
begin
  try
    Result := true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT clienteId,nome,endereco,cidade,bairro,estado,cep, ' +
      ' telefone,email,dataNascimento FROM clientes '+
      ' WHERE clienteId = :clienteId');
    Q.ParamByName('clienteId').AsInteger := id;
    try
      Q.Open;
      self.F_clienteId := Q.FieldByName('clienteId').AsInteger;
      self.F_nome := Q.FieldByName('nome').AsString;
      self.F_endereco := Q.FieldByName('endereco').AsString;
      self.F_cidade := Q.FieldByName('cidade').AsString;
      self.F_bairro := Q.FieldByName('bairro').AsString;
      self.F_estado := Q.FieldByName('estado').AsString;
      self.F_cep := Q.FieldByName('cep').AsString;
      self.F_telefone := Q.FieldByName('telefone').AsString;
      self.F_email := Q.FieldByName('email').AsString;
      self.F_dataNascimento := Q.FieldByName('dataNascimento').AsDateTime;
    Except
      Result := false;
    end;
    finally
      if Assigned(Q) then
          FreeAndNil(Q)
    end;
end;

{$endRegion}

end.
