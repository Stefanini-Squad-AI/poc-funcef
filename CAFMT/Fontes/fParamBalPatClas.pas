unit fParamBalPatClas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, DBTables, Db,
  Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamBalPatClas = class(TfrmOkCancelar)
    qryClasAnaliticos: TwwQuery;
    qryClasseIni: TwwQuery;
    qryParamCaf: TwwQuery;
    qryClasSinteticos: TwwQuery;
    qryBalPatClas: TwwQuery;
    updBalPatClas: TUpdateSQL;
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    Label3: TLabel;
    dblckCmbClasseIni: TwwDBLookupCombo;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    prgbar: TProgressBar;
    qryParamCafMASCARACLASSE: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    qryClasseIniCODHIERARQ: TStringField;
    qryClasseIniDESCRICAO: TStringField;
    qryClasseIniIDCLASSEBEM: TFloatField;
    qryClasSinteticosCODHIERARQ: TStringField;
    qryClasSinteticosDESCRICAO: TStringField;
    qryBalPatClasCODHIERARQ: TStringField;
    qryBalPatClasDESCRICAO: TStringField;
    qryBalPatClasS_A: TStringField;
    qryBalPatClasQUANT: TFloatField;
    qryBalPatClasVALORG: TFloatField;
    qryBalPatClasCMBEM: TFloatField;
    qryBalPatClasDEPLANC: TFloatField;
    qryBalPatClasCMDEP: TFloatField;
    qryBalPatClasVALCTB: TFloatField;
    qryClasAnaliticosCODHIERARQ: TStringField;
    qryClasAnaliticosDESCRICAO: TStringField;
    qryClasAnaliticosANASINT: TStringField;
    qryClasAnaliticosVALORG0: TFloatField;
    qryClasAnaliticosCMBEM0: TFloatField;
    qryClasAnaliticosDEPLANC0: TFloatField;
    qryClasAnaliticosCMDEP0: TFloatField;
    qryClasAnaliticosVALCTB0: TFloatField;
    qryClasAnaliticosQUANT: TFloatField;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    ckbSinteticos: TCheckBox;
    ckbBaixados: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckCmbClasseIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iClasseIni, iClasseFim : Integer;
    sMascaraClasse         : String;

  end;

var
  frmParamBalPatClas: TfrmParamBalPatClas;

implementation

uses dRelBalCaf, uSistema, uMensErro, uAtivoFixo;

{$R *.DFM}

procedure TfrmParamBalPatClas.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   if not qryClasseIni.Prepared then
      qryClasseIni.Prepare;
   if not qryClasAnaliticos.Prepared then
      qryClasAnaliticos.Prepare;
   //-------------------------------------------------------------------------------------
   qryClasseIni.Open;
   iClasseIni := 0;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamCaf.Open;
   sMascaraClasse := qryParamCafMASCARACLASSE.AsString;
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
procedure TfrmParamBalPatClas.dblckCmbClasseIniExit(Sender: TObject);
begin
   inherited;
   if (dblckcmbClasseIni.Text = '') then
   begin
      iClasseIni := 0;
   end else
   begin
      iClasseIni := qryClasseIniIDCLASSEBEM.AsInteger;
   end;
