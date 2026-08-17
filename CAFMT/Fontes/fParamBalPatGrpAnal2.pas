unit fParamBalPatGrpAnal2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, DBTables, Db,
  Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams,
  DBClient, uCMClientDataSet;

type
  TfrmParamBalPatGrpAnal2 = class(TfrmOkCancelar)
    qryClasAnaliticos: TwwQuery;
    qryParamCaf: TwwQuery;
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    prgbar: TProgressBar;
    qryParamCafMASCARACLASSE: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbBaixados: TCheckBox;
    qryGrpSinteticos: TwwQuery;
    qryGrpSinteticosCLASSE: TStringField;
    qryGrpSinteticosNOME: TStringField;
    qryGrpSinteticosIDGRUPO: TFloatField;
    qryClasAnaliticosCLASSE: TStringField;
    qryClasAnaliticosNOME: TStringField;
    qryClasAnaliticosTIPO: TStringField;
    qryClasAnaliticosCODHIERARQ: TStringField;
    qryClasAnaliticosDESCRICAO: TStringField;
    qryClasAnaliticosANASINT: TStringField;
    qryClasAnaliticosQUANT: TFloatField;
    qryClasAnaliticosVALORG0: TFloatField;
    qryClasAnaliticosCMBEM0: TFloatField;
    qryClasAnaliticosDEPLANC0: TFloatField;
    qryClasAnaliticosCMDEP0: TFloatField;
    qryClasAnaliticosVALCTB0: TFloatField;
    cdsBalPatClas: TCMClientDataSet;
    sqlBalPatClas: TCMSqlParams;
    cdsBalPatClas1: TCMClientDataSet;
    sqlBalPatClas1: TCMSqlParams;
    cdsBalPatClas2: TCMClientDataSet;
    sqlBalPatClas2: TCMSqlParams;
    cdsBalPatClas3: TCMClientDataSet;
    sqlBalPatClas3: TCMSqlParams;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    Label3: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    qryParamCafMASCCODGRUPO: TStringField;
    ckbExcluiGrpAnal: TCheckBox;
    qryClasAnaliticosIDGRUPO: TFloatField;
    qryParamCafPLANOVIGENTE: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iPlanoVigente,iClasseIni, iClasseFim : Integer;
    sMascaraClasse         : String;

  end;

var
  frmParamBalPatGrpAnal2: TfrmParamBalPatGrpAnal2;

implementation

uses dRelBalCaf, uSistema, uMensErro, uAtivoFixo, dAtivoFixo;

{$R *.DFM}

