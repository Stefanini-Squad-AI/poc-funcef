unit FAditamentosNaoAprovadosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, uCtrlAditamento, DBTables;

type
  TfrmAditamentosNaoAprovados = class(TfrmOkCancelar)
    cdsAditamento: TCMClientDataSet;
    dsAditamento: TDataSource;
    wwDBGrid1: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlAditamento : TCtrlAditamento;
    FIdContrato    : Double;
  public
    { Public declarations }
    property IdContrato : Double  read FIdContrato   write FIdContrato;
  end;

var
  frmAditamentosNaoAprovados: TfrmAditamentosNaoAprovados;

implementation

{$R *.DFM}

uses dBaseDados;


procedure TfrmAditamentosNaoAprovados.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlAditamento := TCtrlAditamento.Create;
   CtrlAditamento.Initialize(dtmBaseDados.dbBaseDados,True);
   FIDContrato := -1;
end;



procedure TfrmAditamentosNaoAprovados.FormShow(Sender: TObject);
begin
   inherited;
   cdsAditamento.Data:=CtrlAditamento.ListaAditamentosNaoAprovados(FIdContrato);
   bbtnConfirmar.Enabled := (not cdsAditamento.IsEmpty);

   if cdsAditamento.IsEmpty then
   begin
      ModalResult := mrOK;
      frmAditamentosNaoAprovados.Close;
   end
   else
   begin
      ModalResult := mrCancel;
   end;

end;



procedure TfrmAditamentosNaoAprovados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlAditamento.Free;
   inherited;
end;



procedure TfrmAditamentosNaoAprovados.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   cdsAditamento.DisableControls;

   while not cdsAditamento.eof do
   begin
      CtrlAditamento.RestauraAditamento(cdsAditamento.FieldByName('IDADITAMENTO').AsFloat);
      cdsAditamento.Next;                                                                          
   end;

   cdsAditamento.Data:=CtrlAditamento.ListaAditamentosNaoAprovados(FIdContrato);
   bbtnConfirmar.Enabled := (not cdsAditamento.IsEmpty);
   cdsAditamento.EnableControls;
   if    not bbtnConfirmar.Enabled then
         ModalResult := mrOK
   else  ModalResult := mrCancel;
end;



end.
