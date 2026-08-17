unit FEstimaContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, wwdblook, ComCtrls, DBCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, cmseldlg, URegra, TB97, TREdit, checklst,
  MontaSelect, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmEstimaContr = class(TfrmOkCancelar)
    pnlPesquisa: TPanel;
    GroupBox3: TGroupBox;
    qrycontribass: TwwQuery;
    dscontribass: TwwDataSource;
    seldlgproc: TcmSelectDlg;
    qryaux: TwwQuery;
    dsaux: TwwDataSource;
    regraestima: TRegra;
    qryregra: TwwQuery;
    edvalor: TRealEdit;
    bbtnEnviar: TBitBtn;
    btnvoltar: TBitBtn;
    bbtnConsultar: TBitBtn;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    MontaSelect: TMontaSelect;
    GroupBox1: TGroupBox;
    edpatro: TEdit;
    edprev: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    edmat: TEdit;
    ednome: TEdit;
    numinscprev: TEdit;
    Label4: TLabel;
    cmbplanass: TwwDBLookupCombo;
    edSitPart: TEdit;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    chkLstCont: TCheckListBox;
    qrycapsegass: TwwQuery;
    dscapsegass: TwwDataSource;
    qrycapsegassPREMIOFXA: TFloatField;
    qrycapsegassPREMIOFXB: TFloatField;
    qrycapsegassPREMIOFXC: TFloatField;
    qrycapsegassPREMIOFXD: TFloatField;
    dbgCapSegAss: TwwDBGrid;
    qrycapsegassTIPOSEG: TStringField;
    procedure bbtnConsultarClick(Sender: TObject);
    procedure procurapart;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure calculaestima;
    procedure executaregra;
    procedure qryregraBeforeOpen(DataSet: TDataSet);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    procedure btnvoltarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbplanassChange(Sender: TObject);
  private
    { Private declarations }
  public
    resultado : real;
    { Public declara
    tions }
  end;

var
  frmEstimaContr: TfrmEstimaContr;
  cAux: char;
  idpessoa, idplanoprev, idpessjur : string;

implementation

uses UAdmAss;

{$R *.DFM}

procedure TfrmEstimaContr.bbtnConsultarClick(Sender: TObject);
begin
  inherited;

  try
    MontaSelect.Executar;
    if MontaSelect.RetornouValor then
    begin
      IdPessoa := Montaselect.ValoresChave[0];
      IdPlanoPrev := Montaselect.ValoresChave[3];
      IdPessJur := Montaselect.ValoresChave[2];
      procuraPart;
    end;
  except
    btnvoltarClick(self);
  end;
end;

procedure TfrmEstimaContr.procuraPart;
var sSql1: string;
begin
  sSql1:='SELECT DISTINCT '+#13+
         '       CC.NOME, '+#13+
         '       CC.IDPESSOA,'+#13+
         '       PV.IDPLANOPREV, '+#13+
         '       PATRO.NOME PATRO,'+#13+
         '       PATRO.IDPESSOA IDPESSJUR ,'+#13+
         '       PV.NOME PREV, '+#13+
         '       EL.MATRICULA MAT, '+#13+
         '       PTV.INSCRICAONUMERO INSCPREV,'+#13+
         '       TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'+#13+
         '       SP.DESCRICAO AS SITUACAO ' +#13+
         'FROM   PLANPREV PV, '+#13+
         '       ELEGPATRO EL,'+#13+
         '       PESSOA CC, '+#13+
         '       PESSOAFISICA PF, '+#13+
         '       PARTPREVPLAN PTV,'+#13+
         '       PESSOA PATRO, '+#13+
         '       SITPART SP  '+#13+
         ' WHERE (CC.IDPESSOA = EL.IDPESSOA)  AND '+#13+
         '       (CC.IDPESSOA = PF.IDPESSOA)  AND '+#13+
         '       (PTV.IDPLANOPREV = PV.IDPLANOPREV) AND '+#13+
         '       (CC.IDPESSOA = PTV.IDPESSOA) AND '+#13+
         '       (EL.IDPESSJUR = PTV.IDPESSJUR) AND '+#13+
         '       (PATRO.IDPESSOA = EL.IDPESSJUR) AND '+#13+
         '       (EL.IDPESSJUR =' +IdPessjur+ ') AND'+#13+
         '       (PV.IDPLANOPREV  = ' +IdPlanoprev+ ') AND'+#13+
         '       (CC.IDPESSOA  = ' +IdPessoa+ ') AND'+#13+
         '       (PTV.IDSITPART = SP.IDSITPART)';
  qryaux.sql.clear;

  qryaux.sql.add(sSql1);
  try
    qryaux.Open;
  except
     raise;
  end;

  if (qryaux.isempty) then
  begin
     showmessage('Não foi encontrado nenhuma pessoa nos parâmetros correntes !');
     exit;
  end;

  edPatro.text     := qryaux.fieldbyname('PATRO').AsString;
  edPrev.text      := qryaux.fieldbyname('PREV').AsString;
  edMat.text       := qryaux.fieldbyname('MAT').AsString;
  numInscPrev.text := qryaux.fieldbyname('INSCPREV').AsString;
  edNome.text      := qryaux.fieldbyname('NOME').AsString;
  edSitPart.Text   := qryaux.FieldByName('SITUACAO').AsString;
