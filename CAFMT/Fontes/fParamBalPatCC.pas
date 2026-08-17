unit fParamBalPatCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  ComCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamBalPatCC = class(TfrmOkCancelar)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    qryCCAnaliticos: TwwQuery;
    qryCCustoIni: TwwQuery;
    Label2: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    Label6: TLabel;
    Label3: TLabel;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    prgbar: TProgressBar;
    qryCCSinteticos: TwwQuery;
    qryBalPatCC: TwwQuery;
    updBalPatCC: TUpdateSQL;
    dsBalPatCC: TwwDataSource;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    Animate1: TAnimate;
    qryCCustoIniCODCENTROCUSTO: TStringField;
    qryCCustoIniNOME: TStringField;
    qryCCSinteticosCODCENTROCUSTO: TStringField;
    qryCCSinteticosNOME: TStringField;
    qryParamGlobal: TwwQuery;
    qryParamGlobalMASCARACC: TStringField;
    qryBalPatCCIDCENTROCUSTO: TFloatField;
    qryBalPatCCCODCENTROCUSTO: TStringField;
    qryBalPatCCDESCCCUSTO: TStringField;
    qryBalPatCCS_A: TStringField;
    qryBalPatCCVALORG: TFloatField;
    qryBalPatCCCMBEM: TFloatField;
    qryBalPatCCDEPLANC: TFloatField;
    qryBalPatCCCMDEP: TFloatField;
    qryBalPatCCVALCTB: TFloatField;
    qryBalPatCCDEPMES: TFloatField;
    qryCCAnaliticosCODCENTROCUSTO: TStringField;
    qryCCAnaliticosDESCCCUSTO: TStringField;
    qryCCAnaliticosTIPOCCUSTO: TStringField;
    qryCCAnaliticosVALORG0: TFloatField;
    qryCCAnaliticosCMBEM0: TFloatField;
    qryCCAnaliticosDEPLANC0: TFloatField;
    qryCCAnaliticosDEPLANCATU0: TFloatField;
    qryCCAnaliticosCMDEP0: TFloatField;
    qryCCAnaliticosVALCTB0: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
    procedure ExecutaRelatorio;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iCCustoIni         : Integer;
    sMascaraCC        : String;
  end;

var
  frmParamBalPatCC: TfrmParamBalPatCC;

implementation

