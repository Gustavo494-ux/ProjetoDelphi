unit cCadCategoria;

interface

{$region 'Uses'}
uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,
  ZConnection;


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
    function Gravar:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
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

function TCategoria.Apagar: Boolean;
begin
   ShowMessage('Registro Apagado');
   Result := True;
end;

function TCategoria.Atualizar: Boolean;
begin
   ShowMessage('Registro Atualizado');
   Result := True;
end;

function TCategoria.Gravar: Boolean;
begin
  ShowMessage('Registro Salvo');
  Result := True;
end;

function TCategoria.Selecionar(id: Integer): boolean;
begin
  ShowMessage('Registro Listado');
  Result := True;
end;

{$endRegion}

end.
