unit fInvProcSelTermo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, MontaSelect, StdCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  wwdbedit, Wwdatsrc;

type
  TfrmInvProcSelTermo = class(TfrmOkCancelar)
    MSResp: TMontaSelect;
    pnlMestre: TPanel;
    Label1: TLabel;
    Processo: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    bbtnSelResp: TBitBtn;
    edDataTermo: TCMDateTimePicker;
    edTermo: TRealEdit;
    qryVerTermo: TwwQuery;
    edNomeResp: TEdit;
    edProcesso: TEdit;
    procedure bbtnSelRespClick(Sender: TObject);
    procedure edTermoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdResponsavel : Integer;
  end;

var
  frmInvProcSelTermo: TfrmInvProcSelTermo;

implementation

{$R *.DFM}

uses uMensErro;

procedure TfrmInvProcSelTermo.FormCreate(Sender: TObject);
begin
   inherited;
   qryVerTermo.Prepare;
end;
//========================================================================================
procedure TfrmInvProcSelTermo.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   //-------------------------------------------------------------------------------------
   frmInvProcSelTermo.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSResp.ValoresChave.Count > 0) and (MSResp.ValoresChave[0] <> '') then
   begin
      iIdResponsavel  := StrToInt(MSResp.ValoresChave[0]);
      edNomeResp.Text := MSResp.ValoresChave[1];
   end else
   begin
      iIdResponsavel  := 0;
      edNomeResp.Text := '';
   end;
end;
//========================================================================================
procedure TfrmInvProcSelTermo.edTermoExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   //-------------------------------------------------------------------------------------
   qryVerTermo.Close;
   qryVerTermo.ParamByName('PTERMO').AsString := edTermo.Text;
   qryVerTermo.Open;
   if not (qryVerTermo.IsEmpty) then
   begin
      MsgDlg('Já existe Termo de Transferência cadastrado com este número! ',
             'Erro',mtError,[mbOk],0);
      edTermo.Text := '';
      edTermo.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmInvProcSelTermo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryVerTermo.Close;
   qryVerTermo.UnPrepare;
end;

end.
