unit cCadProduto;

interface
  uses System.Classes,Vcl.Controls,Vcl.ExtCtrls,Vcl.Dialogs,ZAbstractConnection,
  ZConnection,ZAbstractRODataset,ZAbstractDataset,ZDataset,System.SysUtils;

type
  TProduto = Class
  private
    ConexaoDB :TZConnection;

    F_produtoId       :Integer;
    F_nome            :string;
    F_descricao       :string;
    F_valor           :Double;
    F_quantidade      :double;
    F_categoriaId     :Integer;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

    function Inserir                :boolean;
    function Atualizar              :boolean;
    function Apagar                 :Boolean;
    function Selecionar(id:Integer) :boolean;

  published
    property codigo        :Integer    read F_produtoId      write F_produtoId;
    property nome          :string     read F_nome           write F_nome;
    property descricao     :string     read F_descricao      write  F_descricao;
    property valor         :double     read F_valor          write F_valor;
    property quantidade    :double     read F_quantidade     write F_quantidade;
    property categoriaId   :Integer    read F_categoriaId    write F_categoriaId;


  End;
implementation

{ TProduto }

{$Region 'Constructors / Destructors'}

constructor TProduto.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

{$endRegion}

{$Region 'Métodos CRUD'}

function TProduto.Inserir: boolean;
var Q:TZQuery;
begin
  try
    Result := true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.SQL.Add('INSERT INTO produtos VALUES(:nome,:descricao,:valor, ' +
       ' :quantidade,:categoriaId)');

    Q.ParamByName('nome').AsString := F_nome;
    Q.ParamByName('descricao').AsString := F_descricao;
    Q.ParamByName('valor').AsFloat := F_valor;
    Q.ParamByName('quantidade').AsFloat := F_quantidade;
    Q.ParamByName('categoriaId').AsInteger := F_categoriaId;
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

function TProduto.Selecionar(id: Integer): boolean;
var
  Q:TZQuery;
begin
  try
    Result:= true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT produtoId,nome,descricao,valor,quantidade, ' +
      '	categoriaId FROM vendas..produtos  ' +
      ' WHERE produtoId = :produtoId '
    );
    Q.ParamByName('produtoId').AsInteger := id;

    try
      Q.Open;
      self.F_produtoId := Q.FieldByName('produtoId').AsInteger;
      self.F_nome := Q.fieldByName('nome').AsString;
      self.F_descricao := Q.FieldByName('descricao').AsString;
      self.F_valor := Q.FieldByName('valor').AsFloat;
      self.F_quantidade := Q.FieldByName('quantidade').AsFloat;
      self.F_categoriaId := Q.FieldByName('categoriaId').AsInteger;
    Except
      Result:= false;
    end;
  finally
    if Assigned(Q) then
      FreeAndNil(Q);
  end;
end;

function TProduto.Atualizar: boolean;
var Q:TZQuery;
begin
  try
    Result:= true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE produtos SET ' +
        ' nome = :nome,' +
        ' descricao = :descricao, ' +
        ' valor = :valor, ' +
        ' quantidade = :quantidade, ' +
        ' categoriaId = :categoriaId ' +
        ' WHERE produtoId = :produtoId '
    );
    Q.ParamByName('produtoId').AsInteger := F_produtoId;
    Q.ParamByName('nome').AsString := F_nome;
    Q.ParamByName('descricao').AsString := F_descricao;
    Q.ParamByName('valor').AsFloat := F_valor;
    Q.ParamByName('quantidade').AsFloat := F_quantidade;
    Q.ParamByName('categoriaId').AsInteger := F_categoriaId;

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

function TProduto.Apagar: Boolean;
var Q:TZQuery;
begin
  if MessageDlg('Apagar o Registro: ' +#13+#13+
    'Código: '+ intToStr(F_produtoId) +  #13+
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
    Q.SQl.Add('DELETE FROM produtos WHERE produtoId = :produtoId ');
    Q.ParamByName('produtoId').AsInteger := F_produtoId;

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

{$endRegion}

end.
