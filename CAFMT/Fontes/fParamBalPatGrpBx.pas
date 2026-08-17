unit fParamBalPatGrpBx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  ComCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamBalPatGrpBx = class(TfrmOkCancelar)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    qryGrupoIni: TwwQuery;
    Label2: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    Label6: TLabel;
    Label3: TLabel;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    prgbar: TProgressBar;
    qryGrpSinteticos: TwwQuery;
    qryBalPatGrp: TwwQuery;
    updBalPatGrp: TUpdateSQL;
    qryParamCaf: TwwQuery;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    dsBalPatGrp: TwwDataSource;
    qryBalPatGrpIDGRUPO: TFloatField;
    qryBalPatGrpCLASSE: TStringField;
    qryBalPatGrpDESCGRUPO: TStringField;
    qryBalPatGrpS_A: TStringField;
    qryBalPatGrpVALORG: TFloatField;
    qryBalPatGrpCMBEM: TFloatField;
    qryBalPatGrpDEPLANC: TFloatField;
    qryBalPatGrpCMDEP: TFloatField;
    qryBalPatGrpVALCTB: TFloatField;
    qryGrpSinteticosCLASSE: TStringField;
    qryGrpSinteticosNOME: TStringField;
    qryGrpSinteticosIDGRUPO: TFloatField;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    Animate1: TAnimate;
    rdgGrupo: TRadioGroup;
    qryGrpAnaliticos: TwwQuery;
    ckbSinteticos: TCheckBox;
    qryGrpAnaliticosIDGRUPO: TFloatField;
    qryGrpAnaliticosCLASSE: TStringField;
    qryGrpAnaliticosVALORG0: TFloatField;
    qryGrpAnaliticosCMBEM0: TFloatField;
    qryGrpAnaliticosDEPLANC0: TFloatField;
    qryGrpAnaliticosCMDEP0: TFloatField;
    qryGrpAnaliticosVALCTB0: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
    procedure ExecutaRelatorio;
  private
    { Private declarations }
    iDia, iMes, iAno     : Word;
    iGrupoIni            : Integer;
    sMascaraGrupo        : String;
  public
    { Public declarations }
  end;

var
  frmParamBalPatGrpBx: TfrmParamBalPatGrpBx;

implementation

uses dRelBalCaf, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmParamBalPatGrpBx.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then qryGrupoIni.Prepare;
   if not qryGrpSinteticos.Prepared then qryGrpSinteticos.Prepare;
   if not qryBalPatGrp.Prepared then qryBalPatGrp.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   iGrupoIni := 0;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamCaf.Open;
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   dtedFim.Date := date;
   dtedFim.SetFocus;
end;

procedure TfrmParamBalPatGrpBx.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if (cmbGrupoIni.Text <> '') then
   begin
      iGrupoIni := qryGrupoIniIDGRUPO.AsInteger;
   end else
   begin
      iGrupoIni := 0;
   end;
