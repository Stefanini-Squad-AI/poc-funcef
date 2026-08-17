unit FParamEmisEtiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, CMDBLookupCombo, Db,
  DBTables, Wwdatsrc, ppDB, ppDBBDE, ppBands, ppCache,
  ppClass, ppComm, ppProd, ppReport, ppTypes, uMensErro, uDataBase,
  ppDBPipe, ppRelatv, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamEmisEtiq = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryplanass: TwwQuery;
    qrySitPart: TwwQuery;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dbcmbPatro: TCMDBLookupCombo;
    dbcmbPlano: TCMDBLookupCombo;
    dbcmbPlanAss: TCMDBLookupCombo;
    Label7: TLabel;
    dbcmbSitPart: TCMDBLookupCombo;
    GpbEtiq: TGroupBox;
    MemReports: TMemo;
    CkbMatricial: TCheckBox;
    CmbModeloEtiq: TCMDBLookupCombo;
    rgrpTipoEnd: TRadioGroup;
    QryEtiqParticip: TwwQuery;
    GpDataInscr: TGroupBox;
    Label3: TLabel;
    DtInscAssIni: TCMDateTimePicker;
    DtInscAssFin: TCMDateTimePicker;
    GpMatricula: TGroupBox;
    Label10: TLabel;
    EdtMatIni: TEdit;
    EdtMatFin: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DtInscPrevIni: TCMDateTimePicker;
    DtInscPrevFin: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    RptEtiq: TppReport;
    RptEtiqHeaderBand1: TppHeaderBand;
    RptEtiqDetailBand1: TppDetailBand;
    RptEtiqFooterBand1: TppFooterBand;
    PpEtiq: TppBDEPipeline;
    qryReports: TwwQuery;
    qryReportsTEMPLATE: TBlobField;
    QryModelo: TwwQuery;
    QryModeloMODELOETIQ: TStringField;
    QryModeloIDETIQUETA: TFloatField;
    QryModeloIDREPORTS: TFloatField;
    QryModeloORIGEMCM: TFloatField;
    DsEtiq: TwwDataSource;
    RptEtiqColumnHeaderBand1: TppColumnHeaderBand;
    RptEtiqColumnFooterBand1: TppColumnFooterBand;
    EdInscAssIni: TEdit;
    EdInscAssFin: TEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    function ValidaDados: Boolean;
  private
    { Private declarations }
    function PreencheQRY: Boolean;
  public
    { Public declarations }
  end;

var
  frmParamEmisEtiq: TfrmParamEmisEtiq;

implementation

{$R *.DFM}

Uses uEtiquetaCM, uModeloRelatCM, uSistema, uFuncaoGeral;

function TFrmParamEmisEtiq.PreencheQRY: Boolean;
Var sSql,
    sIdEndereco : String;
