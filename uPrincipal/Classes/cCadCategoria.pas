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

  public
    Constructor Create;
    destructor destroy; override;

  published


  end;

implementation

{ TCategoria }

constructor TCategoria.Create;
begin
  ShowMessage('Fui Criado');
end;

destructor TCategoria.destroy;
begin
   ShowMessage('Fui Eliminado');
  inherited;
end;

end.
