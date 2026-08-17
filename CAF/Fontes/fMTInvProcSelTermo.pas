unit fMTInvProcSelTermo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, MontaSelect, StdCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, 
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  wwdbedit, Wwdatsrc, uCmSqlParams, DBClient, uCMClientDataSet, IvEMulti;

type
  TfrmMTInvProcSelTermo = class(TfrmOkCancelar)
    MSResp: TMontaSelect;
    pnlMestre: TPanel;
    Label1: TLabel;
    Processo: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    bbtnSelResp: TBitBtn;
    edDataTermo: TCMDateTimePicker;
    edTermo: TRealEdit;
    edNomeResp: TEdit;
    edProcesso: TEdit;
    cdsVerTermo: TCMClientDataSet;
    sqlVerTermo: TCMSqlParams;
    procedure bbtnSelRespClick(Sender: TObject);
    procedure edTermoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    fResponsavel : Extended;
  end;

var
  frmMTInvProcSelTermo: TfrmMTInvProcSelTermo;

implementation

{$R *.DFM}

uses uMensErro, uSistema;

//========================================================================================
procedure TfrmMTInvProcSelTermo.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResp.RetornouValor then
   begin
      fResponsavel  := StrToFloat(MSResp.ValoresChave[0]);
      edNomeResp.Text := MSResp.ValoresChave[1];
   end else
   begin
      fResponsavel  := 0;
      edNomeResp.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTInvProcSelTermo.edTermoExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   //-------------------------------------------------------------------------------------
   sqlVerTermo.Prepare;
   sqlVerTermo.ParamByName('PTERMO').AsFloat    := edTermo.Value;
   sqlVerTermo.ParamByName('IDPESSOA').AsFloat  := Sistema.IdEmpresa;
   sqlVerTermo.Open;
   if not cdsVerTermo.IsEmpty then
   begin
      MsgDlg('Já existe Termo de Transferência cadastrado com este número! ',
             'Erro',mtError,[mbOk],0);
      edTermo.Text := '';
      edTermo.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTInvProcSelTermo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsVerTermo.Close;
end;

end.
