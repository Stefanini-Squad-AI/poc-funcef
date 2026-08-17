program Report;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {FrmPrincipal},
  RAnimal in 'RAnimal.pas' {RptAnimal},
  FCmReport in '..\..\Forms\Source\FCmReport.pas' {FrmCmReport};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
