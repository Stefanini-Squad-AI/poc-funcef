unit FRelHistFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, checklst, ComCtrls, Buttons, Spin, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db,
  DBTables, Wwquery, Wwqbe;

type
  TfrmRelHistFinanc = class(TfrmOkCancelar)
    Participante: TGroupBox;
    Label4: TLabel;
    edparticipante: TEdit;
    GroupBox4: TGroupBox;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    chkhistorico: TCheckListBox;
    procuraPart: TMontaSelect;
    cmbmes1: TComboBox;
    spinano1: TSpinEdit;
    Label3: TLabel;
    Label5: TLabel;
    lbPlanoPrev: TLabel;
    lbPatrocinadora: TLabel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    cmbmes2: TComboBox;
    Label7: TLabel;
    spinano2: TSpinEdit;
    chkInicio: TCheckBox;
    chkFim: TCheckBox;
    chkplano: TCheckListBox;
    qryplano: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edparticipanteMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure chkInicioClick(Sender: TObject);
    procedure chkFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelHistFinanc: TfrmRelHistFinanc;


implementation
uses drelassistencial, UMensErro;
{$R *.DFM}

procedure TfrmRelHistFinanc.FormShow(Sender: TObject);
var
  dia, mes, ano : word;
  I : integer;
begin
  inherited;

  decodedate(date, ano, mes, dia);
  cmbmes1.itemindex := mes - 1;
  spinano1.Text := inttostr(ano);
  cmbmes1.text := cmbmes1.Items.Strings[mes-1];
  cmbmes2.itemindex := mes - 1;
  spinano2.Text := inttostr(ano);
  cmbmes2.text := cmbmes2.Items.Strings[mes-1];

  edparticipante.clear;
  qryplano.open;

  for i:=0 to qryplano.recordcount - 1 do
  begin
    chkplano.items.add(qryplano.fieldbyname('NOME').asString);
    qryplano.next;
  end;
end;

procedure TfrmRelHistFinanc.bbtnConfirmarClick(Sender: TObject);
const
  status : array[0..5] of Char = ('0', '1', '2', '3', '4', '9');
  svMes  : array[0..1] of string = ('mes', 'mescobranca');
var
  ssql, periodo1, periodo2, planos, historico, smes : string;
  i, marcados{, idtitular}: integer;
  {d1, d2 : TDateTime;}