end;

procedure TfrmEstimaContr.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edMat.text := '';
  edNome.text := '';
  edPatro.text := '';
  numInscPrev.text := '';
  edPrev.text := '';
  cmbPlanAss.text := '';
  qryContribAss.close;
  edValor.text := '';

  DecimalSeparator := ',';
end;

procedure TfrmEstimaContr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cAux := DecimalSeparator;
  DecimalSeparator := '.';
  resultado := 0;

  if not  qrycontribass.active then
  begin
     showmessage('É preciso procurar uma pessoa !');
     exit;
  end;

  calculaestima;
end;

procedure TfrmEstimaContr.calculaestima;
var marcado, i: integer;
begin
  edvalor.Value:=0.00;
  qryCapSegAss.Close;
  qryCapsegAss.ParamByName('IDPLANASS').Value:=qryPlanass.FieldByName('IDPLANASS').Value;
  qryCapSegAss.Open;
  If qryCapSegAss.IsEmpty then
  begin
    dbgCapSegAss.Visible:=False;
    qryregra.close;
    qryregra.open;

    marcado := 0;
    For i:=0 to chklstCont.Items.Count - 1 do
    begin
      If not chklstCont.checked[i] then continue
      else marcado := marcado + 1;
    end;

    For i := 0 to chklstCont.Items.Count - 1 do
    begin
      If (not chklstCont.checked[i]) and (marcado <> 0) then
        continue;
      If qryContribass.Locate('Nome',chklstCont.items[i],[loPartialKey]) then
        ExecutaRegra;
    end; //for i := 0 to chklstCont;

    DecimalSeparator := cAux;
    edvalor.Value := StrFloat(FloatToStr(resultado),1);
  end
  else
    dbgCapSegAss.Visible:=True;
end;

procedure TfrmEstimaContr.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('NOME').AsString);
        next;
     end;
  end;
end;

procedure TfrmEstimaContr.executaregra;
begin
    RegraEstima.rulename := qryContribass.fieldbyname('IDREGRA').ASSTRING;
    RegraEstima.execute;
    if RegraEstima.error then
    begin
       showmessage('Erro na regra !');
       exit;
    end
    else
    begin
       if regraestima.result <> '' then
       begin
          resultado := resultado + StrFloat(ClienteNumero(regraestima.result),1);
       end
       else
       begin
          resultado := 0;
       end;
    end;

    try
    except
       showmessage('Erro da Regra !');
       exit;
    end;
end;


procedure TfrmEstimaContr.qryregraBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryregra.parambyname('IDPESSOA').AsInteger := qryaux.fieldbyname('IDPESSOA').AsInteger ;
  qryregra.parambyname('IDPESSJUR').AsInteger := qryaux.fieldbyname('IDPESSJUR').AsInteger ;
  qryregra.parambyname('IDPLANOPREV').AsInteger := qryaux.fieldbyname('IDPLANOPREV').AsInteger ;
  qryregra.parambyname('IDPLANASS').AsInteger := qryplanass.fieldbyname('IDPLANASS').AsInteger ;
end;


procedure TfrmEstimaContr.bbtnSairClick(Sender: TObject);
begin
  DecimalSeparator := ',';
  inherited;
end;

procedure TfrmEstimaContr.bbtnEnviarClick(Sender: TObject);
begin
  inherited;
  dbgCapSegAss.Visible:=False;
  if (edpatro.text = '') and (edprev.text = '') then
  begin
    showmessage('É preciso procurar um participante !');
    exit;
  end;

  if Cmbplanass.text = '' then
  begin
    showmessage('É preciso selecionar o plano assistencial desejado !');
    exit;
  end;

  cAux := DecimalSeparator;
  DecimalSeparator := '.';
  resultado := 0;

  if not  qrycontribass.active then
  begin
     showmessage('É preciso procurar uma pessoa !');
     exit;
  end;

  calculaestima;
end;

procedure TfrmEstimaContr.btnvoltarClick(Sender: TObject);
begin
  inherited;
  edMat.text := '';
  edNome.text := '';
  edPatro.text := '';
  numInscPrev.text := '';
  edPrev.text := '';
  cmbPlanAss.text := '';
  qryContribAss.close;
  edValor.text := '';

  DecimalSeparator := ',';

  chklstCont.Items.Clear;
  dbgCapSegAss.Visible:=False;
end;

procedure TfrmEstimaContr.FormActivate(Sender: TObject);
begin
  inherited;
  qryPlanAss.close;
  qryPlanAss.open;
end;

procedure TfrmEstimaContr.cmbplanassChange(Sender: TObject);
begin
  inherited;
  qrycontribass.close;
  qrycontribass.parambyname('IDPLANASS').AsInteger := qryplanass.fieldbyname('IDPLANASS').AsInteger;
  qrycontribass.open;
  CriaLista(chklstCont,qryContribass);
  dbgCapSegAss.Visible:=False;
end;

end.