Begin
  case rgrpTipoEnd.ItemIndex of
       0 : sIdEndereco := 'IDENDCORRESP';
       1 : sIdEndereco := 'IDENDCOMERCIAL';
       2 : sIdEndereco := 'IDENDENTREGA';
       3 : sIdEndereco := 'IDENDRESIDENCIAL';
       4 : sIdEndereco := 'IDENDCOBRANCA';
       else sIdEndereco := 'IDENDCOBRANCA';
  end;

  try
    Screen.Cursor := CrHourGlass;

    ssql:=  'SELECT  DISTINCT P.NOME, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, '+
            'E.BAIRRO, E.CEP, C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS '+
            'FROM CIDADES C,ESTADO ES, ELEGPATRO EL, PARTASS, PESSOA P, PLANASS, '+
            'SITPLANOASS, PESSOA P2, PLANPREV PR, PARTPREVPLAN PREV, '+
	    'ENDPESS E, PAIS PA '+
            'WHERE ' +
            FuncaoGeral.Decode(Trim(EdtMatIni.Text)     ,'','', ' (EL.MATRICULA >= ''' + EdtMatIni.Text + ''') AND ') +
            FuncaoGeral.Decode(Trim(EdtMatFin.Text)     ,'','', ' (EL.MATRICULA <= ''' + EdtMatFin.Text + ''') AND ') +
            FuncaoGeral.Decode(Trim(EdInscAssIni.Text)  ,'','', ' (PARTASS.INSCRICAONUMERO >= ' + EdInscAssIni.Text + ') AND ') +
            FuncaoGeral.Decode(Trim(EdInscAssFin.Text)  ,'','', ' (PARTASS.INSCRICAONUMERO >= ' + EdInscAssFin.Text + ') AND ') +
            FuncaoGeral.Decode(Trim(DtInscPrevIni.Text) ,'','', ' (PREV.INSCRICAODATA >= TO_DATE(''' + DtInscPrevIni.Text + ''',''DD/MM/YY'')) AND ') +
            FuncaoGeral.Decode(Trim(DtInscPrevFin.Text) ,'','', ' (PREV.INSCRICAODATA >= TO_DATE(''' + DtInscPrevFin.Text + ''',''DD/MM/YY'')) AND ') +
            FuncaoGeral.Decode(Trim(DtInscAssIni.Text)  ,'','', ' (PARTASS.DATAENTRADA >= TO_DATE(''' + DtInscAssIni.Text + ''',''DD/MM/YY'')) AND ') +
            FuncaoGeral.Decode(Trim(DtInscAssFin.Text)  ,'','', ' (PARTASS.DATAENTRADA >= TO_DATE(''' + DtInscAssFin.Text + ''',''DD/MM/YY'')) AND ') +
            FuncaoGeral.Decode(Trim(dbcmbSitPart.Text)  ,'','', ' (SITPLANOASS.IDSITPLANOASS = ' + dbcmbSitPart.LookupValue + ') AND ') +
            FuncaoGeral.Decode(Trim(dbcmbPatro.Text)    ,'','', ' (PARTASS.IDPESSJUR = ' + dbcmbPatro.LookupValue + ') AND ') +
            FuncaoGeral.Decode(Trim(dbcmbPlanAss.Text)  ,'','', ' (PARTASS.IDPLANASS = ' + dbcmbPlanAss.LookupValue + ') AND ') +
            FuncaoGeral.Decode(Trim(dbcmbPlano.Text)    ,'','', ' (PARTASS.IDPLANOPREV = ' + dbcmbPlano.LookupValue + ') AND ') +
            ' (P.'+sIdEndereco+' = E.IDENDERECO) AND  ' +
            ' (PARTASS.IDPESSJUR = P2.IDPESSOA) AND'+
            ' (P2.IDPESSOA = EL.IDPESSJUR) AND'+
            ' (EL.IDPESSJUR = PARTASS.IDPESSJUR) AND'+
            ' (EL.IDPESSOA = P.IDPESSOA) AND'+
            ' (PLANASS.IDPLANASS = PARTASS.IDPLANASS) AND'+
            ' (SITPLANOASS.IDSITPLANOASS = PARTASS.IDSITPART) AND'+
            ' (PARTASS.IDPLANOPREV = PR.IDPLANOPREV) AND'+
            ' (PARTASS.IDPESSOA = EL.IDPESSOA) AND'+
            ' (PREV.IDPESSOA = PARTASS.IDPESSOA) AND'+
            ' (PREV.IDPESSJUR = PARTASS.IDPESSJUR) AND'+
            ' (E.IDCIDADES=C.IDCIDADES) AND'+
            ' (C.IDESTADO=ES.IDESTADO) AND'+
            ' (ES.IDPAIS=PA.IDPAIS) AND'+
            ' (PREV.IDPLANOPREV = PARTASS.IDPLANOPREV) ';

    Result := Fazquery(qryEtiqParticip,ssql);
  finally
    Screen.Cursor := CrDefault;
  end;
End;

procedure TfrmParamEmisEtiq.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Open;
  qryPlano.Open;
  qryPlanAss.Open;
  qrySitPart.Open;
  qryModelo.Open;
end;

procedure TfrmParamEmisEtiq.bbtnConfirmarClick(Sender: TObject);
Var
  sAtencao: String;
  MemReports :TMemo;
begin
  inherited;
  MemReports := TMemo.Create(Self);
  try
    MemReports.parent  := Self;
    MemReports.Visible := False;
    Application.ProcessMessages;

    if ValidaDados then
    begin
       if PreencheQRY Then
       begin
         if CkbMatricial.Checked Then
         begin
            EtiquetaCm := TEtiquetaCm.Create;
            EtiquetaCm.ModeloEtiq := StrToInt(CmbModeloEtiq.LookupValue);
            EtiquetaCm.Imprime(qryEtiqParticip,sAtencao);
            EtiquetaCm.Free;
            ModalResult :=  MrCancel;
         end
         else
         begin
            qryReports.Close;
            if Not qryReports.Prepared Then
               qryReports.Prepare;
            qryReports.Params[0].AsInteger := QryModeloIDREPORTS.AsInteger;
            qryReports.Params[1].AsInteger := QryModeloORIGEMCM.AsInteger;
            qryReports.Open;
            MemReports.Lines.Clear;
            MemReports.Lines.Text := qryReportsTEMPLATE.AsString;
            //Substitui o Pipeline do Template pelo Pipeline do Report
            ModeloRelatCM.SetaDataPipeline('FrmParamEmisEtiq','PpEtiq','FrmConfigEtiq','ppConsulta',MemReports);
            MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmEtiqueta);

            RptEtiq.Template.Format   := ftASCII;
            RptEtiq.Template.Saveto   := stFile;
            RptEtiq.Template.FileName := Sistema.TempDir + ArqCmEtiqueta;
            RptEtiq.Template.LoadFromFile;
            RptEtiq.Print;
         End;
       end
       else
       Begin
         Msgdlg('Não há registros para serem impressos.','Atenção',MtWarning,[MbOk],0);
       End;
    End;
  finally
    MemReports.Free;
  end;
end;

procedure TfrmParamEmisEtiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
  qryPlano.Close;
  qryPlanAss.Close;
  qrySitPart.Close;
  qryModelo.Close;

end;

procedure TfrmParamEmisEtiq.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CmbModeloEtiq.Text:='';
  CkbMatricial.Checked:=False;
  EdtMatIni.Text:='';
  EdtMatFin.Text:='';
  EdInscAssIni.Text:='';
  EdInscAssFin.Text:='';
  DtInscPrevIni.Text:='';
  DtInscPrevFin.Text:='';
  DtInscAssIni.Text:='';
  DtInscAssFin.Text:='';
  dbcmbPatro.Text:='';
  dbcmbPlanAss.Text:='';
  dbcmbPlano.Text:='';
  dbcmbSitPart.Text:='';
end;

function TfrmParamEmisEtiq.ValidaDados: Boolean;
begin
   Result:=True;

   // Critica Modelo de Etiqueta
   if CmbModeloEtiq.Text = ''  Then
   begin
     MsgDlg('Favor informar o modelo de etiqueta','Erro',MtError,[MbOk],0);
     Result:=False;
     CmbModeloEtiq.SetFocus;
     exit;
   end;

   // Critica Matrícula inicial maior que a matrícula final
   if Trim(EdtMatFin.Text) <> '' then
   begin
     if Trim(EdtMatIni.Text) > Trim(EdtMatFin.Text) then
     begin
       Msgdlg('Matrícula inicial maior que matrícula final.','Erro',MtError,[MbOk],0);
       Result:=False;
       exit;
     end;
   end;

   // Critica Matrícula inicial não preenchida
   if (Trim(EdtMatIni.Text) = '') and (Trim(EdtMatFin.Text) <> '') then
   begin
     Msgdlg('Falta Matrícula inicial.','Erro',MtError,[MbOk],0);
     Result:=False;
     exit;
   end;

   // Critica Matrícula Assistencial inicial maior que a Matrícula Assistencial final
   if Trim(EdInscAssFin.Text) <> '' then
   begin
     if Trim(EdInscAssIni.Text) > Trim(EdInscAssFin.Text) then
     begin
       Msgdlg('Matrícula Assistencial inicial maior que Matrícula Assistencial final.','Erro',MtError,[MbOk],0);
       Result:=False;
       exit;
     end;
   end;

   // Critica Matrícula Assistencial inicial não preenchida
   if (Trim(EdInscAssIni.Text) = '') and (Trim(EdInscAssFin.Text) <> '') then
   begin
     Msgdlg('Falta Matrícula Assistencial inicial.','Erro',MtError,[MbOk],0);
     Result:=False;
     exit;
   end;

   // Critica Data de Insc. Previdenciária inicial maior que a Data de
   // Insc. Previdenciária final
   if Trim(DtInscPrevFin.Text) <> '' then
   begin
     if Trim(DtInscPrevIni.Text) > Trim(DtInscPrevFin.Text) then
     begin
       Msgdlg('Data de Insc. Previdenciária inicial maior que Data de Insc. Previdenciária final.','Erro',MtError,[MbOk],0);
       Result:=False;
       exit;
     end;
   end;

   // Critica Data de Insc. Previdenciária inicial não preenchida
   if (Trim(DtInscPrevIni.Text) = '') and (Trim(DtInscPrevFin.Text) <> '') then
   begin
     Msgdlg('Falta Data de Insc. Previdenciária inicial.','Erro',MtError,[MbOk],0);
     Result:=False;
     exit;
   end;

   // Critica Data de Inscrição Assistencial inicial maior que a Data de
   // Inscrição Assistencial final
   if Trim(DtInscAssFin.Text) <> '' then
   begin
     if Trim(DtInscAssIni.Text) > Trim(DtInscAssFin.Text) then
     begin
       Msgdlg('Data de Insc. Assistencial inicial maior que a Data de Insc. Assistencial final.','Erro',MtError,[MbOk],0);
       Result:=False;
       exit;
     end;
   end;

   // Critica Data de Insc. Assistencial inicial não preenchida
   if (Trim(DtInscAssIni.Text) = '') and (Trim(DtInscAssFin.Text) <> '') then
   begin
     Msgdlg('Falta Data de Insc. Assistencial inicial.','Erro',MtError,[MbOk],0);
     Result:=False;
     exit;
   end;

end;

end.
