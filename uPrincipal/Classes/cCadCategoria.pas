unit cCadCategoria;

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
  TCategoria = class
  private
    ConexaoDB : TzConnection;
    F_categoriaId:Integer;
    F_descricao:string;
    function getCodigo: Integer;
    function getDescricao: string;
    procedure setDescricao(const Value: string);
    procedure setCodigo(const Value: Integer);


  public
    Constructor Create(aConexao:TZConnection);
    destructor destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar(id :integer):Boolean;
    function Selecionar(id:Integer):boolean;


  published
    property codigo:Integer read getCodigo write setCodigo;
    property descricao:string read getDescricao write setDescricao;

  end;

implementation

{ TCategoria }

{$Region 'Construtores / Destruitores'}

constructor TCategoria.Create;
begin
  ConexaoDB := aConexao;
end;

destructor TCategoria.destroy;
begin

  inherited;
end;

{$endRegion}

{$Region 'Sets'}
procedure TCategoria.setCodigo(const Value: Integer);
begin
   self.F_categoriaId := value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
   self.F_descricao := value;
end;
{$endRegion}

{$Region 'Gets'}
function TCategoria.getCodigo: Integer;
begin
   Result := self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := self.F_descricao;
end;

{$endRegion}

{$Region 'Métodos CRUDs'}

function TCategoria.Apagar(id :integer):Boolean;
begin
  var Q : TZQuery;
begin
  try
    Result:= true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;

    Q.SQL.Add('DELETE FROM categorias WHERE categoriaId = :categoriaId');

    Q.ParamByName('categoriaId').AsInteger := id;

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
end;

function TCategoria.Atualizar: Boolean;
var Q : TZQuery;
begin
  try
    Result:= true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;

    Q.SQL.Add('UPDATE categorias SET descricao = :descricao ' +
    ' WHERE categoriaId = :categoriaId');

    Q.ParamByName('categoriaId').AsInteger := self.F_categoriaId;
    Q.ParamByName('descricao').AsString := self.F_descricao;

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

function TCategoria.Inserir: Boolean;
var Q : TZQuery;
begin
  try
    Result:= true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;

    Q.SQL.Add('INSERT INTO categorias(descricao) VALUES (:descricao);');

    Q.ParamByName('descricao').AsString := self.F_descricao;

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

function TCategoria.Selecionar(id: Integer): boolean;
Var Q:TZQuery;
begin
  try
    Result:= true;
    Q := TZQuery.Create(nil);
    Q.Connection := ConexaoDB;
    Q.SQL.Clear;
    Q.sql.Add('SELECT categoriaId,descricao FROM categorias '+
    ' WHERE categoriaId = :categoriaId');

    Q.ParamByName('categoriaId').AsInteger := id;
    try
      Q.Open;

      self.F_categoriaId := Q.FieldByName('categoriaId').AsInteger;
      self.F_descricao := Q.FieldByName('descricao').AsString;
    Except
     Result:= true;
    end;

  finally
    if Assigned(Q) then
      FreeAndNil(Q);

  end;
end;

{$endRegion}

end.
