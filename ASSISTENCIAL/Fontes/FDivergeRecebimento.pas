unit FDivergeRecebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, checklst, ComCtrls, Buttons, Spin, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db,
  DBTables, Wwquery, Wwqbe;

type
  TfrmdivergeRecebimento = class(TfrmOkCancelar)
    Participante: TGroupBox;
    Label4: TLabel;
    edparticipante: TEdit;
    GroupBox4: TGroupBox;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkpatrocinadora: TCheckListBox;
    TabSheet2: TTabSheet;
    chkplano: TCheckListBox;
    qrypatrocinadora: TwwQuery;
    qryplano: TwwQuery;
    procuraPart: TMontaSelect;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    chkdivergencias: TCheckBox;
    chkenviadas: TCheckBox;
    RadioGroup1: TRadioGroup;
    cmbmes: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    spinano: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edparticipanteMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdivergeRecebimento: TfrmdivergeRecebimento;

implementation
uses dRelAssistencial, UAdmAss;
{$R *.DFM}

procedure TfrmdivergeRecebimento.FormShow(Sender: TObject);
var i : integer;
begin
  inherited;
  RetornaDataCorr(cmbmes, spinano);

  radiogroup1.ItemIndex := 0;
  chkenviadas.Enabled := true;
  chkenviadas.Checked := true;
  chkdivergencias.Enabled := true;
  chkdivergencias.Checked := true;

  edparticipante.clear;
  qryplano.open;
  qrypatrocinadora.open;

  for i:=0 to qrypatrocinadora.recordcount - 1 do
  begin
    chkpatrocinadora.Items.Add(qrypatrocinadora.fieldbyname('nome').asstring);
    qrypatrocinadora.next;
  end;

  for i:=0 to qryplano.recordcount - 1 do
  begin
    chkplano.items.add(qryplano.fieldbyname('nome').asstring);
    qryplano.next;
  end;
end;

procedure TfrmdivergeRecebimento.bbtnConfirmarClick(Sender: TObject);
var
   subquery, ssql, periodo, patrocinadoras, planos, tratamento : string;
   i{, idtitular} : integer;
