unit FCadEventAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMulti, StdCtrls, Db, DBTables, Wwquery, wwdblook, cmseldlg, wwidlg, Wwdatsrc,
  DBCtrls, MAHlpBtn, Buttons,  ComCtrls, ToolWin, ExtCtrls, Mask, wwdbedit,
  MskEdDlg, OpenArqText, TB97, TREdit, URegra, MontaSelect, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadEventAssist = class(TfrmCadastroMulti)
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    qryplanoprev: TwwQuery;
    dsplanoprev: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qryevent: TwwQuery;
    qrytit: TwwQuery;
    dstit: TwwDataSource;
    qrydepend: TwwQuery;
    dsdepend: TwwDataSource;
    dsevent: TwwDataSource;
    qrycadevent: TwwQuery;
    Panel3: TPanel;
    Label10: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBLkpCmbevent: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DateEdit3: TCMDateTimePicker;
    DateEdit4: TCMDateTimePicker;
    Label9: TLabel;
    dblkpcmbdepend: TwwDBLookupCombo;
    dbediddep: TwwDBEdit;
    dbedidtit: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Qryprocura: TwwQuery;
    DBLookupComboBox1: TwwDBLookupCombo;
    dsprocura: TwwDataSource;
    sbtnimport: TSpeedButton;
    qryoper: TwwQuery;
    dbedvalevento: TRealEdit;
    wwDBEdit1: TRealEdit;
    Regra: TRegra;
    qryregrapag: TwwQuery;
    qryaux: TwwQuery;
    qryaux2: TwwQuery;
    qryregracomiss: TwwQuery;
    qryregrareemb: TwwQuery;
    BitBtn2: TBitBtn;
    montaSel: TMontaSelect;
    MontaSelProc: TMontaSelect;
    Label8: TLabel;
    edfilial: TEdit;
    qrycadeventIDTITULAR: TFloatField;
    qrycadeventIDPLANASS: TFloatField;
    qrycadeventDATAEVENT: TDateTimeField;
    qrycadeventIDSERVASS: TFloatField;
    qrycadeventIDPESSJUR: TFloatField;
    qrycadeventIDPLANOPREV: TFloatField;
    qrycadeventIDDEPENDENTE: TFloatField;
    qrycadeventESTATISTICA: TStringField;
    qrycadeventVALOREVENT: TFloatField;
    qrycadeventVALORPAGO: TFloatField;
    qrycadeventDATAPAG: TDateTimeField;
    qrycadeventFLGREEMBOLSO: TFloatField;
    qrycadeventVALORPAGAMENTO: TFloatField;
    qrycadeventVALORRECEBIMENTO: TFloatField;
    qrycadeventVALORREEMBOLSO: TFloatField;
    qrycadeventFLGCOB: TFloatField;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    qryplanassIDPLANASS: TFloatField;
    qryplanassNOME: TStringField;
    qryplanassIDFORNSERV: TFloatField;
    qryplanoprevIDPLANOPREV: TFloatField;
    qryplanoprevNOME: TStringField;
    //procedure DBLkpCmbpatroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure DBLkpCmbprevExit(Sender: TObject);
    //procedure DBLkpCmbpassExit(Sender: TObject);
    procedure DBLkpCmbTitExit(Sender: TObject);
    procedure dblkpcmbdepend2Exit(Sender: TObject);
    procedure qrycadeventBeforePost(DataSet: TDataSet);
    procedure DBLkpCmbeventExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure wwDBEdit1Click(Sender: TObject);
    procedure qrycadeventAfterPost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    //procedure DBLkpCmbpatroChange(Sender: TObject);
    //procedure DBLkpCmbprevChange(Sender: TObject);
    procedure qryplanassBeforeOpen(DataSet: TDataSet);
    procedure qryplanoprevBeforeOpen(DataSet: TDataSet);
    procedure qrycadeventAfterScroll(DataSet: TDataSet);
    procedure PreencheTela;
    procedure qrycadeventBeforeEdit(DataSet: TDataSet);
    procedure qrycadeventBeforeInsert(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qrycadeventAfterEdit(DataSet: TDataSet);
    procedure qryplanassAfterOpen(DataSet: TDataSet);
    procedure qryplanoprevAfterOpen(DataSet: TDataSet);
    procedure qrycadeventAfterInsert(DataSet: TDataSet);
    procedure DateEdit3Exit(Sender: TObject);
    procedure DateEdit4Exit(Sender: TObject);
    procedure sbtnInserirMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure qryeventBeforeOpen(DataSet: TDataSet);
    procedure wwDBEdit1Exit(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnimportClick(Sender: TObject);
    procedure DateEdit3Click(Sender: TObject);
    procedure DateEdit4Click(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure AlteraFornServPlanAss;
    procedure ExecutaRegras;
    procedure DBLkpCmbeventCloseUp(Sender: TObject; LookupTable,
              FillTable: TDataSet; modified: Boolean);
    procedure DBLkpCmbeventEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    mes: string;
    {valorpag, valorcomiss,} valortotpag, valortotcomiss: real;
    pagamento, comissao, reembolso: real;
  public
    IIDTIT, idtitular,iddependente, idplanass, idplanoprev, idpessjur: integer;
    Estado: TDataSetState;
    iiddependente, iidservass, dataevent: String;

    { Public declarations }
  end;

var
  frmCadEventAssist: TfrmCadEventAssist;
  cAux: char;

implementation

uses
  FPrincipal, UDataBase, USistema, DBaseDados, UMensErro, FTelaAut, UAdmAss;

{$R *.DFM}

procedure TfrmCadEventAssist.PreencheTela;
begin
  {qrypatro.Locate('idpessoa', iidpatrocin, [loPartialKey]);
  qrypatro.open;

  qryplanoprev.close;
  qryplanoprev.parambyname('idpessoa').AsInteger := iidpatrocin;
  {DBLkpCmbprev.lookupfield := 'idplanoprev';
  with DBLkpCmbprev  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qryplanoprev.open;

  qryplanass.close;
  qryplanass.parambyname('idpessjur').AsInteger := iidpatrocin;
  qryplanass.parambyname('idplanoprev').AsInteger := iidplanoprev;
  {DBLkpCmbpass.lookupfield := 'IDPLANass';
  with DBLkpCmbpass  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qryplanass.open;}

  qrytit.close;
  qrytit.parambyname('idpessjur').AsInteger := iidpatrocin;
  qrytit.parambyname('idplanoprev').AsInteger := iidplanoprev;
  qrytit.parambyname('idplanass').AsInteger := iidplanass;
  qrytit.parambyname('idpessoa').AsInteger := iidparticipante;
  //FCadEventassist.dblkpcmbtit.lookupfield  := 'idpessfis';
  qrytit.open;
  edit1.text := qrytit.fieldbyname('nome').AsString;
  edfilial.text := qrytit.fieldbyname('filial').AsString;

  qrydepend.close;
  qrydepend.parambyname('idpessjur').AsInteger := iidpatrocin;
  qrydepend.parambyname('idplanoprev').AsInteger := iidplanoprev;
  qrydepend.parambyname('idplanass').AsInteger := iidplanass;
  qrydepend.parambyname('idpessoa').AsInteger := iidparticipante;
  dblkpcmbdepend.lookupfield  := 'idpessoa';
  with dblkpcmbdepend  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qrydepend.open;
  qryevent.close;
  qryevent.open;
end;

{procedure TFCadEventAssist.DBLkpCmbpatroExit(Sender: TObject);
begin
  inherited;
  qryplanoprev.close;
  qryplanoprev.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  DBLkpCmbprev.lookupfield := 'idplanoprev';
  with DBLkpCmbprev  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qryplanoprev.open;
end;}

procedure TfrmCadEventAssist.FormCreate(Sender: TObject);
begin
  //  inherited;

  //qrycadevent.Prepare;
  qrypatro.prepare;
  qryplanass.prepare;
  qryplanoprev.Prepare;

  //qrypatro.open;
  //qryplanoprev.open;
  //qryplanass.open;
  //qryevent.open;
  //DBEddata.Text := datetostr(date);
  //dbnav.visible := false;
end;

{procedure TFCadEventAssist.DBLkpCmbprevExit(Sender: TObject);
begin
  inherited;
  qryplanass.close;
  qryplanass.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  qryplanass.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  DBLkpCmbpass.lookupfield := 'IDPLANass';
  with DBLkpCmbpass  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qryplanass.open;
end;}

{procedure TFCadEventAssist.DBLkpCmbpassExit(Sender: TObject);
begin
  inherited;
  if BitBtn1.enabled = true then
  begin
    BitBtn1.enabled := false;
    qryevent.close;
    qryevent.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
    dblkpcmbevent.lookupfield := 'idSERVASS';
    with dblkpcmbevent  do
    begin
      Selected.Clear;
      Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
    end;
    qryevent.open;
  end;
  BitBtn1.enabled :=true;
end;}

procedure TfrmCadEventAssist.DBLkpCmbTitExit(Sender: TObject);
begin
  inherited;
  qrydepend.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  qrydepend.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  qrydepend.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
  qrydepend.parambyname('idpessoa').AsInteger := qrytit.fieldbyname('idpessoa').AsInteger;
  dblkpcmbdepend.lookupfield  := 'idpessoa';
  with dblkpcmbdepend  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qrydepend.open;
end;

procedure TfrmCadEventAssist.dblkpcmbdepend2Exit(Sender: TObject);
begin
  inherited;
  qryevent.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
  dblkpcmbevent.lookupfield := 'idSERVASS';
  with dblkpcmbevent do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qryevent.open;
end;

procedure TfrmCadEventAssist.qrycadeventBeforePost(DataSet: TDataSet);
begin
  inherited;

  {estado := ds.dataset.State;

  if  (dateedit3.text <> '' ) then
  begin
    qrycadevent.fieldbyname('DATAEVENT').AsDateTime := strtodatetime(DateEdit3.text + timetostr(time));
  end;

  if dateedit4.text <> '' then
  begin
    qrycadevent.fieldbyname('DATAPAG').AsDatetime := strtodatetime(DateEdit4.text + timetostr(time));
  end;

  qrycadevent.fieldbyname('VALOREVENT').AsString := trim(dbedvalevento.text);

  if estado = dsinsert then
  begin
    qrycadevent.fieldbyname('idtitular').AsInteger := iidparticipante;
    qrycadevent.fieldbyname('idplanass').AsInteger := iidplanass;
    qrycadevent.fieldbyname('idplanoprev').AsInteger := iidplanoprev;
  end;

  BitBtn2.ENABLED := false;
  dblkpcmbdepend.ReadOnly := true;
  DBLkpCmbevent.readonly := true;
  DateEdit3.readonly := true;
  dbedvalevento.readonly := true;
  DateEdit4.readonly := true;
  wwDBEdit1.readonly := true;
  DateEdit4.enabled := false;}
end;

procedure TfrmCadEventAssist.DBLkpCmbeventExit(Sender: TObject);
begin
  inherited;
  //DBEddata.Text := datetostr(date);
end;

procedure TfrmCadEventAssist.BitBtn1Click(Sender: TObject);
begin
  //iidtit := PedeParticipanteAssistencial( iidplanass, iidplanoprev, iidpatrocin, 'Título');

  try
     MontaSel.Executar;
     
     if MontaSel.RetornouValor then
     begin
       iIdParticipante := strtoint(Montasel.ValoresChave[0]);
       iIdPlanoprev := strtoint(Montasel.ValoresChave[2]);
       iIdPlanass := strtoint(Montasel.ValoresChave[1]);
       iIdPatrocin := strtoint(Montasel.ValoresChave[3]);

       qrycadevent.close;
       qrycadevent.sql.clear;
       qrycadevent.sql.add
         ('SELECT IDTITULAR, IDPLANASS, DATAEVENT, IDSERVASS, IDPESSJUR, IDPLANOPREV, '+
                ' IDDEPENDENTE, ESTATISTICA, VALOREVENT, VALORPAGO, DATAPAG, FLGREEMBOLSO, '+
                ' VALORPAGAMENTO, VALORRECEBIMENTO, VALORREEMBOLSO, FLGCOB '+
           ' FROM '+Sistema.PrefixoServidor+'EVENTASS '+
          ' WHERE (IDPLANASS = '+inttostr(iidplanass)+') AND '+
                ' (IDPLANOPREV = '+inttostr(iidplanoprev)+') AND '+
                ' (IDPESSJUR = '+inttostr(iidpatrocin)+') AND '+
                ' (IDTITULAR = '+inttostr(iidparticipante)+')');
       qrycadevent.open;

       qrypatro.open;
       qrypatro.Locate('idpessoa', iidpatrocin, [loPartialKey]);
       DBLookupComboBox1.text := qrypatro.fieldbyname('nome').AsString;

       qryplanoprev.open;
       qryplanoprev.Locate('idplanoprev', iidplanoprev, [loPartialKey]);
       wwDBLookupCombo1.text := qryplanoprev.fieldbyname('NOME').AsString;

       qryplanass.open;
       qryplanass.Locate('idplanass', iidplanass, [loPartialKey]);
       wwDBLookupCombo2.text := qryplanass.fieldbyname('NOME').AsString;

       dblkpcmbdepend.enabled := true;
       DBLkpCmbevent.enabled := true;
       DateEdit3.enabled := true;
       dbedvalevento.enabled := true;
       DateEdit4.enabled := true;
       wwDBEdit1.enabled := true;
       edfilial.enabled := true;
       BitBtn2.enabled := true;
       DateEdit3.readonly := false;
       DateEdit4.readonly := false;
       edit1.text := '';
       edfilial.text := '';
       dblkpcmbdepend.text := '';
       DBLkpCmbevent.text := '';
       dbedvalevento.text := '';
       wwDBEdit1.text := '';
       dateedit3.text := '';
       dateedit4.text := '';

       dblkpcmbdepend.ReadOnly := false;
       DBLkpCmbevent.readonly := false;
       DateEdit3.readonly := false;
       dbedvalevento.readonly := false;
       DateEdit4.readonly := false;
       wwDBEdit1.readonly := false;
       PreencheTela;

       dblkpcmbdepend.text := '';
       DBLkpCmbevent.text := '';
       dbedvalevento.text := '';
       wwDBEdit1.text := '';
       dateedit3.text := '';
       dateedit4.text := '';

       //dbnav.visible := false;
     end;
  except
     bbtncancelarclick(self);
  end;
end;

procedure TfrmCadEventAssist.wwDBEdit1Click(Sender: TObject);
begin
  inherited;
  qrytit.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  qrytit.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  qrytit.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
  qrytit.parambyname('idpessoa').AsInteger := iidparticipante;
  //dblkpcmbtit.lookupfield  := 'IDPESSFIS';
  {with Dblkpcmbtit  do
  begin
          Selected.Clear;
          Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end; }

  qrytit.open;
end;

procedure TfrmCadEventAssist.qrycadeventAfterPost(DataSet: TDataSet);
begin
  inherited;

  if Estado = dsedit then
  begin
    edit1.text := qrytit.fieldbyname('nome').AsString;
    edfilial.text := qrytit.fieldbyname('filial').AsString;
  end
  else
  begin
    edit1.Text := '';
    edfilial.text := '';
  end;
end;

procedure TfrmCadEventAssist.FormActivate(Sender: TObject);
begin
   BitBtn2.enabled := false;
end;

{procedure TFCadEventAssist.DBLkpCmbpatroChange(Sender: TObject);
begin
  inherited;
  if qryplanoprev.active = true then
  begin
    qryplanoprev.close;
    qryplanass.close;
    qrytit.close;
    BitBtn1.enabled := false;
    edit1.text := '';
    qrydepend.close;
    qryevent.close;
  end;
end;  }

{procedure TFCadEventAssist.DBLkpCmbprevChange(Sender: TObject);
begin
  inherited;
  if qryplanass.active = true then
  begin
    qryplanass.close;
    qrytit.close;
    BitBtn2.enabled := false;
    edit1.text := '';
    qrydepend.close;
    qryevent.close;
  end;
end;}

procedure TfrmCadEventAssist.qryplanassBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  //qryplanass.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  //qryplanass.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  //qryplanoprev.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmCadEventAssist.qryplanoprevBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  //qryplanoprev.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmCadEventAssist.qrycadeventAfterScroll(DataSet: TDataSet);
begin
  //  inherited;

  //qrypatro.open;
  //qryplanoprev.close;
  //qryplanass.close;
  //qrytit.close;
  //qrydepend.close;
  //qryevent.close;
  //qryplanoprev.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  {DBLkpCmbprev.lookupfield := 'idplanoprev';
  with DBLkpCmbprev  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;}
  //qryplanoprev.open;
  //qryplanass.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  //qryplanass.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  {DBLkpCmbpass.lookupfield := 'IDPLANass';
  with DBLkpCmbpass  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;}

  {qryplanass.open;
  qrytit.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  qrytit.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  qrytit.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
  qrytit.parambyname('idpessoa').AsInteger := qrycadevent.fieldbyname('idtitular').AsInteger;
  //FCadEventassist.dblkpcmbtit.lookupfield  := 'idpessfis';
  qrytit.open;
  edit1.text := qrytit.fieldbyname('nome').AsString;
  edfilial.text := qrytit.fieldbyname('filial').AsString;

  qrydepend.parambyname('idpessjur').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
  qrydepend.parambyname('idplanoprev').AsInteger := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  qrydepend.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
  qrydepend.parambyname('idpessoa').AsInteger := qrytit.fieldbyname('idpessoa').AsInteger;
  dblkpcmbdepend.lookupfield  := 'idpessoa';
  with dblkpcmbdepend  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qrydepend.open;
  qryevent.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
  dblkpcmbevent.lookupfield  := 'idSERVASS';
  with dblkpcmbevent  do
  begin
    Selected.Clear;
    Selected.Add('NOME' + #9 + '50' + #9 + 'NOME');
  end;
  qryevent.open; }

  if datetostr(qrycadevent.fieldbyname('DATAEVENT').AsDateTime) <> '' then
    dateedit3.text := datetostr(qrycadevent.fieldbyname('DATAEVENT').AsDateTime)
  else
    dateedit3.text := '';

  if qrycadevent.fieldbyname('DATAPAG').AsString <> '' then
    dateedit4.text := datetostr(qrycadevent.fieldbyname('DATAPAG').AsDateTime)
  else
    dateedit4.text := '';
end;

procedure TfrmCadEventAssist.qrycadeventBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  //  dblkpcmbdepend.ReadOnly := false;
  //  DBLkpCmbpatro.readonly := false;
  //  DBLkpCmbprev.readonly := false;
  //  DBLkpCmbpass.readonly := false;
  //  DBLkpCmbevent.readonly := false;
  //  DateEdit3.readonly := false;
  //  dbedvalevento.readonly := false;
  DateEdit4.readonly := false;
  wwDBEdit1.readonly := false;
end;

procedure TfrmCadEventAssist.qrycadeventBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  dblkpcmbdepend.ReadOnly := false;
  //  DBLkpCmbpatro.readonly := false;
  //  DBLkpCmbprev.readonly := false;
  //  DBLkpCmbpass.readonly := false;
  DBLkpCmbevent.readonly := false;
  DateEdit3.readonly := false;
  dbedvalevento.readonly := false;
  DateEdit4.readonly := false;
  wwDBEdit1.readonly := false;
  BitBtn2.enabled := true;
end;

procedure TfrmCadEventAssist.bbtnCancelarClick(Sender: TObject);
begin
  //dbnav.visible := false;

  dblkpcmbdepend.enabled := false;
  DBLkpCmbevent.enabled := false;
  DateEdit3.enabled := false;
  dbedvalevento.enabled := false;
  DateEdit4.enabled := false;
  wwDBEdit1.enabled := false;
  BitBtn2.enabled := false;

  Panel3.cursor := crdefault;
  panel2.cursor := crdefault;
  sbtnimport.Enabled := true;
  BitBtn2.ENABLED := false;
  //qrycadevent.last;

  edit1.text := '';
  edfilial.text := '';
  DBLookupComboBox1.text := '';
  wwDBLookupCombo1.text := '';
  wwDBLookupCombo2.text := '';
  dblkpcmbdepend.text := '';
  DBLkpCmbevent.text := '';
  dbedvalevento.text := '';
  wwDBEdit1.text := '';
  dateedit3.text := '';
  dateedit4.text := '';

  sbtnInserir.down := false;
  sbtnAlterar.down := false;
  sbtnApagar.down := false;
  sbtnAlterar.enabled := false;
  sbtnApagar.enabled := false;

  sbtnInserir.enabled := true;
  sbtnProcurar.enabled := true;

  bbtnConfirmar.visible := false;
  bbtnCancelar.visible := false;

  DecimalSeparator := ',';
end;


procedure TfrmCadEventAssist.sbtnInserirClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := true;

  //dbnav.visible := false;

  dateedit3.readonly := false;
  dateedit4.readonly := false;

  qrypatro.close;
  qryplanoprev.close;
  qryplanass.close;
  //  inherited;

  edit1.text := '';
  edfilial.text := '';
  DBLookupComboBox1.text := '';
  wwDBLookupCombo1.text := '';
  wwDBLookupCombo2.text := '';
  dblkpcmbdepend.text := '';
  DBLkpCmbevent.text := '';
  dbedvalevento.text := '';
  wwDBEdit1.text := '';
  dateedit3.text := '';
  dateedit4.text := '';

  DateEdit4.readonly:= false;
  wwDBEdit1.readonly := false;
  //DateEdit4.setfocus;
  DateEdit4.enabled := true;
  wwDBEdit1.enabled := true;
  DateEdit3.readonly := false;
  DateEdit3.enabled := true;
  wwDBEdit1.readonly := false;

  sbtnimport.Enabled := false;

  sbtnApagar.enabled := false;
  sbtnProcurar.enabled := false;
  sbtnAlterar.enabled := false;

  bbtnConfirmar.visible := true;
  bbtnCancelar.visible := true;
  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled := true;
  bbtnConfirmar.Invalidate;
  bbtnCancelar.Invalidate;

  //iidtit := PedeParticipanteAssistencial( iidplanass, iidplanoprev, iidpatrocin, 'Título');

  try
    MontaSel.Executar;
    
    if MontaSel.RetornouValor then
    begin
      iIdParticipante := strtoint(Montasel.ValoresChave[0]);
      iIdPlanoprev := strtoint(Montasel.ValoresChave[2]);
      iIdPlanass := strtoint(Montasel.ValoresChave[1]);
      iIdPatrocin := strtoint(Montasel.ValoresChave[3]);

      qrycadevent.close;
      qrycadevent.sql.clear;
      qrycadevent.sql.add
        ('SELECT IDTITULAR, IDPLANASS, DATAEVENT, IDSERVASS, IDPESSJUR, IDPLANOPREV, '+
               ' IDDEPENDENTE, ESTATISTICA, VALOREVENT, VALORPAGO, DATAPAG, FLGREEMBOLSO, '+
               ' VALORPAGAMENTO, VALORRECEBIMENTO, VALORREEMBOLSO, FLGCOB '+
          ' FROM '+Sistema.PrefixoServidor+'EVENTASS '+
         ' WHERE (IDTITULAR = '+inttostr(iidparticipante)+') AND '+
               ' (IDPLANASS = '+inttostr(iidplanass)+') AND'+
               ' (IDPLANOPREV = '+inttostr(iidplanoprev)+') AND '+
               ' (IDPESSJUR = '+inttostr(iidpatrocin)+')');
      qrycadevent.open;

      qrypatro.open;
      qrypatro.Locate('idpessoa', iidpatrocin, [loPartialKey]);
      DBLookupComboBox1.text := qrypatro.fieldbyname('nome').AsString;

      qryplanoprev.open;
      qryplanoprev.Locate('idplanoprev', iidplanoprev, [loPartialKey]);
      wwDBLookupCombo1.text := qryplanoprev.fieldbyname('NOME').AsString;

      qryplanass.open;
      qryplanass.Locate('idplanass', iidplanass, [loPartialKey]);
      wwDBLookupCombo2.text := qryplanass.fieldbyname('NOME').AsString;

      dblkpcmbdepend.enabled := true;
      DBLkpCmbevent.enabled := true;
      DateEdit3.enabled := true;
      dbedvalevento.enabled := true;
      DateEdit4.enabled := true;
      wwDBEdit1.enabled := true;
      BitBtn2.enabled := true;
      DateEdit3.readonly := false;
      DateEdit4.readonly := false;
      edit1.text := '';
      edfilial.text := '';
      dblkpcmbdepend.text := '';
      DBLkpCmbevent.text := '';
      dbedvalevento.text := '';
      wwDBEdit1.text := '';
      dateedit3.text := '';
      dateedit4.text := '';

      dblkpcmbdepend.ReadOnly := false;
      DBLkpCmbevent.readonly := false;
      DateEdit3.readonly := false;
      dbedvalevento.readonly := false;
      DateEdit4.readonly := false;
      wwDBEdit1.readonly := false;
      PreencheTela;

      dblkpcmbdepend.text := '';
      DBLkpCmbevent.text := '';
      dbedvalevento.text := '';
      wwDBEdit1.text := '';
      dateedit3.text := '';
      dateedit4.text := '';

      //dbnav.visible := false;
    end;
  except
    bbtncancelarclick(self);
  end;
end;

procedure TfrmCadEventAssist.qrycadeventAfterEdit(DataSet: TDataSet);
begin
  qrycadevent.fieldbyname('idtitular').AsInteger := idtitular;
  qrycadevent.fieldbyname('iddependente').AsInteger := iddependente;
  qrycadevent.fieldbyname('idplanass').AsInteger  := idplanass;
  qrycadevent.fieldbyname('idplanoprev').AsInteger := idplanoprev;
  qrycadevent.fieldbyname('idpessjur').AsInteger := idpessjur;

  inherited;
  DateEdit4.enabled := true;
  DateEdit4.readonly := false;

  //BitBtn2.ENABLED := TRUE;
  //BitBtn2.setfocus;
  //dbedvalevento.SetFocus;
end;

procedure TfrmCadEventAssist.qryplanassAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if ds.dataset.State = dsinsert then
  begin
    qryplanass.Locate('idplanass', iidplanass, [loPartialKey]);
  end;
end;

procedure TfrmCadEventAssist.qryplanoprevAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if ds.dataset.state = dsinsert then
  begin
    qryplanoprev.Locate('idplanoprev', iidplanoprev, [loPartialKey]);
  end;
end;

procedure TfrmCadEventAssist.qrycadeventAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dateedit3.text := datetostr(date);
  dateedit4.text := '';
end;

procedure TfrmCadEventAssist.DateEdit3Exit(Sender: TObject);
begin
  inherited;
  if dateedit3.text <> '' then
  begin
   if  (strtodate(dateedit3.text) > date) then
   begin
     showmessage('Data inválida !');
     dateedit3.setfocus;
   end;
  end;
end;

procedure TfrmCadEventAssist.DateEdit4Exit(Sender: TObject);
begin
  inherited;

  if (dateedit3.text <> '') and (dateedit4.text <> '') then
  begin
    if (strtodate(dateedit3.text) > strtodate(dateedit4.text)) then
    begin
      showmessage('Data inválida !');
      dateedit4.setfocus;
    end;
  end;

  if dateedit3.text = '' then
  begin
    showmessage('Data do evento não foi encontrada!');
    dateedit4.text := '';
    dateedit3.setfocus;
  end;
end;

procedure TfrmCadEventAssist.sbtnInserirMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  dateedit3.text := '';
  dateedit4.text := '';
end;

procedure TfrmCadEventAssist.qryeventBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryevent.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
end;

procedure TfrmCadEventAssist.wwDBEdit1Exit(Sender: TObject);
begin
  inherited;

  if (dbedvalevento.text = '') and (ds.dataset.state <> dsbrowse ) then
  begin
    showmessage('O valor do evento não foi encontrado !');
    wwDBEdit1.setfocus;
  end;
end;

procedure TfrmCadEventAssist.sbtnAlterarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := false;

  //dbnav.visible := false;

  idtitular := qrycadevent.fieldbyname('idtitular').AsInteger;
  iddependente := qrycadevent.fieldbyname('iddependente').AsInteger;
  idplanass := qrycadevent.fieldbyname('idplanass').AsInteger;
  idplanoprev := qrycadevent.fieldbyname('idplanoprev').AsInteger;
  idpessjur := qrycadevent.fieldbyname('idpessjur').AsInteger;

  BitBtn2.enabled := false;
  DateEdit4.readonly:= false;
  wwDBEdit1.readonly := false;
  //DateEdit4.setfocus;
  DateEdit4.enabled := true;
  wwDBEdit1.enabled := true;
  Panel3.cursor := crno;
  Panel2.cursor := crno;
  //  inherited;
  sbtnimport.Enabled := false;
  CmeCadastro.RepetirInsert := false;

  //  CmeCadastro.Edit(Self);
  sbtnInserir.Enabled := false;
  sbtnProcurar.enabled := false;
  sbtnApagar.enabled := false;

  //dbnav.visible := false;

  bbtnConfirmar.Visible := true;
  bbtnCancelar.visible := true;
  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled := true;

  if CmeCadastro.Operacao <> opIdle then
  begin
    sbtnAlterar.Down := True;
    exit;
  end;
end;

procedure TfrmCadEventAssist.bbtnConfirmarClick(Sender: TObject);
begin
  mes := copy(DateEdit3.text,7,4)+'/'+ copy(DateEdit3.text,4,2);
  //dbnav.visible := false;

  Panel3.cursor := crdefault;
  Panel2.cursor := crdefault;

  sbtnimport.Enabled := true;

  if DBLookupComboBox1.text = '' then
  begin
    showmessage('É preciso selecionar um participante !');
    exit;
  end;
  if dblkpcmbdepend.text = '' then
  begin
    showmessage('É preciso selecionar um beneficiário !');
    exit;
  end;
  if DBLkpCmbevent.text = '' then
  begin
    showmessage('É preciso selecionar um serviço !');
    exit;
  end;
  if DateEdit3.text = '' then
  begin
    showmessage('É preciso selecionar a data do evento !');
    exit;
  end;

  if dbedvalevento.text = '' then
  begin
    showmessage('É preciso digitar o valor do evento !');
    exit;
  end;

  if (DateEdit4.text <> '') and ((wwDBEdit1.text = '') or (wwDBEdit1.text = '0,00')) then
  begin
    showmessage('É preciso digitar o valor do reembolso !');
    exit;
  end;

  if (wwDBEdit1.text <> '0,00') or (wwDBEdit1.text <> '') then
  begin
    if wwDBEdit1.value > dbedvalevento.value then
    begin
      showmessage('O valor do reembolso não pode ser maior que o valor do evento !');
      exit;
    end;
  end;

  //************************************insert***********************************//
  if CmeCadastro.RepetirInsert then
  begin
    qryoper.close;
    qryoper.sql.clear;
    qryoper.sql.add
      ('INSERT INTO EVENTASS(IDPLANASS,DATAEVENT,IDSERVASS,'+
                  ' IDTITULAR,IDDEPENDENTE,IDPESSJUR,IDPLANOPREV,VALOREVENT,'+
                  ' VALORPAGAMENTO,VALORRECEBIMENTO,VALORREEMBOLSO,FLGCOB)'+
      ' VALUES ('+inttostr(iidplanass)+',to_date('''+DateEdit3.text+''',''dd/mm/yyyy''),'+
                qryevent.fieldbyname('idservass').AsString+','+inttostr(iidparticipante)+','+
                qrydepend.fieldbyname('idpessoa').AsString+','+
                inttostr(iidpatrocin)+','+inttostr(iidplanoprev)+',:VALOR,:PAGAMENTO,:COMISSAO,:REEMBOLSO,0)');
    qryoper.parambyname('valor').AsFloat := dbedvalevento.value;
    qryoper.parambyname('pagamento').AsFloat := pagamento;
    qryoper.parambyname('comissao').AsFloat := comissao;
    qryoper.parambyname('reembolso').AsFloat := reembolso;
    try
      qryoper.execsql;
    except
       showmessage('Este evento já foi registrado.');
       exit;
    end;

    if DateEdit4.text <> '' then
    begin
       qryoper.close;
       qryoper.sql.clear;
       qryoper.sql.add
         ('UPDATE EVENTASS '+
            ' SET VALORPAGO = :VALORPAGO,'+
                ' DATAPAG = TO_DATE('''+DateEdit4.text+''',''DD/MM/YYYY''),'+
                ' VALORPAGAMENTO = :PAGAMENTO,'+
                ' VALORRECEBIMENTO = :COMISSAO,'+
                ' VALORREEMBOLSO= :REEMBOLSO '+
          ' WHERE (IDPLANASS = '+inttostr(iidplanass)+')'+
            ' AND (IDPLANOPREV = '+inttostr(iidplanoprev)+')'+
            ' AND (IDPESSJUR = '+inttostr(iidpatrocin)+')'+
            ' AND (IDSERVASS = '+qryevent.fieldbyname('idservass').AsString+')'+
            ' AND (DATAEVENT = to_date('''+DateEdit3.text+''',''dd/mm/yyyy''))'+
            ' AND (IDTITULAR = '+inttostr(iidparticipante)+')'+
            ' AND (IDDEPENDENTE = '+qrydepend.fieldbyname('idpessoa').AsString+')');
       qryoper.parambyname('valorpago').AsFloat := wwDBEdit1.value;
       qryoper.parambyname('pagamento').AsFloat := pagamento;
       qryoper.parambyname('comissao').AsFloat := comissao;
       qryoper.parambyname('reembolso').AsFloat := reembolso;
       qryoper.execsql;
    end;

    AlteraFornServPlanAss;
  //=====================

    sbtnInserirClick(self);
  end;// fim insert

  //**********************************Altera*************************************//
  if not CmeCadastro.RepetirInsert then
  begin
     if DateEdit4.text <> '' then
     begin
        qryoper.close;
        qryoper.sql.clear;
        qryoper.sql.add
          ('UPDATE EVENTASS SET VALORPAGO = :VALORPAGO, DATAPAG = TO_DATE('''+DateEdit4.text+''',''DD/MM/YYYY'') '+
                 ',VALORPAGAMENTO= :PAGAMENTO,VALORRECEBIMENTO = :COMISSAO, VALORREEMBOLSO= :REEMBOLSO '+
           ' WHERE (IDPLANASS = '+inttostr(iidplanass)+')'+
             ' AND (IDPLANOPREV = '+inttostr(iidplanoprev)+')'+
             ' AND (IDPESSJUR = '+inttostr(iidpatrocin)+')'+
             ' AND (IDSERVASS = '+qryevent.fieldbyname('idservass').AsString+')'+
             ' AND (DATAEVENT = to_date('''+DateEdit3.text+''',''dd/mm/yyyy''))'+
             ' AND (IDTITULAR = '+inttostr(iidparticipante)+')'+
             ' AND (IDDEPENDENTE = '+qrydepend.fieldbyname('idpessoa').AsString+')');
       qryoper.parambyname('valorpago').AsFloat := dbedvalevento.value;
       qryoper.parambyname('pagamento').AsFloat := pagamento;
       qryoper.parambyname('comissao').AsFloat := comissao;
       qryoper.parambyname('reembolso').AsFloat := reembolso;
       qryoper.execsql;
     end;

     sbtnInserir.Enabled := true;
     sbtnProcurar.enabled := true;
     sbtnAlterar.down := false;

     AlteraFornServPlanAss;
   //=====================

     bbtnCancelarClick(self);
  end;//Fim Altera
end;

//novo
procedure TfrmCadEventAssist.AlteraFornServPlanAss;
begin
   //DEFINIR MES
   //DEFINIR RESULTADOS DA REGRA VALORPAG, VALORRECEB, VALORREEMB

   //VERIFICAR SE JÁ EXISTE REGISTRO REFERENTE AO MES //
   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add
    ('SELECT IDFORNSERV '+
      ' FROM FORNSERVPLANASS'+
     ' WHERE (IDFORNSERV = '+qryplanass.fieldbyname('idfornserv').AsString+')'+
       ' AND (IDPLANASS = '+qryplanass.fieldbyname('idplanass').AsString+')'+
       ' AND (IDSERVASS = '+qryevent.fieldbyname('idservass').AsString+')'+
       ' AND (MESREFERENCIA= '''+mes+''') ');
   qryaux.open;
   //*************************************************//

   if qryaux.isempty then
   begin
      qryaux2.close;
      qryaux2.sql.clear;
      qryaux2.sql.add
       ('INSERT INTO FORNSERVPLANASS(IDFORNSERV,IDPLANASS,IDSERVASS,MESREFERENCIA,'+
                   ' TOTALPAGAMENTO,TOTALCOMISSAO)'+
            ' VALUES ('+qryplanass.fieldbyname('idfornserv').AsString+','+
                     qryplanass.fieldbyname('idplanass').AsString+','+
                     qryevent.fieldbyname('idservass').AsString+','''+
                     mes+''',:VALORPAG, :VALORCOMISS)');
      try
         qryaux2.parambyname('valorpag').AsFloat := pagamento;
         qryaux2.parambyname('valorcomiss').AsFloat := comissao;
         qryaux2.execsql;
      except
         //raise
      end;
   end
   else
   begin
      qryaux2.Close;
      qryaux2.SQL.clear;
      qryaux2.sql.add('SELECT TOTALPAGAMENTO, TOTALCOMISSAO '+
                       ' FROM FORNSERVPLANASS '+
                      ' WHERE (IDPLANASS =  :IDPLANASS) '+
                        ' AND (IDFORNSERV = :IDFORNSERV) '+
                        ' AND (IDSERVASS = '+qryevent.fieldbyname('idservass').AsString+')' +
                        ' AND (MESREFERENCIA = '''+MES+''')');
      qryaux2.parambyname('idplanass').AsInteger := qryplanass.fieldbyname('idplanass').AsInteger;
      qryaux2.parambyname('idfornserv').AsInteger := qryplanass.fieldbyname('idfornserv').AsInteger;
      qryaux2.open;

      valortotpag := qryaux2.fieldbyname('totalpagamento').AsFloat;
      valortotcomiss := qryaux2.fieldbyname('totalcomissao').AsFloat;

      qryaux2.close;
      qryaux2.sql.clear;
      qryaux2.sql.add
        ('UPDATE FORNSERVPLANASS SET TOTALPAGAMENTO = :VALORTOTPAG,'+
               ' TOTALCOMISSAO = :VALORTOTCOMISS '+
         ' WHERE (IDFORNSERV = '+qryplanass.fiEldbyname('idfornserv').AsString+')'+
           ' AND (IDPLANASS = '+qryplanass.fieldbyname('idplanass').AsString+')'+
           ' AND (IDSERVASS = '+qryevent.fieldbyname('idservass').AsString+')'+
           ' AND (MESREFERENCIA= '''+mes+''') ');
      try
         qryaux2.parambyname('valortotpag').AsFloat := pagamento + valortotpag;
         qryaux2.parambyname('valortotcomiss').AsFloat := comissao + valortotcomiss;
         qryaux2.execsql;
      except
         raise
      end;
   end;
end;

//novo
procedure TfrmCadEventAssist.ExecutaRegras;
begin
   ////////////////////////////////////////////REGRAPAG////////////////////////////////
   if qryevent.fieldbyname('idregraPagamento').AsString <> '' then
   begin
      qryregrapag.close;
      //PARAM
      qryregrapag.parambyname('IDPESSJUR').AsInteger := iidpatrocin;
      qryregrapag.parambyname('IDPLANOPREV').AsInteger := iidplanoprev;
      qryregrapag.parambyname('IDPLANASS').AsInteger := iidplanass;
      qryregrapag.parambyname('IDSERVASS').AsInteger := qryevent.fieldbyname('idservass').AsInteger;
      qryregrapag.parambyname('IDPESSOA').AsInteger := iidparticipante;
      qryregrapag.parambyname('IDDEPENDENTE').AsInteger := qrydepend.fieldbyname('idpessoa').AsInteger;
      //
      qryregrapag.open;
      regra.paramout := 'VALOR';
      regra.rulename := qryevent.fieldbyname('idregraPagamento').AsString;
      regra.queryin := qryregrapag;
      regra.execute;

      qryregrapag.close;

      if regra.result <> '' then
      begin
         try
           pagamento :=  StrToFloat(regra.result);
         except
           MsgDlg('Valor do resultado da regra inválido -> ['+regra.result+'].',
                   'Erro', mtError, [mbOk,mbHelp], 0);
           pagamento:=0;
         end;
      end;
   end;

   ////////////////////////////////////////////CUIDADO//////////////////////////////
   ////////////////////////////////////////////REGRACOMISSAO////////////////////////////////

   if qryevent.fieldbyname('idregraComissao').AsString <> '' then
   begin
      qryregracomiss.close;
      //PARAM
      qryregracomiss.parambyname('IDPESSJUR').AsInteger := iidpatrocin;
      qryregracomiss.parambyname('IDPLANOPREV').AsInteger := iidplanoprev;
      qryregracomiss.parambyname('IDPLANASS').AsInteger := iidplanass;
      qryregracomiss.parambyname('IDSERVASS').AsInteger := qryevent.fieldbyname('idservass').AsInteger;
      qryregracomiss.parambyname('IDPESSOA').AsInteger := iidparticipante;
      qryregracomiss.parambyname('IDDEPENDENTE').AsInteger := qrydepend.fieldbyname('idpessoa').AsInteger;
      //
      qryregracomiss.open;
      regra.paramout := 'VALOR';
      regra.rulename := qryevent.fieldbyname('idregraComissao').AsString;
      regra.queryin := qryregracomiss;
      regra.execute;

      qryregracomiss.close;

      if regra.result <> '' then
      begin
        try
          comissao := StrToFloat(regra.result);
        except
           MsgDlg('Valor do resultado da regra inválido -> ['+regra.result+'].',
                   'Erro', mtError, [mbOk,mbHelp], 0);
           comissao:=0;
        end;
      end;
   end;

   ////////////////////////////////////////////CUIDADO//////////////////////////////
   ////////////////////////////////////////////REGRAREEMBOLSO////////////////////////////////

   if qryevent.fieldbyname('idregraReembolso').AsString <> '' then
   begin
      qryregrareemb.close;
      //PARAM
      qryregrareemb.parambyname('IDPESSJUR').AsInteger := iidpatrocin;
      qryregrareemb.parambyname('IDPLANOPREV').AsInteger := iidplanoprev;
      qryregrareemb.parambyname('IDPLANASS').AsInteger := iidplanass;
      qryregrareemb.parambyname('IDSERVASS').AsInteger := qryevent.fieldbyname('idservass').AsInteger;
      qryregrareemb.parambyname('IDPESSOA').AsInteger := iidparticipante;
      qryregrareemb.parambyname('IDDEPENDENTE').AsInteger := qrydepend.fieldbyname('idpessoa').AsInteger;
      //
      qryregrareemb.open;
      regra.paramout := 'VALOR';
      regra.rulename := qryevent.fieldbyname('idregraReembolso').AsString;
      regra.queryin := qryregrareemb;
      regra.execute;

      qryregrareemb.close;

      if regra.result <> '' then
      begin
        try
          reembolso := StrToFloat(regra.result);
        except
           MsgDlg('Valor do resultado da regra inválido -> ['+regra.result+'].',
                   'Erro', mtError, [mbOk,mbHelp], 0);
           reembolso:=0;
        end;

      end;
   end;
   ///////////////////////////////////////////CUIDADO//////////////////////////////
end;

procedure TfrmCadEventAssist.sbtnProcurarClick(Sender: TObject);
//var idplanass,idtitular,iddependente,idservass,idplanoprev,idpessjur: integer;
begin
  //AbrirFormModal(frmProcEvent,TfrmProcEvent);
  //      qryprocura.close;
  //      qryprocura.open;
  try
    MontaSelProc.Executar;
    
    if MontaSelProc.RetornouValor then
    begin
      iIdParticipante := strtoint(MontaselProc.ValoresChave[0]);
      iIdPlanoprev := strtoint(MontaselProc.ValoresChave[2]);
      iIdPlanass := strtoint(MontaselProc.ValoresChave[1]);
      iIdPatrocin := strtoint(MontaselProc.ValoresChave[3]);
      iIdServass := MontaselProc.ValoresChave[5];
      iIdDependente  := MontaselProc.ValoresChave[4];
      DataEvent := MontaselProc.ValoresChave[6];

      qrycadevent.close;
      qrycadevent.sql.clear;
      qrycadevent.sql.add
        ('SELECT IDTITULAR, IDPLANASS, DATAEVENT, IDSERVASS, IDPESSJUR, IDPLANOPREV, '+
               ' IDDEPENDENTE, ESTATISTICA, VALOREVENT, VALORPAGO, DATAPAG, FLGREEMBOLSO, '+
               ' VALORPAGAMENTO, VALORRECEBIMENTO, VALORREEMBOLSO, FLGCOB '+
           'FROM '+Sistema.PrefixoServidor+'EVENTASS '+
         ' WHERE (IDPLANASS = :IDPLANASS) AND'+
               ' (IDPLANOPREV = :IDPLANOPREV) AND '+
               ' (IDPESSJUR = :IDPESSJUR) AND '+
               ' (IDSERVASS = :IDSERVASS) AND '+
               ' (IDTITULAR = :IDTITULAR) AND '+
               ' (IDDEPENDENTE = :IDDEPENDENTE) AND '+
               ' (DATAEVENT = :DATAEVENT) ');
      qrycadevent.parambyname('IDPLANASS').AsInteger := iidplanass;
      qrycadevent.parambyname('IDPLANOPREV').AsInteger := iidplanoprev;
      qrycadevent.parambyname('IDPESSJUR').AsInteger := iidpatrocin;
      qrycadevent.parambyname('IDSERVASS').AsString := iidservass;
      qrycadevent.parambyname('IDTITULAR').AsInteger := iidparticipante;
      qrycadevent.parambyname('IDDEPENDENTE').AsString := iiddependente;
      qrycadevent.parambyname('DATAEVENT').AsDateTime := strtodate(dataevent);

      qrycadevent.open;

      qrypatro.open;
      qrypatro.Locate('idpessoa', iidpatrocin, [loPartialKey]);
      DBLookupComboBox1.text := qrypatro.fieldbyname('nome').AsString;

      qryplanoprev.open;
      qryplanoprev.Locate('idplanoprev', iidplanoprev, [loPartialKey]);
      wwDBLookupCombo1.text := qryplanoprev.fieldbyname('NOME').AsString;

      qryplanass.open;
      qryplanass.Locate('idplanass', iidplanass, [loPartialKey]);
      wwDBLookupCombo2.text := qryplanass.fieldbyname('NOME').AsString;

      preenchetela;

      dblkpcmbdepend.text := qrydepend.fieldbyname('nome').AsString;
      DBLkpCmbevent.text := qryevent.fieldbyname('nome').AsString;
      DateEdit3.text := copy(qrycadevent.fieldbyname('dataevent').AsString,1,10);
      dbedvalevento.text := qrycadevent.fieldbyname('valorevent').AsString;
      DateEdit4.text := copy(qrycadevent.fieldbyname('datapag').AsString,1,10);
      wwDBEdit1.text := qrycadevent.fieldbyname('valorpago').AsString;

      sbtnProcurar.down := false;
      sbtnInserir.down := false;
      sbtnAlterar.down := false;
      sbtnApagar.down := false;
      sbtnAlterar.enabled := true;
      sbtnApagar.enabled := true;
    end;
  except
    bbtncancelarclick(self);
  end;

  //dbnav.visible := false;
end;

procedure TfrmCadEventAssist.sbtnimportClick(Sender: TObject);
begin
  inherited;
  //AbrirFormModal(frmImport, TfrmImport);
end;

procedure TfrmCadEventAssist.DateEdit3Click(Sender: TObject);
begin
  inherited;
  {if ds.dataset.State = dsbrowse then
  begin
    DateEdit3.readonly := true;
    DateEdit3.enabled := false;
  end
  else
  begin
    DateEdit3.readonly := false;
    DateEdit3.enabled := true;
  end; }
end;

procedure TfrmCadEventAssist.DateEdit4Click(Sender: TObject);
begin
  inherited;
  {if ds.dataset.State = dsbrowse then
  begin
    DateEdit4.readonly := true;
    DateEdit4.enabled := false;

  end
  else
  begin
    DateEdit4.readonly := false;
    DateEdit4.enabled := true;
  end; }
end;

procedure TfrmCadEventAssist.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.dataset.state = dsinsert then
  begin
    dblkpcmbdepend.Enabled := true;
    DBLkpCmbevent.enabled := true;
    DateEdit3.enabled := true;
    DateEdit4.readonly := false;
    DateEdit4.enabled := true;
  end
  else
  begin
    DateEdit4.readonly := true;
    DateEdit4.enabled := false;
    dblkpcmbdepend.Enabled := false;
    DBLkpCmbevent.enabled := false;
    DateEdit3.enabled := false;
  end;
end;

procedure TfrmCadEventAssist.sbtnApagarClick(Sender: TObject);
begin
   // Desce o botão Procurar
   sbtnApagar.Down := True;

   // testa se a tabela está vazia
   if ds.DataSet.isempty then
   begin
     MsgDlg(LerMensagem(10),LerMensagem(2),mtError,[mbOk, mbHelp], 0);
     sbtnApagar.Down := False;
     Exit;
   end;

   // Tenta apagar o registro
   try
      // Pergunta se deseja realmente apagar
      if MsgDlg(LerMensagem(11), LerMensagem(4), mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
      begin
         //CmeCadastro.Delete(Self);
         qryoper.close;
         qryoper.sql.clear;
         qryoper.sql.add
           ('DELETE EVENTASS'+
            ' WHERE (IDPLANASS = '+inttostr(iidplanass)+')'+
              ' AND (IDPLANOPREV = '+inttostr(iidplanoprev)+')'+
              ' AND (IDPESSJUR = '+inttostr(iidpatrocin)+')'+
              ' AND (IDSERVASS = '+qryevent.fieldbyname('idservass').AsString+')'+
              ' AND (DATAEVENT = to_date('''+trim(DateEdit3.text)+''',''dd/mm/yyyy''))'+
              ' AND (IDTITULAR = '+inttostr(iidparticipante)+')'+
              ' AND (IDDEPENDENTE = '+qrydepend.fieldbyname('idpessoa').AsString+')');
         qryoper.execsql;
      end;
   finally
      // Sobe o botão de Apagar
      sbtnApagar.Down := False;
   end;

   bbtnCancelarClick(self);
end;

(* procedure TfrmCadEventAssist.dbnavClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  {if qryprocura.active = true then
  begin
    qrycadevent.close;
    qryprocura.close;
    //qryprocura.open;
    //cmSelectDlg1.execute;

    qrycadevent.sql.clear;
    qrycadevent.datasource := nil;
    qrycadevent.sql.add(' SELECT *  FROM EVENTASS ');
    qrycadevent.open;

    //sbtnProcurar.down := false;
  end;}
end; *)

procedure TfrmCadEventAssist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  action := cafree;
end;

procedure TfrmCadEventAssist.bbtnSairClick(Sender: TObject);
begin
   DecimalSeparator := ',';
   close;
end;

procedure TfrmCadEventAssist.DBLkpCmbeventCloseUp(Sender: TObject; LookupTable,
          FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cAux := DecimalSeparator;
  DecimalSeparator := '.';

  pagamento := 0;
  comissao := 0;
  reembolso := 0;

  ExecutaRegras;
  DecimalSeparator := cAux;

  dbedvalevento.text := qryevent.fieldbyname('preco').AsString;

  if (reembolso <> 0) and (DateEdit4.text <> '') then
  begin
     wwDBEdit1.Value := reembolso;
     DateEdit4.text := DateEdit3.text;
  end
  else
    if (reembolso <> 0) then
    begin
       wwDBEdit1.Value := reembolso;
       DateEdit4.text := datetostr(date);
       DateEdit3.text := datetostr(date);
    end;
end;

procedure TfrmCadEventAssist.DBLkpCmbeventEnter(Sender: TObject);
begin
  inherited;
  // dblkpcmbdepend.Datasource.Dataset.Close;
  // dblkpcmbdepend.Datasource.Dataset.Open;
end;

procedure TfrmCadEventAssist.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.enabled := false;
  sbtnApagar.enabled := false;
end;

end.