begin
  inherited;

  if edparticipante.Text = '' then
  begin
    MsgDlg('Participante não foi informado. ','Atenção', mtInformation, [mbOk, mbHelp], 0);
    edparticipante.SetFocus;
    exit;
  end;
  {else
    idTitular := strtoint(procuraPart.ValoresChave[1]);}

  periodo1 := '';
  if chkInicio.Checked then
  begin
    if cmbmes1.itemindex <= 9 then
       periodo1 := spinano1.text+'/0'+inttostr(cmbmes1.ItemIndex + 1)
    else
       periodo1 := spinano1.text+'/'+inttostr(cmbmes1.ItemIndex + 1);
  end;

  periodo2 := '';
  if chkFim.Checked then
  begin
    if cmbmes2.itemindex <= 9 then
       periodo2 := spinano2.text+'/0'+inttostr(cmbmes2.ItemIndex + 1)
    else
       periodo2 := spinano2.text+'/'+inttostr(cmbmes2.ItemIndex + 1);
  end;

  if (periodo1 <> '') and (periodo2 <> '') then
  begin
 // d2 := StrToDate('1/'+inttostr(cmbmes2.ItemIndex + 1)+'/'+spinano2.text);
 // d1 := StrToDate('1/'+inttostr(cmbmes1.ItemIndex + 1)+'/'+spinano1.text);
    if StrToDate('1/'+inttostr(cmbmes2.ItemIndex + 1)+'/'+spinano2.text)
       < StrToDate('1/'+inttostr(cmbmes1.ItemIndex + 1)+'/'+spinano1.text) then
    begin
      MsgDlg('Mês final não pode ser anterior ao mês inicial. ','Atenção', mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;
  end;

  planos := '';
  marcados := 0;
  for i:=0 to chkplano.Items.Count-1 do
  begin
    if chkplano.checked[i] then
    begin
      qryplano.Locate('NOME', chkplano.items.strings[i],[]);
      planos := planos + inttostr(qryplano.fieldbyname('IDPLANASS').asinteger)+',';
      inc(marcados);
    end;
  end;
  if planos <> '' then
  begin
    if marcados = chkplano.Items.Count then
      planos := '' //todos itens foram marcados
    else
      planos := copy(planos,1,length(planos)-1);
  end;

  historico := '';
  marcados := 0;
  for i:=0 to chkhistorico.items.count-1 do
  begin
    if chkhistorico.checked[i] then
    begin
      historico := historico + status[i]+',';
      inc(marcados);
     end;
  end;
  if historico <> '' then
  begin
    if marcados = chkhistorico.Items.Count then
      historico := '' //todos itens foram marcados
    else
      historico :=trim(copy(historico,1,length(historico)-1));
  end;

  ssql := 'SELECT H.MES, H.MESCOBRANCA, M.DESCRICAO MOTIVO, PA.NOME PLANASS,'+
                ' PREV.NOME PLANPREV, PP.INSCRICAONUMERO INSCPREV, PJ.NOME PATRO,'+
                ' PT.NOME TITULAR, PD.NOME DEPENDENTE, C.NOME CONTRIBUICAO,'+
                ' PG.NOME PAGADOR, DECODE(H.FLGCOBCARNE,0,''FL'',1,''BC'') FOLHA,'+
                ' H.VALORESPERADO, H.VALORRECEBIDO, H.DATAPREVISAO,'+
                ' H.DATA DATAPAGTO, F.DESCRICAO FORMA, H.IDTIPO,'+
                ' DECODE(H.SITRECEBIMENTO,0,''NE'',1,''NR'',2,''OK'',3,''DV'',4,''TR'',9,''CN'',''##'') SITUACAO'+
           ' FROM HSTCONTRIBASS H, MOTIVO M, PLANASS PA, PLANPREV PREV,'+
                ' PESSOA PJ, PESSOA PT, PESSOA PD, PESSOA PG, CONTRIBUICAO C,'+
                ' CONTRIBASS CB, PORTADORFORMA F, PARTPREVPLAN  PP'+
          ' WHERE (H.IDMOTIVO = M.IDMOTIVO)'+
            ' AND (H.IDTITULAR ='+ procuraPart.valoreschave[1]+')'+
            ' AND (H.IDPLANASS = PA.IDPLANASS)'+
            ' AND (H.IDPLANOPREV = PREV.IDPLANOPREV)'+
            ' AND (H.IDPESSJUR = PJ.IDPESSOA)'+
            ' AND (H.IDTITULAR = PT.IDPESSOA)'+
            ' AND (H.IDDEPENDENTE = PD.IDPESSOA)'+
            ' AND (H.IDPAGADOR = PG.IDPESSOA)'+
            ' AND (H.IDCONTASS = C.IDCONTRIBUICAO)'+
            ' AND (H.IDPESSJUR   = PP.IDPESSJUR)'+
            ' AND (H.IDPLANOPREV = PP.IDPLANOPREV)'+
            ' AND (H.IDTITULAR   = PP.IDPESSOA)'+
            ' AND (H.IDPLANASS = CB.IDPLANASS)'+
            ' AND (H.IDCONTASS = CB.IDCONTASS)'+
            ' AND (CB.PAGADOR = ''C'')'+
            ' AND (H.CODPORTFORMA = F.CODPORTFORMA(+))';

  if planos <> '' then
    ssql := ssql + ' AND (H.IDPLANASS IN ('+planos+'))';

  if historico <> '' then
    ssql := ssql + ' AND (H.SITRECEBIMENTO IN ('+historico+'))';

  smes := svMes[Radiogroup1.ItemIndex];
  if (periodo1 <> '') and (periodo2 <> '') then
  begin
    ssql := ssql + ' and (h.'+smes+' between '''+periodo1+''' and '''+periodo2+''')';
  end
  else
  begin
    if periodo1 <> '' then
    begin
      ssql := ssql + ' and (h.'+smes+' >= '''+periodo1+''')';
    end;
    if periodo2 <> '' then
    begin
      ssql := ssql + ' and (h.'+smes+' <= '''+periodo2+''')';
    end;
  end;

  ssql := ssql + ' order by h.mes, h.mescobranca';

  with dtmRelAssistencial.qryHistFinanc do
  begin
    close;
    sql.clear;
    sql.add(ssql);
    open;
  end;

  dtmRelAssistencial.rpHistFinanc.Print;
end;

procedure TfrmRelHistFinanc.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  procuraPart.Executar;

  if procuraPart.RetornouValor then
  begin
    edParticipante.text := procuraPart.ValoresChave[0];
    lbPlanoPrev.Caption := procuraPart.ValoresChave[2];
    lbPatrocinadora.Caption := procuraPart.ValoresChave[3];
    exit;
  end;
end;

procedure TfrmRelHistFinanc.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  edParticipante.clear;
end;

procedure TfrmRelHistFinanc.edparticipanteMouseMove(Sender: TObject;
          Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  edParticipante.Hint := trim(edParticipante.text);
end;

procedure TfrmRelHistFinanc.chkInicioClick(Sender: TObject);
begin
  inherited;
  cmbMes1.enabled := chkInicio.Checked;
  spinAno1.enabled := chkInicio.Checked;
end;

procedure TfrmRelHistFinanc.chkFimClick(Sender: TObject);
begin
  inherited;
  cmbMes2.enabled := chkFim.Checked;
  spinAno2.enabled := chkFim.Checked;
end;

procedure TfrmRelHistFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  procuraPart.colunas[0] := ' distinct '+ procuraPart.colunas[0];
end;

end.
