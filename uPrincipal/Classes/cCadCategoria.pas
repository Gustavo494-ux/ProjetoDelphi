unit cCadCategoria;

interface

{$region 'Uses'}
uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs;
{$endRegion}

type
  TCategoria = class
  private
    F_categoriaId:Integer;
    F_descricao:string;

    function getCodigo: Integer;
    function getDescricao: string;
    procedure setDescricao(const Value: string);
    procedure setCodigo(const Value: Integer);


  public
    Constructor Create;
    destructor destroy; override;

  published
    property codigo:Integer read getCodigo write setCodigo;
    property descricao:string read getDescricao write setDescricao;

  end;

implementation

{ TCategoria }

constructor TCategoria.Create;
begin

end;

destructor TCategoria.destroy;
begin

  inherited;
end;

procedure TCategoria.setCodigo(const Value: Integer);
begin
   self.F_categoriaId := value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
   self.F_descricao := value;
end;

function TCategoria.getCodigo: Integer;
begin
   Result := self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := self.F_descricao;
end;


end.