end;
//========================================================================================
procedure TfrmParamBalPatGrpBx.bbtnConfirmarClick(Sender: TObject);
var
   fValOrg, fCmBem,
   fDepLanc, fCmDep, fValCtb   : Extended;
   iTam                        : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   pnlStatus.Visible := True;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Processando Grupos Analíticos ...';
   Application.ProcessMessages;
   qryGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   if (iGrupoIni <> 0) then
   begin
      qryGrpAnaliticos.SQL.Strings[40] := ' AND (SB.IDGRUPO = '+IntToStr(iGrupoIni)+') ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[40] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (rdgGrupo.ItemIndex = 0) then
   begin
      qryGrpAnaliticos.SQL.Strings[41] := ' AND (G.FLGIMOVEL = 0) ';
      dtmRelBalCaf.ppLabel77.Caption := 'IMOBILIZADO';
   end else
   if (rdgGrupo.ItemIndex = 1) then
   begin
      qryGrpAnaliticos.SQL.Strings[41] := ' AND (G.FLGIMOVEL = 1) ';
      dtmRelBalCaf.ppLabel77.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[41] := ' ';
      dtmRelBalCaf.ppLabel77.Caption := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (ckbCtlFisico.Checked) then
   begin
      qryGrpAnaliticos.SQL.Strings[42] := ' ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[42] := ' AND (B.CONTROLE = ''T'') ';
   end;
   //-------------------------------------------------------------------------------------
   DecodeDate(dtedFim.Date, iAno, iMes, iDia);
   Animate1.Active := True;
   qryGrpAnaliticos.ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
   qryGrpAnaliticos.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
   qryGrpAnaliticos.ParamByName('PDATASLD').AsDateTime := dtedFim.Date;
   qryGrpAnaliticos.Open;
   qryBalPatGrp.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryGrpAnaliticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpAnaliticos.EOF do
   begin
      if (qryBalPatGrp.Locate('IDGRUPO',qryGrpAnaliticosIDGRUPO.AsInteger,[])) then
      begin
         while (not qryGrpAnaliticos.EOF) and (qryGrpAnaliticosIDGRUPO.AsInteger = qryBalPatGrpIDGRUPO.AsInteger) do
         begin
            qryBalPatGrp.Edit;
            qryBalPatGrp.FieldByName('VALORG').AsCurrency  := qryGrpAnaliticosVALORG0.AsFloat;
            qryBalPatGrp.FieldByName('CMBEM').AsCurrency   := qryGrpAnaliticosCMBEM0.AsFloat;
            qryBalPatGrp.FieldByName('DEPLANC').AsCurrency := qryGrpAnaliticosDEPLANC0.AsFloat;
            qryBalPatGrp.FieldByName('CMDEP').AsCurrency   := qryGrpAnaliticosCMDEP0.AsFloat;
            qryBalPatGrp.FieldByName('VALCTB').AsCurrency  := qryGrpAnaliticosVALCTB0.AsFloat;
            //----------------------------------------------------------------------------
            prgBar.Position := prgBar.Position + 1;
            Application.ProcessMessages;
            qryGrpAnaliticos.Next;
         end;
      end else
      begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages;
         qryGrpAnaliticos.Next;
      end;
   end;
   qryGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Processando Grupos Sintéticos ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Sintéticos
   //-------------------------------------------------------------------------------------
   qryGrpSinteticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryGrpSinteticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpSinteticos.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
      begin
         Application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      iTam     := length(qryGrpSinteticosCLASSE.AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Locate('CLASSE',trim(qryGrpSinteticosCLASSE.AsString),[loPartialKey]);
      while (not qryBalPatGrp.EOF) and
            (copy(qryBalPatGrpCLASSE.AsString,1,iTam) = qryGrpSinteticosCLASSE.AsString) do
      begin
         fValOrg  := fValOrg  + qryBalPatGrpVALORG.AsFloat  ;
         fCmBem   := fCmBem   + qryBalPatGrpCMBEM.AsFloat   ;
         fDepLanc := fDepLanc + qryBalPatGrpDEPLANC.AsFloat ;
         fCmDep   := fCmDep   + qryBalPatGrpCMDEP.AsFloat   ;
         fValCtb  := fValCtb  + qryBalPatGrpVALCTB.AsFloat  ;
         qryBalPatGrp.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[]);
      qryBalPatGrp.Edit;
      qryBalPatGrp.FieldByName('VALORG').AsCurrency  := fValOrg;
      qryBalPatGrp.FieldByName('CMBEM').AsCurrency   := fCmBem;
      qryBalPatGrp.FieldByName('DEPLANC').AsCurrency := fDepLanc;
      qryBalPatGrp.FieldByName('CMDEP').AsCurrency   := fCmDep;
      qryBalPatGrp.FieldByName('VALCTB').AsCurrency  := fValCtb;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   if qryBalPatGrp.IsEmpty then
      MsgDlg('Não houve movimentação com os parâmetros fornecidos!','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   ExecutaRelatorio;
end;

procedure TfrmParamBalPatGrpBx.ExecutaRelatorio;
var
   qryBalPat : TwwQuery;

begin
   qryBalPat := TwwQuery(dtmRelBalCaf.qryBalPatGrpBx);
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryBalPat.Close;
   qryBalPat.Open;
   prgBar.Max      := qryBalPatGrp.RecordCount;
   prgBar.Position := 0;
   qryBalPatGrp.First;
   while not qryBalPatGrp.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
      begin
         Application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      if (ckbTodos.Checked) or
         (((qryBalPatGrpVALORG.AsFloat + qryBalPatGrpCMBEM.AsFloat) -
           (qryBalPatGrpDEPLANC.AsFloat + qryBalPatGrpCMDEP.AsFloat) <> 0)) then
      begin
         if (not ckbSinteticos.Checked) or
            ((ckbSinteticos.Checked) and (qryBalPatGrpS_A.AsString = 'S')) then
         begin
            qryBalPat.Append;
            qryBalPat.FieldByName('IDGRUPO').AsInteger    := qryBalPatGrpIDGRUPO.AsInteger;
            qryBalPat.FieldByName('CLASSE').AsString      := qryBalPatGrpCLASSE.AsString;
            qryBalPat.FieldByName('DESCGRUPO').AsString   := qryBalPatGrpDESCGRUPO.AsString;
            qryBalPat.FieldByName('S_A').AsString         := qryBalPatGrpS_A.AsString;
            qryBalPat.FieldByName('VALORG').AsCurrency    := qryBalPatGrpVALORG.AsFloat;
            qryBalPat.FieldByName('CMBEM').AsCurrency     := qryBalPatGrpCMBEM.AsFloat;
            qryBalPat.FieldByName('DEPLANC').AsCurrency   := qryBalPatGrpDEPLANC.AsFloat;
            qryBalPat.FieldByName('CMDEP').AsCurrency     := qryBalPatGrpCMDEP.AsFloat;
            qryBalPat.FieldByName('VALCTB').AsCurrency    := qryBalPatGrpVALCTB.AsFloat;
         end;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryBalPatGrp.Next;
   end;
   qryBalPatGrp.CancelUpdates;
   qryBalPatGrp.Close;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelBalCaf.ppDBText45.DisplayFormat := sMascaraGrupo;
   //-------------------------------------------------------------------------------------
   DecodeDate(dtedFim.Date, iAno, iMes, iDia);
   dtmRelBalCaf.ppLabel74.Text := 'Movimentação de '+datetostr(EncodeDate(iAno,iMes,01))+ ' a '+dtedFim.Text;
   //-------------------------------------------------------------------------------------
   Animate1.Active := False;
   Screen.Cursor := crDefault;
end;

end.