end;
//========================================================================================
procedure TfrmParamBalPatClas.bbtnConfirmarClick(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Double;
   qryBalPat                                  : TwwQuery;
   iTam, iQuant                               : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   qryBalPat := TwwQuery(dtmRelBalCaf.qryBalPatClas);
   //-------------------------------------------------------------------------------------
   qryBalPatClas.Open;
   pnlStatus.Visible := True;
   lblStatus.Caption := 'Processando Classes Analíticas ...';
   Application.ProcessMessages;
   qryClasAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula as Classes Analiticas
   //-------------------------------------------------------------------------------------
   if iClasseIni <> 0 then
   begin
      qryClasAnaliticos.SQL.Strings[32] := 'AND (B.IDCLASSEBEM = '+IntToStr(iClasseIni)+')';
   end else
   begin
      qryClasAnaliticos.SQL.Strings[32] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if ckbCtlFisico.Checked then
   begin
      qryClasAnaliticos.SQL.Strings[33] := ' ';
   end else
   begin
      qryClasAnaliticos.SQL.Strings[33] := ' AND (B.CONTROLE = ''T'') ';
   end;
   //-------------------------------------------------------------------------------------
   if ckbBaixados.Checked then
   begin
      qryClasAnaliticos.SQL.Strings[34] := ' ';
   end else
   begin
      qryClasAnaliticos.SQL.Strings[34] := ' AND (B.BAIXATOTAL <> ''S'') ';
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
      if qryBalPatClas.Locate('CODHIERARQ',qryClasAnaliticosCODHIERARQ.AsString,[]) then
      begin
         while (not qryClasAnaliticos.EOF) and (qryClasAnaliticosCODHIERARQ.AsString = qryBalPatClasCODHIERARQ.AsString) do
         begin
            qryBalPatClas.Edit;
            qryBalPatClasVALORG.AsCurrency  := AtivoFixo.ConvNum(qryBalPatClasVALORG.AsFloat  + qryClasAnaliticosVALORG0.AsFloat);
            qryBalPatClasCMBEM.AsCurrency   := AtivoFixo.ConvNum(qryBalPatClasCMBEM.AsFloat   + qryClasAnaliticosCMBEM0.AsFloat);
            qryBalPatClasDEPLANC.AsCurrency := AtivoFixo.ConvNum(qryBalPatClasDEPLANC.AsFloat + qryClasAnaliticosDEPLANC0.AsFloat);
            qryBalPatClasCMDEP.AsCurrency   := AtivoFixo.ConvNum(qryBalPatClasCMDEP.AsFloat   + qryClasAnaliticosCMDEP0.AsFloat);
            qryBalPatClasVALCTB.AsCurrency  := AtivoFixo.ConvNum(qryBalPatClasVALCTB.AsFloat  + qryClasAnaliticosVALCTB0.AsFloat);
            qryBalPatClasQUANT.AsInteger    := qryBalPatClasQUANT.AsInteger + qryClasAnaliticosQUANT.AsInteger;
            //----------------------------------------------------------------------------
            prgBar.Position := prgBar.Position + 1;
            Application.ProcessMessages;
            qryClasAnaliticos.Next;
         end;
      end else
      begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages;
         qryClasAnaliticos.Next;
      end;
   end;
   qryClasAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Processando Classes Sintéticas ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula as Classes Sintéticas
   //-------------------------------------------------------------------------------------
   qryClasSinteticos.Open;
   prgBar.Max      := qryClasSinteticos.RecordCount;
   prgBar.Position := 0;
   while not qryClasSinteticos.EOF do
   begin
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      iTam     := length(qryClasSinteticosCODHIERARQ.AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      iQuant   := 0;
      //----------------------------------------------------------------------------------
      qryBalPatClas.Locate('CODHIERARQ',qryClasSinteticosCODHIERARQ.AsString,[loPartialKey]);
      while (not qryBalPatClas.EOF) and
            (copy(qryBalPatClasCODHIERARQ.AsString,1,iTam) = qryClasSinteticosCODHIERARQ.AsString) do
      begin
         fValOrg  := AtivoFixo.ConvNum(fValOrg  + qryBalPatClasVALORG.AsFloat);
         fCmBem   := AtivoFixo.ConvNum(fCmBem   + qryBalPatClasCMBEM.AsFloat);
         fDepLanc := AtivoFixo.ConvNum(fDepLanc + qryBalPatClasDEPLANC.AsFloat);
         fCmDep   := AtivoFixo.ConvNum(fCmDep   + qryBalPatClasCMDEP.AsFloat);
         fValCtb  := AtivoFixo.ConvNum(fValCtb  + qryBalPatClasVALCTB.AsFloat);
         iQuant   := iQuant   + qryBalPatClasQUANT.AsInteger;
         qryBalPatClas.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBalPatClas.Locate('CODHIERARQ',qryClasSinteticosCODHIERARQ.AsString,[]);
      qryBalPatClas.Edit;
      qryBalPatClasVALORG.AsCurrency  := fValOrg;
      qryBalPatClasCMBEM.AsCurrency   := fCmBem;
      qryBalPatClasDEPLANC.AsCurrency := fDepLanc;
      qryBalPatClasCMDEP.AsCurrency   := fCmDep;
      qryBalPatClasVALCTB.AsCurrency  := fValCtb;
      qryBalPatClasQUANT.AsInteger    := iQuant;
      //----------------------------------------------------------------------------------
      qryClasSinteticos.Next;
   end;
   qryClasSinteticos.Close;
   //-------------------------------------------------------------------------------------
   if qryBalPatClas.IsEmpty then
      MsgDlg('Não existem dados com os parâmetros fornecidos!','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryBalPat.Close;
   qryBalPat.Open;
   prgBar.Max      := qryBalPatClas.RecordCount;
   prgBar.Position := 0;
   qryBalPatClas.First;
   while not qryBalPatClas.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
         Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if (ckbTodos.Checked) or
         (((qryBalPatClasVALORG.AsFloat + qryBalPatClasCMBEM.AsFloat) -
           (qryBalPatClasDEPLANC.AsFloat + qryBalPatClasCMDEP.AsFloat) <> 0)) then
      begin
         if (not ckbSinteticos.Checked) or
            ((ckbSinteticos.Checked) and (qryBalPatClasS_A.AsString = 'S')) then
         begin
            qryBalPat.Insert;
            qryBalPat.FieldByName('CODHIERARQ').AsString := qryBalPatClasCODHIERARQ.AsString;
            qryBalPat.FieldByName('DESCRICAO').AsString  := qryBalPatClasDESCRICAO.AsString;
            qryBalPat.FieldByName('S_A').AsString        := qryBalPatClasS_A.AsString;
            qryBalPat.FieldByName('VALORG').AsCurrency   := qryBalPatClasVALORG.AsFloat;
            qryBalPat.FieldByName('CMBEM').AsCurrency    := qryBalPatClasCMBEM.AsFloat;
            qryBalPat.FieldByName('DEPLANC').AsCurrency  := qryBalPatClasDEPLANC.AsFloat;
            qryBalPat.FieldByName('CMDEP').AsCurrency    := qryBalPatClasCMDEP.AsFloat;
            qryBalPat.FieldByName('VALCTB').AsCurrency   := qryBalPatClasVALCTB.AsFloat;
            qryBalPat.FieldByName('QUANT').AsCurrency    := qryBalPatClasQUANT.AsFloat;
            qryBalPat.Post;
         end;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryBalPatClas.Next;
   end;
   qryBalPatClas.CancelUpdates;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelBalCaf.rpBalPatClasDBTEXT1.DisplayFormat := sMascaraClasse;
   dtmRelBalCaf.rpBalPatClasLabelData.Caption     := dtedFim.Text;
   Screen.Cursor := crDefault;
end;

end.
