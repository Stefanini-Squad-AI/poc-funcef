unit fParamSelBxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  TREdit, Mask, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmParamSelBxBens = class(TfrmOkCancelar)
    Label2: TLabel;
    qryResponsavel: TwwQuery;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDRESPONSAVEL: TFloatField;
    cmbResponsavel: TwwDBLookupCombo;
    grpbxTermo: TGroupBox;
    rdgrpFlgTermo: TRadioGroup;
    edDtaSelBaixa: TCMDateTimePicker;
    Label1: TLabel;
    edTermo: TMaskEdit;
    rdGrpValores: TRadioGroup;
    rGrpOrdem: TRadioGroup;
    qrySldCtb: TwwQuery;
    qrySldCtbIDBEM: TFloatField;
    qrySldCtbIDPESSOA: TFloatField;
    qrySldCtbVALCTB: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamSelBxBens: TfrmParamSelBxBens;

implementation

uses uSistema, dRelOperCaf,  uMensErro;

{$R *.DFM}

procedure TfrmParamSelBxBens.FormCreate(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   rdgrpFlgTermo.ItemIndex := 0;
   edTermo.Text            := '';
   edDtaSelBaixa.Text      := '';
   qryResponsavel.Open;
   if not qrySldCtb.Prepared then qrySldCtb.Prepare;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamSelBxBens.FormActivate(Sender: TObject);
begin
   inherited;
   rdgrpFlgTermo.SetFocus;
end;
//========================================================================================
procedure TfrmParamSelBxBens.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qrySelBxBens do
   begin
      Close;
      if (edTermo.Text <> '') then
      begin
         SQL.Strings[18] := '   (SB.SBXTERMO = ' + edTermo.Text + ') AND';
      end else
      begin
         SQL.Strings[18] := '';
         //-------------------------------------------------------------------------------
         case rdgrpFlgTermo.ItemIndex  of
            0: SQL.Strings[19] := '   (SB.SBXFLGEXECUTADO = 0) AND';
            1: SQL.Strings[19] := '   (SB.SBXFLGEXECUTADO = 1) AND';
         else
            SQL.Strings[19] := '';
         end;
         //-------------------------------------------------------------------------------
         if (edDtaSelBaixa.Text <> '') then
            SQL.Strings[20] := '   (SB.SBXDATA = TO_DATE(' + #39 + edDtaSelBaixa.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) AND'
         else
            SQL.Strings[20] := '';
         //-------------------------------------------------------------------------------
         if (cmbResponsavel.Text <> '') then
            SQL.Strings[21] := '   (SB.IDRESPONSAVEL = ' + inttostr(qryResponsavelIDRESPONSAVEL.AsInteger) + ') AND'
         else
            SQL.Strings[21] := '';
      end;
      //----------------------------------------------------------------------------------
      case rGrpOrdem.ItemIndex of
         0: SQL.Strings[28] := ' ORDER BY SB.SBXTERMO, B.PLACA ';
         1: SQL.Strings[28] := ' ORDER BY SB.SBXTERMO, B.DESBEM ';
         2: SQL.Strings[28] := ' ORDER BY SB.SBXTERMO, B.VALORG ';
      else
         SQL.Strings[28] := '';
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (rdGrpValores.ItemIndex = 0) then
   begin
      dtmRelOperCaf.rpSelBxBensDBText9.DataField := 'VALCTB';
      dtmRelOperCaf.rpSelBxBensLabel8.Caption    := 'Valor Residual';
      dtmRelOperCaf.rpSelBxBensDBCalc2.DataField := 'VALCTB';
   end else
   begin
      dtmRelOperCaf.rpSelBxBensDBText9.DataField := 'VALAQUIS';
      dtmRelOperCaf.rpSelBxBensLabel8.Caption    := 'Valor Aquisição';
      dtmRelOperCaf.rpSelBxBensDBCalc2.DataField := 'VALAQUIS';
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      qrySelBxBens.Open;
      Screen.Cursor := crDefault;
      if qrySelBxBens.IsEmpty then
         MsgDlg('Não existem Termos de Seleção de Baixa que atendam aos parâmetros' +
                ' fornecidos!', 'Erro',mtError,[mbOk],0);
      //----------------------------------------------------------------------------------
      // Calcula os saldos contábeis nas respectivas datas fornecidas e registra no campo
      // virtual VALCTB, caso seja solicitado
      //----------------------------------------------------------------------------------
      if (rdGrpValores.ItemIndex = 0) then
      begin
         while not qrySelBxBens.EOF do
         begin
            qrySldCtb.Close;
            qrySldCtb.ParamByName('PDATASLD').AsString   := datetostr(qrySelBxBensSBXDATA.AsDateTime - 1);
            qrySldCtb.ParamByName('PIDBEM').AsInteger    := (qrySelBxBensIDBEM.AsInteger);
            qrySldCtb.ParamByName('PIDPESSOA').AsInteger := (qrySelBxBensIDPESSOA.AsInteger);
            qrySldCtb.Open;
            //----------------------------------------------------------------------------
            if not qrySldCtb.IsEmpty then
            begin
               qrySelBxBens.Edit;
               qrySelBxBensVALCTB.AsCurrency := qrySldCtbVALCTB.AsCurrency;
               qrySelBxBens.Post;
            end;
            //----------------------------------------------------------------------------
            qrySelBxBens.Next;
         end;
         qrySelBxBens.First;
      end;
   end;
end;
//========================================================================================
procedure TfrmParamSelBxBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryResponsavel.Close;
   qryResponsavel.UnPrepare;
   qrySldCtb.Close;
   qrySldCtb.UnPrepare;
end;

end.