begin
  inherited;
   if Radiogroup1.ItemIndex = 0 then
   begin
      if (not(chkdivergencias.Checked) and not (chkenviadas.checked)) then
      begin
        showmessage('Tipo de Contribuições não Selecionado');
        exit;
      end
      else
      begin
         tratamento := '';
         if chkdivergencias.checked then
           tratamento := tratamento + '3,';

         if chkenviadas.checked then
           tratamento := tratamento + '1,';

         tratamento:=copy(tratamento,1,length(tratamento)-1);
         drelassistencial.dtmRelAssistencial.titulo.caption:='Relatório Mensal de Divergências';
      end;
  end
  else
  if (radiogroup1.ItemIndex = 1) then
  begin
        tratamento := '4';
        tratamento := trim(tratamento);
        drelassistencial.dtmrelassistencial.Titulo.Caption := 'Relatório Mensal de Divergências Tratadas';
  end;

  if cmbmes.itemindex <= 9 then
     periodo := spinano.text+'/0'+inttostr(cmbmes.ItemIndex + 1)
  else
     periodo := spinano.text+'/'+inttostr(cmbmes.ItemIndex + 1);

  patrocinadoras := '';
  for i:=0 to chkpatrocinadora.Items.Count-1 do
  begin
    if chkpatrocinadora.checked[i] then
    begin
      qrypatrocinadora.Locate('nome',chkpatrocinadora.items.strings[i],[]);
      patrocinadoras := patrocinadoras + inttostr(qrypatrocinadora.fieldbyname('idpessoa').asinteger)+',';
    end;
  end;
  if patrocinadoras <> '' then
    patrocinadoras:=copy(patrocinadoras,1,length(patrocinadoras)-1);

  planos := '';
  for i:=0 to chkplano.items.count-1 do
  begin
     if chkplano.checked[i] then
     begin
        qryplano.Locate('nome',chkplano.items.strings[i],[]);
        planos := planos + inttostr(qryplano.fieldbyname('idplanass').asinteger)+',';
     end;
  end;
  if planos <> '' then
      planos := trim(copy(planos,1,length(planos)-1));
  (*
  if (edparticipante.text) <> '' then
    idtitular := strtoint(procuraPart.ValoresChave[1]);
  *)
  
 ssql:= 'SELECT H.MES, '+
               'H.MESCOBRANCA, '+
               'P.IDPESSOA MATRICULA, ' +
               'P.NOME   PARTICIP, '+
               'PJ.NOME  PATRO, '+
               'PA.NOME  PLANOASSIS, '+
               'PR.NOME  REGIONAL, '+
               'PD.NOME  DEPENDENTE, '+
               'C.NOME  CONTRIBUICAO, '+
               'H.VALORESPERADO ,'+
               'H.VALORRECEBIDO, '+
               '(NVL(H.VALORRECEBIDO,0) - H.VALORESPERADO) AS DIFERENCA, '+
               'H.SITRECEBIMENTO, '+
               'DECODE(H.SITRECEBIMENTO,1,''NAO RECEBIDA'' '+
               '                       ,3,''DIVERGENTE/ATRASO'''+
               '                       ,4,''TRATADA'') AS SITUACAO, '+
               ' H.SEQPROPOSTA, '+
               ' H.MESCOBRANCA, '+
               ' H.MES, '+
               ' H.IDTITULAR,  '+
               ' H.IDPLANOPREV, '+
               ' H.IDPLANASS, '+
               ' H.IDPESSJUR, '+
               ' H.IDMOTIVO, '+
               ' H.IDDEPENDENTE, '+
               ' H.IDCONTASS '+
        ' FROM  HSTCONTRIBASS H, '+
        '       PESSOA        P, '+
        '       PESSOA       PJ, '+
        '       PESSOA       PR, '+
        '       PESSOA       PD, '+
        '       PLANASS      PA, '+
        '       ELEGPATRO    EP, '+
        '       CONTRIBUICAO C '+
        ' WHERE (H.MES = '+quotedstr(periodo)+')';
  if patrocinadoras <> '' then
    ssql := ssql + '      AND (H.IDPESSJUR IN ('+patrocinadoras+'))';

  if planos <> '' then
    ssql := ssql + ' AND (H.IDPLANASS IN ('+planos+'))';

  if edparticipante.text <> '' then
    ssql := ssql + '     AND  (H.IDTITULAR ='+ procuraPart.valoreschave[1]+')';

  ssql := ssql + ' AND (H.IDTITULAR = P.IDPESSOA) '+
               ' AND (H.IDPESSJUR = PJ.IDPESSOA)'+
               ' AND (H.IDPLANASS = PA.IDPLANASS) '+
               ' AND (H.IDTITULAR = EP.IDPESSOA )'+
               ' AND (H.IDPESSJUR = EP.IDPESSJUR) '+
               ' AND (EP.IDESTAB  = PR.IDPESSOA) '+
               ' AND (H.IDDEPENDENTE   = PD.IDPESSOA) '+
               ' AND (H.IDCONTASS      = C.IDCONTRIBUICAO) '+
               ' AND (H.SITRECEBIMENTO IN ('+tratamento+'))';

  with dtmrelassistencial.qrydivergerecebimento do
  begin
    close;
    sql.clear;
    sql.add(ssql);
    open;
  end;

  with dtmrelassistencial.SubQueryAlterador do
  begin
    Drelassistencial.Totalizador:=0;
    subquery := sql.text;
    open;
  end;

  dtmRelAssistencial.rpDivergeRecebimento.Print;
end;

procedure TfrmdivergeRecebimento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  procuraPart.Executar;

  if procuraPart.RetornouValor then
  begin
    edParticipante.text := procuraPart.ValoresChave[0];
    exit;
  end;
end;

procedure TfrmdivergeRecebimento.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  edparticipante.clear;
end;

procedure TfrmdivergeRecebimento.edparticipanteMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  edparticipante.Hint := trim(edparticipante.text);
end;

procedure TfrmdivergeRecebimento.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  case radiogroup1.ItemIndex of
    0 : begin
          chkdivergencias.Enabled := true;
          chkenviadas.Enabled := true;
        end;
    1 : begin
          chkdivergencias.AllowGrayed := false;
          chkdivergencias.enabled := false;
          chkenviadas.AllowGrayed := false;
          chkenviadas.enabled := false;
        end;
   end;
end;

end.