procedure TfrmParamBalPatGrpAnal2.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then
      qryGrupoIni.Prepare;
   if not qryClasAnaliticos.Prepared then
      qryClasAnaliticos.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   iClasseIni := 0;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamCaf.Open;
   sMascaraClasse := qryParamCafMASCCODGRUPO.AsString;
   iPlanoVigente  := qryParamCafPLANOVIGENTE.AsInteger;
   iAux := 1;
   while iAux <= length(sMascaraClasse) do
   begin
      if sMascaraClasse[iAux] = '9' then
         sMascaraClasse[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraClasse := sMascaraClasse + ';0; ';
   //-------------------------------------------------------------------------------------
   dtedFim.Date := date;
   dtedFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamBalPatGrpAnal2.cmbGrupoIniExit(Sender: TObject);
begin
  inherited;
   if (cmbGrupoIni.Text = '') then
   begin
      iClasseIni := 0;
   end else
   begin
      iClasseIni := qryGrupoIniIDGRUPO.AsInteger;
   end;
end;
//========================================================================================
procedure TfrmParamBalPatGrpAnal2.bbtnConfirmarClick(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Double;
   qryBalPat                                  : TwwQuery;
   iTam, iQuant, iGrupoA                      : Integer;
   sGrupoA, sNomeA                            : String;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   qryBalPat := TwwQuery(dtmRelBalCaf.qryBalPatGrpAnal2);
   //-------------------------------------------------------------------------------------
   sqlBalPatClas.Open;
   sqlBalPatClas1.Open;
   sqlBalPatClas2.Open;
   sqlBalPatClas3.Open;
   pnlStatus.Visible := True;
   lblStatus.Caption := 'Processando Classes Analíticas ...';
   Application.ProcessMessages;
   qryClasAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula as Classes Analiticas
   //-------------------------------------------------------------------------------------
   if iClasseIni <> 0 then
   begin
      qryClasAnaliticos.SQL.Strings[36] := 'AND (B.IDGRUPO = '+IntToStr(iClasseIni)+')';
   end else
   begin
      qryClasAnaliticos.SQL.Strings[36] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if ckbCtlFisico.Checked then
   begin
      qryClasAnaliticos.SQL.Strings[37] := ' ';
   end else
   begin
      qryClasAnaliticos.SQL.Strings[37] := ' AND (B.CONTROLE = ''T'') ';
   end;
   //-------------------------------------------------------------------------------------
   if ckbBaixados.Checked then
   begin
      qryClasAnaliticos.SQL.Strings[38] := ' ';
   end else
   begin
      qryClasAnaliticos.SQL.Strings[38] := ' AND (B.BAIXATOTAL <> ''S'') ';
   end;
   //-------------------------------------------------------------------------------------
   qryClasAnaliticos.ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
   qryClasAnaliticos.ParamByName('PDATASLD').AsDateTime := dtedFim.Date;
   qryClasAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryClasAnaliticos.RecordCount;
   prgBar.Position := 0;
   while not qryClasAnaliticos.EOF do
   begin
      if not (cdsBalPatClas1.Locate('CLASSE;CODHIERARQ',
                                    VarArrayOf([qryClasAnaliticos.FieldbyName('CLASSE').AsString,
                                                qryClasAnaliticos.FieldbyName('CODHIERARQ').AsString]) ,[])) then
      begin
         cdsBalPatClas1.Append;
         cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger   := qryClasAnaliticosIDGRUPO.AsInteger;
         cdsBalPatClas1.FieldByName('CLASSE').AsString     := qryClasAnaliticosCLASSE.AsString;
         cdsBalPatClas1.FieldByName('NOME').AsString       := qryClasAnaliticosNOME.AsString;
         cdsBalPatClas1.FieldByName('TIPO').AsString       := qryClasAnaliticosTIPO.AsString;
         cdsBalPatClas1.FieldByName('CODHIERARQ').AsString := qryClasAnaliticosCODHIERARQ.AsString;
         cdsBalPatClas1.FieldByName('DESCRICAO').AsString  := qryClasAnaliticosDESCRICAO.AsString;
         cdsBalPatClas1.FieldByName('ANASINT').AsString    := qryClasAnaliticosANASINT.AsString;
      end else
      begin
         cdsBalPatClas1.Edit;
      end;
      cdsBalPatClas1.FieldByName('VALORG').AsCurrency   := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('VALORG').AsFloat  + qryClasAnaliticosVALORG0.AsFloat);
      cdsBalPatClas1.FieldByName('CMBEM').AsCurrency    := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('CMBEM').AsFloat   + qryClasAnaliticosCMBEM0.AsFloat);
      cdsBalPatClas1.FieldByName('DEPLANC').AsCurrency  := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('DEPLANC').AsFloat + qryClasAnaliticosDEPLANC0.AsFloat);
      cdsBalPatClas1.FieldByName('CMDEP').AsCurrency    := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('CMDEP').AsFloat   + qryClasAnaliticosCMDEP0.AsFloat);
      cdsBalPatClas1.FieldByName('VALCTB').AsCurrency   := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('VALCTB').AsFloat  + qryClasAnaliticosVALCTB0.AsFloat);
      cdsBalPatClas1.FieldByName('QUANT').AsInteger     := cdsBalPatClas.FieldByName('QUANT').AsInteger + qryClasAnaliticosQUANT.AsInteger;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      qryClasAnaliticos.Next;
   end;
   qryClasAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os grupos contábeis analíticos
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Processando Grupos Contábeis Analíticos ...';
   Application.ProcessMessages;
   prgBar.Max      := cdsBalPatClas1.RecordCount;
   prgBar.Position := 0;
   cdsBalPatClas1.First;
   while not cdsBalPatClas1.EOF do
   begin
      iGrupoA := cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger;
      sGrupoA := cdsBalPatClas1.FieldByName('CLASSE').AsString;
      sNomeA  := cdsBalPatClas1.FieldByName('NOME').AsString;
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      iQuant   := 0;
      while (not cdsBalPatClas1.EOF) and (cdsBalPatClas1.FieldByName('CLASSE').AsString = sGrupoA) do
      begin
         fValOrg  := AtivoFixo.ConvNum(fValOrg  + cdsBalPatClas1.FieldByName('VALORG').AsFloat);
         fCmBem   := AtivoFixo.ConvNum(fCmBem   + cdsBalPatClas1.FieldByName('CMBEM').AsFloat);
         fDepLanc := AtivoFixo.ConvNum(fDepLanc + cdsBalPatClas1.FieldByName('DEPLANC').AsFloat);
         fCmDep   := AtivoFixo.ConvNum(fCmDep   + cdsBalPatClas1.FieldByName('CMDEP').AsFloat);
         fValCtb  := AtivoFixo.ConvNum(fValCtb  + cdsBalPatClas1.FieldByName('VALCTB').AsFloat);
         iQuant   := iQuant + cdsBalPatClas1.FieldByName('QUANT').AsInteger;
         //-------------------------------------------------------------------------------
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages;
         cdsBalPatClas1.Next;
      end;
      cdsBalPatClas2.Append;
      cdsBalPatClas2.FieldByName('IDGRUPO').AsInteger   := iGrupoA;
      cdsBalPatClas2.FieldByName('CLASSE').AsString     := sGrupoA;
      cdsBalPatClas2.FieldByName('NOME').AsString       := sNomeA;
      cdsBalPatClas2.FieldByName('TIPO').AsString       := 'A';
      cdsBalPatClas2.FieldByName('CODHIERARQ').Clear;
      cdsBalPatClas2.FieldByName('DESCRICAO').Clear;
      cdsBalPatClas2.FieldByName('ANASINT').Clear;
      cdsBalPatClas2.FieldByName('VALORG').AsCurrency   := fValOrg;
      cdsBalPatClas2.FieldByName('CMBEM').AsCurrency    := fCmBem;
      cdsBalPatClas2.FieldByName('DEPLANC').AsCurrency  := fDepLanc;
      cdsBalPatClas2.FieldByName('CMDEP').AsCurrency    := fCmDep;
      cdsBalPatClas2.FieldByName('VALCTB').AsCurrency   := fValCtb;
      cdsBalPatClas2.FieldByName('QUANT').AsInteger     := iQuant;
   end;
   //-------------------------------------------------------------------------------------
   // Calcula os grupos contábeis sintéticos
   //-------------------------------------------------------------------------------------
   qryGrpSinteticos.Open;
   lblStatus.Caption := 'Processando Grupos Contábeis Sintéticos ...';
   Application.ProcessMessages;
   prgBar.Max      := qryGrpSinteticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpSinteticos.EOF do
   begin
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      iTam     := length(qryGrpSinteticosCLASSE.AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      iQuant   := 0;
      //----------------------------------------------------------------------------------
      cdsBalPatClas2.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[loPartialKey]);
      while (not cdsBalPatClas2.EOF) and
            (copy(cdsBalPatClas2.FieldByName('CLASSE').AsString,1,iTam) = qryGrpSinteticosCLASSE.AsString) do
      begin
         fValOrg  := AtivoFixo.ConvNum(fValOrg  + cdsBalPatClas2.FieldByName('VALORG').AsFloat);
         fCmBem   := AtivoFixo.ConvNum(fCmBem   + cdsBalPatClas2.FieldByName('CMBEM').AsFloat);
         fDepLanc := AtivoFixo.ConvNum(fDepLanc + cdsBalPatClas2.FieldByName('DEPLANC').AsFloat);
         fCmDep   := AtivoFixo.ConvNum(fCmDep   + cdsBalPatClas2.FieldByName('CMDEP').AsFloat);
         fValCtb  := AtivoFixo.ConvNum(fValCtb  + cdsBalPatClas2.FieldByName('VALCTB').AsFloat);
         iQuant   := iQuant + cdsBalPatClas2.FieldByName('QUANT').AsInteger;
         //-------------------------------------------------------------------------------
         cdsBalPatClas2.Next;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPatClas3.Append;
      cdsBalPatClas3.FieldByName('IDGRUPO').AsInteger   := qryGrpSinteticos.FieldByName('IDGRUPO').AsInteger;
      cdsBalPatClas3.FieldByName('CLASSE').AsString     := qryGrpSinteticos.FieldByName('CLASSE').AsString;
      cdsBalPatClas3.FieldByName('NOME').AsString       := qryGrpSinteticos.FieldByName('NOME').AsString;
      cdsBalPatClas3.FieldByName('TIPO').AsString       := 'S';
      cdsBalPatClas3.FieldByName('CODHIERARQ').Clear;
      cdsBalPatClas3.FieldByName('DESCRICAO').Clear;
      cdsBalPatClas3.FieldByName('ANASINT').Clear;
      cdsBalPatClas3.FieldByName('VALORG').AsCurrency   := fValOrg;
      cdsBalPatClas3.FieldByName('CMBEM').AsCurrency    := fCmBem;
      cdsBalPatClas3.FieldByName('DEPLANC').AsCurrency  := fDepLanc;
      cdsBalPatClas3.FieldByName('CMDEP').AsCurrency    := fCmDep;
      cdsBalPatClas3.FieldByName('VALCTB').AsCurrency   := fValCtb;
      cdsBalPatClas3.FieldByName('QUANT').AsInteger     := iQuant;
      //----------------------------------------------------------------------------------
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   // Mesclar e transferir para o relatório
   //-------------------------------------------------------------------------------------
   cdsBalPatClas1.First;
   while not cdsBalPatClas1.EOF do
   begin
      cdsBalPatClas.Append;
      cdsBalPatClas.FieldByName('IDGRUPO').AsInteger   := cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger;
      cdsBalPatClas.FieldByName('CLASSE').AsString     := cdsBalPatClas1.FieldByName('CLASSE').AsString;
      cdsBalPatClas.FieldByName('NOME').AsString       := cdsBalPatClas1.FieldByName('NOME').AsString;
      cdsBalPatClas.FieldByName('TIPO').AsString       := cdsBalPatClas1.FieldByName('TIPO').AsString;
      cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas1.FieldByName('CODHIERARQ').AsString;
      cdsBalPatClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas1.FieldByName('DESCRICAO').AsString;
      cdsBalPatClas.FieldByName('ANASINT').AsString    := cdsBalPatClas1.FieldByName('ANASINT').AsString;
      cdsBalPatClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas1.FieldByName('VALORG').AsCurrency;
      cdsBalPatClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas1.FieldByName('CMBEM').AsCurrency;
      cdsBalPatClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas1.FieldByName('DEPLANC').AsCurrency;
      cdsBalPatClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas1.FieldByName('CMDEP').AsCurrency;
      cdsBalPatClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas1.FieldByName('VALCTB').AsCurrency;
      cdsBalPatClas.FieldByName('QUANT').AsInteger     := cdsBalPatClas1.FieldByName('QUANT').AsInteger;
      //----------------------------------------------------------------------------------
      cdsBalPatClas1.Next;
   end;
   //-------------------------------------------------------------------------------------
   if not ckbExcluiGrpAnal.Checked then
   begin
      cdsBalPatClas2.First;
      while not cdsBalPatClas2.EOF do
      begin
         cdsBalPatClas.Append;
         cdsBalPatClas.FieldByName('IDGRUPO').AsInteger   := cdsBalPatClas2.FieldByName('IDGRUPO').AsInteger;
         cdsBalPatClas.FieldByName('CLASSE').AsString     := cdsBalPatClas2.FieldByName('CLASSE').AsString;
         cdsBalPatClas.FieldByName('NOME').AsString       := cdsBalPatClas2.FieldByName('NOME').AsString;
         cdsBalPatClas.FieldByName('TIPO').AsString       := cdsBalPatClas2.FieldByName('TIPO').AsString;
         cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas2.FieldByName('CODHIERARQ').AsString;
         cdsBalPatClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas2.FieldByName('DESCRICAO').AsString;
         cdsBalPatClas.FieldByName('ANASINT').AsString    := cdsBalPatClas2.FieldByName('ANASINT').AsString;
         cdsBalPatClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas2.FieldByName('VALORG').AsCurrency;
         cdsBalPatClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas2.FieldByName('CMBEM').AsCurrency;
         cdsBalPatClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas2.FieldByName('DEPLANC').AsCurrency;
         cdsBalPatClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas2.FieldByName('CMDEP').AsCurrency;
         cdsBalPatClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas2.FieldByName('VALCTB').AsCurrency;
         cdsBalPatClas.FieldByName('QUANT').AsInteger     := cdsBalPatClas2.FieldByName('QUANT').AsInteger;
         //-------------------------------------------------------------------------------
         cdsBalPatClas2.Next;
      end;
   end;
   //-------------------------------------------------------------------------------------
   cdsBalPatClas3.First;
   while not cdsBalPatClas3.EOF do
   begin
      cdsBalPatClas.Append;
      cdsBalPatClas.FieldByName('IDGRUPO').AsInteger   := cdsBalPatClas3.FieldByName('IDGRUPO').AsInteger;
      cdsBalPatClas.FieldByName('CLASSE').AsString     := cdsBalPatClas3.FieldByName('CLASSE').AsString;
      cdsBalPatClas.FieldByName('NOME').AsString       := cdsBalPatClas3.FieldByName('NOME').AsString;
      cdsBalPatClas.FieldByName('TIPO').AsString       := cdsBalPatClas3.FieldByName('TIPO').AsString;
      cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas3.FieldByName('CODHIERARQ').AsString;
      cdsBalPatClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas3.FieldByName('DESCRICAO').AsString;
      cdsBalPatClas.FieldByName('ANASINT').AsString    := cdsBalPatClas3.FieldByName('ANASINT').AsString;
      cdsBalPatClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas3.FieldByName('VALORG').AsCurrency;
      cdsBalPatClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas3.FieldByName('CMBEM').AsCurrency;
      cdsBalPatClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas3.FieldByName('DEPLANC').AsCurrency;
      cdsBalPatClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas3.FieldByName('CMDEP').AsCurrency;
      cdsBalPatClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas3.FieldByName('VALCTB').AsCurrency;
      cdsBalPatClas.FieldByName('QUANT').AsInteger     := cdsBalPatClas3.FieldByName('QUANT').AsInteger;
      //----------------------------------------------------------------------------------
      cdsBalPatClas3.Next;
   end;
   if cdsBalPatClas.IsEmpty then
      MsgDlg('Não existem dados com os parâmetros fornecidos!','Erro',mtError,[mbOk],0);
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryBalPat.Close;
   qryBalPat.Open;
   prgBar.Max      := cdsBalPatClas.RecordCount;
   prgBar.Position := 0;
   cdsBalPatClas.First;
   while not cdsBalPatClas.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
         Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if (cdsBalPatClas.FieldByName('VALORG').AsFloat <> 0) or
         (cdsBalPatClas.FieldByName('CMBEM').AsFloat <> 0) then
      begin
         qryBalPat.Append;
         if cdsBalPatClas.FieldByName('CODHIERARQ').AsString = '' then
         begin
            qryBalPat.FieldByName('CODHIERARQ').AsString := cdsBalPatClas.FieldByName('CLASSE').AsString;
            qryBalPat.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('NOME').AsString;
            qryBalPat.FieldByName('S_A').AsString        := cdsBalPatClas.FieldByName('TIPO').AsString;
            //----------------------------------------------------------------------------
            if qryBalPat.FieldByName('S_A').AsString = 'A' then
            begin
               with dtmAtivoFixo.qryContaSemCC do
               begin
                  ParamByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
                  ParamByName('IDGRUPO').AsInteger            := cdsBalPatClas.FieldByName('IDGRUPO').AsInteger;
                  ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 01;
                  ParamByName('TIPOLANCAMENTO').AsString      := 'D';
                  ParamByName('PLANO').AsInteger              := iPlanoVigente;
                  Open;
                  //----------------------------------------------------------------------
                  qryBalPat.FieldByName('PLACONTA').AsString := FieldByName('PLACONTA').AsString;
                  //----------------------------------------------------------------------
                  Close;
               end;
            end;
         end else
         begin
            qryBalPat.FieldByName('CODHIERARQ').Clear;
            qryBalPat.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('DESCRICAO').AsString;
            qryBalPat.FieldByName('S_A').Clear;
         end;
         qryBalPat.FieldByName('VALORG').AsCurrency   := cdsBalPatClas.FieldByName('VALORG').AsFloat;
         qryBalPat.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas.FieldByName('CMBEM').AsFloat;
         qryBalPat.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas.FieldByName('DEPLANC').AsFloat;
         qryBalPat.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas.FieldByName('CMDEP').AsFloat;
         qryBalPat.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas.FieldByName('VALCTB').AsFloat;
         qryBalPat.FieldByName('QUANT').AsCurrency    := cdsBalPatClas.FieldByName('QUANT').AsFloat;
         //-------------------------------------------------------------------------------
         qryBalPat.Post;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      cdsBalPatClas.Next;
   end;
   cdsBalPatClas.CancelUpdates;
   cdsBalPatClas1.CancelUpdates;
   cdsBalPatClas2.CancelUpdates;
   cdsBalPatClas3.CancelUpdates;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelBalCaf.ppDBText101.DisplayFormat := sMascaraClasse;
   dtmRelBalCaf.ppLabel105.Caption        := dtedFim.Text;
   sqlBalPatClas.UnPrepare;
   sqlBalPatClas1.UnPrepare;
   sqlBalPatClas2.UnPrepare;
   sqlBalPatClas3.UnPrepare;
   Screen.Cursor := crDefault;
end;

end.