uses dRelBalCaf, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmParamBalPatCC.FormCreate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   if not qryCCustoIni.Prepared then
      qryCCustoIni.Prepare;
   if not qryCCSinteticos.Prepared then
      qryCCSinteticos.Prepare;
   if not qryBalPatCC.Prepared then
      qryBalPatCC.Prepare;
   //-------------------------------------------------------------------------------------
   qryCCustoIni.Open;
   iCCustoIni := 0;
   //-------------------------------------------------------------------------------------
   qryParamGlobal.Close;
   qryParamGlobal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParamGlobal.Open;
   sMascaraCC := qryParamGlobalMASCARACC.AsString;
   iAux := 1;
   while iAux <= length(sMascaraCC) do
   begin
      if sMascaraCC[iAux] = '9' then
         sMascaraCC[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraCC := sMascaraCC + ';0; ';
   //-------------------------------------------------------------------------------------
   dtedFim.Date := date;
end;
//========================================================================================
procedure TfrmParamBalPatCC.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if (cmbGrupoIni.Text <> '') then
   begin
      iCCustoIni := qryCCustoIniCODCENTROCUSTO.AsInteger;
   end else
   begin
      iCCustoIni := 0;
   end;
end;
//========================================================================================
procedure TfrmParamBalPatCC.bbtnConfirmarClick(Sender: TObject);
Const
   iPosSQL = 90;
var
   fValOrg, fCmBem, fDepLanc, fDepMes, fCmDep, fValCtb : Extended;
   iTam                                                : Integer;
   iAno, iMes, iDia                                    : Word;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := True;
   lblStatus.Caption := 'Centros de Custo Analíticos ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula os Centros de Custo Analiticos
   //-------------------------------------------------------------------------------------
   qryBalPatCC.Close;
   qryBalPatCC.Open;
   if qryCCAnaliticos.Active then
   begin
      qryCCAnaliticos.Close;
      if qryCCAnaliticos.Prepared then qryCCAnaliticos.UnPrepare;
   end;
   //-------------------------------------------------------------------------------------
   if (iCCustoIni <> 0) then
   begin
      qryCCAnaliticos.SQL.Strings[iPosSQL] := 'AND (RTRIM(CC.CODCENTROCUSTO) = '+#39+IntToStr(iCCustoIni)+#39+')';
   end else
   begin
      qryCCAnaliticos.SQL.Strings[iPosSQL] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (ckbCtlFisico.Checked) then
   begin
      qryCCAnaliticos.SQL.Strings[iPosSQL + 1] := ' ';
   end else
   begin
      qryCCAnaliticos.SQL.Strings[iPosSQL + 1] := 'AND (B.CONTROLE = ''T'')';
   end;
   //-------------------------------------------------------------------------------------
   DecodeDate(dtedFim.Date, iAno, iMes, iDia);
   qryCCAnaliticos.ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
   qryCCAnaliticos.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
   qryCCAnaliticos.ParamByName('PDATASLD').AsDateTime := dtedFim.Date;
   if not qryCCAnaliticos.Prepared then qryCCAnaliticos.Prepare;
   qryCCAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryCCAnaliticos.RecordCount;
   prgBar.Position := 0;
   while not qryCCAnaliticos.EOF do
   begin
      if (qryBalPatCC.Locate('IDCENTROCUSTO',qryCCAnaliticosCODCENTROCUSTO.AsInteger,[])) then
      begin
         while (not qryCCAnaliticos.EOF) and (qryCCAnaliticosCODCENTROCUSTO.AsInteger = qryBalPatCCIDCENTROCUSTO.AsInteger) do
         begin
            qryBalPatCC.Edit;
            qryBalPatCCVALORG.AsCurrency  := qryCCAnaliticosVALORG0.AsFloat;
            qryBalPatCCCMBEM.AsCurrency   := qryCCAnaliticosCMBEM0.AsFloat;
            qryBalPatCCDEPLANC.AsCurrency := qryCCAnaliticosDEPLANC0.AsFloat;
            qryBalPatCCDEPMES.AsCurrency  := qryCCAnaliticosDEPLANCATU0.AsFloat;
            qryBalPatCCCMDEP.AsCurrency   := qryCCAnaliticosCMDEP0.AsFloat;
            qryBalPatCCVALCTB.AsCurrency  := qryCCAnaliticosVALCTB0.AsFloat;
            //----------------------------------------------------------------------------
            prgBar.Position := prgBar.Position + 1;
            Application.ProcessMessages;
            qryCCAnaliticos.Next;
         end;
      end else
      begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages;
         qryCCAnaliticos.Next;
      end;
   end;
   qryCCAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Centros de Custo Sintéticos ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula os Centros de Custo Sintéticos
   //-------------------------------------------------------------------------------------
   qryCCSinteticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryCCSinteticos.RecordCount;
   prgBar.Position := 0;
   while not qryCCSinteticos.EOF do
   begin
      iTam     := length(qryCCSinteticosCODCENTROCUSTO.AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fDepMes  := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      //----------------------------------------------------------------------------------
      qryBalPatCC.Locate('CODCENTROCUSTO',trim(qryCCSinteticosCODCENTROCUSTO.AsString),[loPartialKey]);
      while (not qryBalPatCC.EOF) and
            (copy(qryBalPatCCCODCENTROCUSTO.AsString,1,iTam) = qryCCSinteticosCODCENTROCUSTO.AsString) do
      begin
         fValOrg  := fValOrg  + qryBalPatCCVALORG.AsFloat  ;
         fCmBem   := fCmBem   + qryBalPatCCCMBEM.AsFloat   ;
         fDepLanc := fDepLanc + qryBalPatCCDEPLANC.AsFloat ;
         fDepMes  := fDepMes  + qryBalPatCCDEPMES.AsFloat ;
         fCmDep   := fCmDep   + qryBalPatCCCMDEP.AsFloat   ;
         fValCtb  := fValCtb  + qryBalPatCCVALCTB.AsFloat  ;
         qryBalPatCC.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBalPatCC.Locate('CODCENTROCUSTO',qryCCSinteticosCODCENTROCUSTO.AsString,[]);
      qryBalPatCC.Edit;
      qryBalPatCC.FieldByName('VALORG').AsCurrency  := fValOrg;
      qryBalPatCC.FieldByName('CMBEM').AsCurrency   := fCmBem;
      qryBalPatCC.FieldByName('DEPLANC').AsCurrency := fDepLanc;
      qryBalPatCC.FieldByName('DEPMES').AsCurrency  := fDepMes;
      qryBalPatCC.FieldByName('CMDEP').AsCurrency   := fCmDep;
      qryBalPatCC.FieldByName('VALCTB').AsCurrency  := fValCtb;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      qryCCSinteticos.Next;
   end;
   qryCCSinteticos.Close;
   //-------------------------------------------------------------------------------------
   if qryBalPatCC.IsEmpty then
      MsgDlg('Não houve movimentação com os Parâmetros Fornecidos!','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   ExecutaRelatorio;
end;
//========================================================================================
procedure TfrmParamBalPatCC.ExecutaRelatorio;
var
   qryBalPat : TwwQuery;

begin
   qryBalPat := TwwQuery(dtmRelBalCaf.qryBalPatCC);
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryBalPat.Close;
   qryBalPat.Open;
   prgBar.Max      := qryBalPatCC.RecordCount;
   prgBar.Position := 0;
   qryBalPatCC.First;
   while not qryBalPatCC.EOF do
   begin
      if (ckbTodos.Checked) or
         (((qryBalPatCCVALORG.AsFloat + qryBalPatCCCMBEM.AsFloat) -
           (qryBalPatCCDEPLANC.AsFloat + qryBalPatCCCMDEP.AsFloat) <> 0)) then
      begin
         qryBalPat.Append;
         qryBalPat.FieldByName('CODCENTROCUSTO').AsInteger := qryBalPatCCCODCENTROCUSTO.AsInteger;
         qryBalPat.FieldByName('DESCCCUSTO').AsString      := qryBalPatCCDESCCCUSTO.AsString;
         qryBalPat.FieldByName('S_A').AsString             := qryBalPatCCS_A.AsString;
         qryBalPat.FieldByName('VALORG').AsCurrency        := qryBalPatCCVALORG.AsFloat;
         qryBalPat.FieldByName('CMBEM').AsCurrency         := qryBalPatCCCMBEM.AsFloat;
         qryBalPat.FieldByName('DEPLANC').AsCurrency       := qryBalPatCCDEPLANC.AsFloat;
         qryBalPat.FieldByName('DEPMES').AsCurrency        := qryBalPatCCDEPMES.AsFloat;
         qryBalPat.FieldByName('CMDEP').AsCurrency         := qryBalPatCCCMDEP.AsFloat;
         qryBalPat.FieldByName('VALCTB').AsCurrency        := qryBalPatCCVALCTB.AsFloat;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      qryBalPatCC.Next;
   end;
   qryBalPatCC.CancelUpdates;
   qryBalPatCC.Close;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelBalCaf.ppDBTEXT10.DisplayFormat := sMascaraCC;
   dtmRelBalCaf.ppLabel30.Text := dtedFim.Text;
   Animate1.Active := False;
   Screen.Cursor := crDefault;
end;

end.
