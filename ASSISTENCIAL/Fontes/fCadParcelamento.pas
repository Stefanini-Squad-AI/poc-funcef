unit fCadParcelamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Wwdbspin, wwdblook, URegra, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadParcelamento = class(TfrmCadMestreDetalheCS)
    tabContribuicoes: TTabSheet;
    tabParcelas: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbedPartAss: TwwDBEdit;
    Label2: TLabel;
    dbedPatro: TwwDBEdit;
    Label3: TLabel;
    dbedPlanPrev: TwwDBEdit;
    Label4: TLabel;
    dbedPlanAss: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    qryPlano: TwwQuery;
    spdApagaPlano: TSpeedButton;
    Label6: TLabel;
    dbcbIdRegra: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    Label7: TLabel;
    spNumParcelas: TwwDBSpinEdit;
    btnProcurar: TBitBtn;
    MontaSelect1: TMontaSelect;
    dbchkFlgRecalcular: TDBCheckBox;
    dblcPlano: TwwDBLookupCombo;
    Label8: TLabel;
    dbcbAlterador: TwwDBLookupCombo;
    Label9: TLabel;
    dbcbIdRegra2: TwwDBLookupCombo;
    qryRegra2: TwwQuery;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryAlterador: TwwQuery;
    dbgrdContrib: TwwDBGrid;
    qryContrib: TwwQuery;
    dsContrib: TwwDataSource;
    qryParcAssItens: TwwQuery;
    updContrib: TUpdateSQL;
    dbgrdParcelas: TwwDBGrid;
    qryParcelas: TwwQuery;
    dsParcelas: TwwDataSource;
    tabOutras: TTabSheet;
    rgFlgCobCarne: TRadioGroup;
    Label21: TLabel;
    cmbFormaPag: TwwDBLookupCombo;
    qryPortForm: TwwQuery;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    dtPrevisao: TCMDateTimePicker;
    btnCalcularParcelas: TBitBtn;
    btnCalcularDivida: TBitBtn;
    GroupBox3: TGroupBox;
    lbDivida: TLabel;
    RegCalculo: TRegra;
    procedure FormCreate(Sender: TObject);
    procedure spdApagaPlanoClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure dblcPlanoChange(Sender: TObject);
    procedure rgFlgCobCarneClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dbgrdContribDblClick(Sender: TObject);
    procedure btnCalcularParcelasClick(Sender: TObject);
    procedure btnCalcularDividaClick(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    function  CalculaAlteradoresContribuicao(qryC: TwwQuery): double;
    function  CorrigeContribuicao(qryC: TwwQuery): double;
    function  CalculaDividaAtual: double;
    procedure HabilitaCampos(flg: boolean);
    procedure InsereParcAssItens;
    procedure SelecionaAlteradores(pIdParcAss: integer);
    procedure SelecionaContribuicoes(pIdParcAss: integer);
    procedure SelecionaParcelas(pIdParcAss: integer);
  public
    { Public declarations }
  end;

var
  frmCadParcelamento: TfrmCadParcelamento;

implementation

uses UDataBase, UMensErro, UAdmAss, uSincronismo;

{$R *.DFM}

var
  dblDivida: double;
  sFlgInterno: string;
  bPodeAlterar, bInsert, bCalcularDivida, bCalcularParcelas, bViuParcelas: boolean;
  iTabCorrente,
  iIdParcAss, iIdRegraPlano, iIdNumParcelasPlano,
  iIdPartic, iIdParticOld, iIdPatro, iIdPlanoPrev, iIdPlanoAss : integer;

//==============================================================================
// Rotinas de cálculo da dívida
//==============================================================================

function TfrmCadParcelamento.CalculaAlteradoresContribuicao(qryC: TwwQuery): double;
var qry1, qry2: TwwQuery;
begin
  qry1 := TwwQuery.Create(Application);
  qry1.DatabaseName := 'BaseDados';
  qry1.sql.Clear;
  qry1.sql.Add('SELECT IDREGRACALCULO'+
                ' FROM ALTERXCONTRIBASS'+
               ' WHERE (IDPLANASS = :IDPLANASS)'+
                 ' AND (IDCONTRIBUICAO = :IDCONTRIBUICAO)'+
                 ' AND (FLGCOBRA = 1)'+
                 ' AND (FLGATRASO = 1)');
  qry1.ParamByName('IDPLANASS').asInteger := qryC.FieldByname('IDPLANASS').asInteger;
  qry1.ParamByName('IDCONTRIBUICAO').asInteger := qryC.FieldByname('IDCONTASS').asInteger;
  try
    qry1.open;
  except
    result := 0;
    exit;
  end;
  if qry1.IsEmpty then
  begin
    MsgDlg('Não foi possível corrigir o valor da contribuição "'+
            qryC.FieldByname('CONTRIBUICAO').asString+
            '", pois não possui alteradores cadastrados ou não existe regra de negócio associada.',
            'Erro',mtError,[mbOK],0);
    result := 0;
    exit;
  end
  else
  begin
    //query passada para a regra de negócio
    qry2 := TwwQuery.Create(Application);
    qry2.DatabaseName := 'BaseDados';
    qry2.sql.Clear;
    qry2.sql.Add
      ('SELECT H.MES, :NOVOMESCOBRANCA as MESCOBRANCA, '+
              'TO_DATE(:DATACOBRANCA, ''dd/mm/yyyy'') as DATACOBRANCA, '+
              'H.IDMOTIVO, H.DATAPREVISAO,H.VALORESPERADO,H.VALORRECEBIDO, '+
              'H.DATA, H.IDTITULAR, H.IDDEPENDENTE '+
        ' FROM CONTRIBASS,CONTASS,HSTCONTRIBASS H  '+
       ' WHERE (H.IDPESSJUR   = :IDPESSJUR) AND'+
             ' (H.IDPLANOPREV = :IDPLANOPREV) AND'+
             ' (H.IDPLANASS   = :IDPLANASS) AND'+
             ' (H.IDCONTASS   = :IDCONTASS) AND'+
             ' (CONTRIBASS.IDPLANASS = CONTASS.IDPLANASS) AND'+
             ' (CONTRIBASS.IDCONTASS = CONTASS.IDCONTASS) AND'+
             ' (CONTRIBASS.PAGADOR = ''C'') AND'+
             ' (H.MES = :MES) AND'+
             ' (H.MESCOBRANCA  = :MESCOBRANCA) AND'+
             ' (H.IDTITULAR = CONTASS.IDTITULAR) AND'+
             ' (H.IDPLANOPREV = CONTASS.IDPLANOPREV) AND'+
             ' (H.IDPLANASS = CONTASS.IDPLANASS) AND'+
             ' (H.IDCONTASS = CONTASS.IDCONTASS) AND'+
             ' (H.IDDEPENDENTE = CONTASS.IDDEPENDENTE) AND'+
             ' (H.IDPESSJUR = CONTASS.IDPESSJUR) AND'+
             ' (H.IDTITULAR = :IDTITULAR) AND '+
             ' (H.IDDEPENDENTE = :IDDEPENDENTE)');
    qry2.ParamByName('NOVOMESCOBRANCA').asString := '';
    qry2.ParamByName('DATACOBRANCA').asString := dtPrevisao.text;
    qry2.ParamByName('IDPESSJUR').asInteger := qryC.FieldByname('IDPESSJUR').asInteger;
    qry2.ParamByName('IDPLANOPREV').asInteger := qryC.FieldByname('IDPLANOPREV').asInteger;
    qry2.ParamByName('IDPLANASS').asInteger := qryC.FieldByname('IDPLANASS').asInteger;
    qry2.ParamByName('IDCONTASS').asInteger := qryC.FieldByname('IDCONTASS').asInteger;
    qry2.ParamByName('MES').asString := qryC.FieldByname('MES').asString;
    qry2.ParamByName('MESCOBRANCA').asString := qryC.FieldByname('MESCOBRANCA').asString;
    qry2.ParamByName('IDTITULAR').asInteger := qryC.FieldByname('IDTITULAR').asInteger;
    qry2.ParamByName('IDDEPENDENTE').asInteger := qryC.FieldByname('IDDEPENDENTE').asInteger;
    try
      qry2.open;
    except
      result := 0;
      exit;
    end;

    qry1.first;
    //cálculo dos alteradores
    while not qry1.eof do
    begin
      if qry1.FieldByName('IDREGRACALCULO').asString <> '' then
      begin
        regCalculo.queryIn := qry2;
        regCalculo.RuleName := qry1.FieldByName('IDREGRACALCULO').asString;
        try
          regCalculo.execute;
        except
          MsgDlg('Erro na execução da regra de negócio associada à contribuição "'+
                  qryC.FieldByname('CONTRIBUICAO').asString+'".',
                  'Erro',mtError,[mbOK],0);
          result := 0;
          exit;
        end;
        
      end;//if
      qry1.next
    end;//while
  end;//if
end;

function TfrmCadParcelamento.CorrigeContribuicao(qryC: TwwQuery): double;
var dblPrincipal, dblAlteradores: double;
begin
  dblPrincipal := qryC.FieldByName('VALORESPERADO').asFloat;
  dblAlteradores := CalculaAlteradoresContribuicao(qryC);
  result := dblPrincipal + dblAlteradores;
end;

function TfrmCadParcelamento.CalculaDividaAtual: double;
var dblSoma, dblVal: double;
begin
  dblSoma := 0;
  qryContrib.First;
  while not qryContrib.EOF do
  begin
    if qryContrib.FieldByName('FLGCONTRIBUICAO').asInteger = 1 then
    begin
      dblVal := CorrigeContribuicao(qryContrib);
      dblSoma := dblSoma + dblVal;
      qryContrib.next;
    end;
  end;
  result := dblSoma;
end;

//==============================================================================

procedure TfrmCadParcelamento.HabilitaCampos(flg: boolean);
begin
  dbgrdContrib.enabled  := flg;
  dbgrdParcelas.enabled := flg;
  rgFlgCobCarne.enabled := flg;
  cmbFormaPag.enabled   := flg;
  GroupBox5.enabled     := flg and (rgFlgCobCarne.itemIndex = 1);
end;

procedure TfrmCadParcelamento.InsereParcAssItens;
//insere em ParcAssItens contribuições (HstContribAss) devidas e que ainda
//não foram inseridas.
var qry1, qry2: TwwQuery;
    iIdParcAssItens: integer;
begin
  qry1 := TwwQuery.Create(Application);
  qry1.DatabaseName := 'BaseDados';
  qry1.sql.Clear;
  qry1.sql.Add
    ('select h.seqproposta, h.mes, h.idmotivo, h.mescobranca, h.idplanass,'+
           ' h.idplanoprev, h.idpessjur, h.idtitular, h.iddependente, h.idcontass'+
      ' from hstcontribass h'+
     ' where (h.idpessjur = :idpessjur) and'+
           ' (h.seqproposta = :seqproposta) and'+
           ' (h.idplanoprev = :idplanoprev) and'+
           ' (h.idplanass = :idplanass) and'+
           ' (h.idtitular = :idtitular) and'+
           ' (h.sitrecebimento = 1) and'+
           ' (not exists (select pi.idparcassitens'+
                          ' from parcassitens pi'+
                         ' where (pi.idparcass = :idparcass) and'+
                               ' (pi.tipo = ''C'') and'+
                               ' (pi.seqproposta = h.seqproposta) and'+
                               ' (pi.mes = h.mes) and'+
                               ' (pi.idmotivo = h.idmotivo) and'+
                               ' (pi.mescobranca = h.mescobranca) and'+
                               ' (pi.idplanass = h.idplanass) and'+
                               ' (pi.idplanoprev = h.idplanoprev) and'+
                               ' (pi.idpessjur = h.idpessjur) and'+
                               ' (pi.idtitular = h.idtitular) and'+
                               ' (pi.iddependente = h.iddependente) and'+
                               ' (pi.idcontass = h.idcontass) and'+
                               ' (pi.idcontass = h.idcontass)))');
  qry1.ParamByName('idpessjur').asinteger   := iIdPatro;
  qry1.ParamByName('seqproposta').asinteger := 1;
  qry1.ParamByName('idplanoprev').asinteger := iIdPlanoPrev;
  qry1.ParamByName('idplanass').asinteger   := iIdPlanoAss;
  qry1.ParamByName('idtitular').asinteger   := iIdPartic;
  qry1.ParamByName('idparcass').asinteger   := iIdParcAss;
  try
    qry1.open;
  except
    raise;
  end;
  if not qry1.IsEmpty then
  begin
    qry2 := TwwQuery.Create(Application);
    qry2.DatabaseName := 'BaseDados';
    while not qry1.EOF do
    begin
      iIdParcAssItens := LeUltRegistro(qry2,'PARCASSITENS');
      qry2.sql.Clear;
      qry2.sql.Add
        ('insert into parcassitens (idparcassitens, seqproposta, mes, idmotivo,'+
                    ' mescobranca, idplanass, idplanoprev, idpessjur, idtitular,'+
                    ' iddependente, idcontass, idparcass, tipo, flgcontribuicao)'+
             ' values (:idparcassitens, :seqproposta, :mes, :idmotivo, :mescobranca,'+
                    ' :idplanass, :idplanoprev, :idpessjur, :idtitular, :iddependente,'+
                    ' :idcontass, :idparcass, ''C'', 1)');
      qry2.ParamByName('idparcassitens').AsInteger := iIdParcAssItens;
      qry2.ParamByName('seqproposta').AsInteger := qry1.FieldByName('seqproposta').AsInteger;
      qry2.ParamByName('mes').AsString := qry1.FieldByName('mes').AsString;
      qry2.ParamByName('idmotivo').AsInteger := qry1.FieldByName('idmotivo').AsInteger;
      qry2.ParamByName('mescobranca').AsString := qry1.FieldByName('mescobranca').AsString;
      qry2.ParamByName('idplanass').AsInteger := qry1.FieldByName('idplanass').AsInteger;
      qry2.ParamByName('idplanoprev').AsInteger := qry1.FieldByName('idplanoprev').AsInteger;
      qry2.ParamByName('idpessjur').AsInteger := qry1.FieldByName('idpessjur').AsInteger;
      qry2.ParamByName('idtitular').AsInteger := qry1.FieldByName('idtitular').AsInteger;
      qry2.ParamByName('iddependente').AsInteger := qry1.FieldByName('iddependente').AsInteger;
      qry2.ParamByName('idcontass').AsInteger := qry1.FieldByName('idcontass').AsInteger;
      qry2.ParamByName('idparcass').AsInteger := iIdParcAss;
      try
          qry2.execsql;
          qry2.Close;
      except
        raise;
      end;
      qry1.next;
    end;
    SelecionaContribuicoes(iIdParcAss);//atualiza contribuições
  end;
end;

procedure TfrmCadParcelamento.SelecionaAlteradores(pIdParcAss: integer);
begin
  qryDet.Close;
  qryDet.ParamByName('IDPARCASS').AsInteger := pIdParcAss;
  qryDet.Open;
end;

procedure TfrmCadParcelamento.SelecionaContribuicoes(pIdParcAss: integer);
begin
  qryContrib.Close;
  qryContrib.ParamByName('IDPARCASS').AsInteger := pIdParcAss;
  qryContrib.Open;
  //marca contribuições selecionadas para parcelamento
  qryContrib.first;
  if not qryContrib.isEmpty then
  begin
    while not qryContrib.eof do
    begin
      qryParcAssItens.ParamByName('IDPARCASS').asInteger := iIdParcAss;
      qryParcAssItens.ParamByName('MES').asString := qryContrib.FieldByName('MES').asString;
      qryParcAssItens.ParamByName('IDMOTIVO').asInteger := qryContrib.FieldByName('IDMOTIVO').asInteger;
      qryParcAssItens.ParamByName('MESCOBRANCA').asString := qryContrib.FieldByName('MESCOBRANCA').asString;
      qryParcAssItens.ParamByName('IDPLANASS').asInteger := qryContrib.FieldByName('IDPLANASS').asInteger;
      qryParcAssItens.ParamByName('IDPLANOPREV').asInteger := qryContrib.FieldByName('IDPLANOPREV').asInteger;
      qryParcAssItens.ParamByName('IDPESSJUR').asInteger := qryContrib.FieldByName('IDPESSJUR').asInteger;
      qryParcAssItens.ParamByName('IDTITULAR').asInteger := qryContrib.FieldByName('IDTITULAR').asInteger;
      qryParcAssItens.ParamByName('IDDEPENDENTE').asInteger := qryContrib.FieldByName('IDDEPENDENTE').asInteger;
      qryParcAssItens.ParamByName('IDCONTASS').asInteger := qryContrib.FieldByName('IDCONTASS').asInteger;
      try
        qryParcAssItens.open;
      except
        raise;
      end;
      qryParcAssItens.close;

      qryContrib.next;
    end;//while
  end;//if
end;

procedure TfrmCadParcelamento.SelecionaParcelas(pIdParcAss: integer);
begin
  qryParcelas.Close;
  qryParcelas.ParamByName('IDPARCASS').AsInteger := pIdParcAss;
  qryParcelas.Open;
end;

function VencimentoPrimeiraParcela: string;
var sAnoMesCobranca: string;
    Ano, Mes, Dia: Word;
    cTipoEnvPrev : char;
    qry: TwwQuery;
begin
  // Sincronismo : Verificar se o envio do CCP para a patrocinadora já foi encerrado
  // Se sim, dar a possibilidade de enviar para o próximo mês
  DecodeDate(Date, Ano, Mes, Dia);
  if mes > 9 then
    sAnoMesCobranca := inttostr(ano)+'/'+inttostr(mes)
  else
    sAnoMesCobranca := inttostr(ano)+'/0'+inttostr(mes);
  //
  if VerificaFechamento(iIdPatro,
                        cteIdModuloCCP,
                        sAnoMesCobranca,
                        'E', cTipoEnvPrev) then
  begin
    sAnoMesCobranca := ProximoMesAberto(sAnoMesCobranca,
                                        iIdPatro,
                                        cteIdModuloCCP, 'E');
  end;

  qry := TwwQuery.Create(Application);
  qry.DatabaseName := 'BaseDados';

  result := CriticaDataCobrancaAssist(qry,
                                      inttostr(iIdPatro),
                                      inttostr(iIdPlanoPrev),
                                      sFlgInterno,
                                      inttostr(iIdPlanoAss),
                                      'N',
                                      Copy(sAnoMesCobranca,6,2),
                                      Copy(sAnoMesCobranca,1,4));
end;

procedure TfrmCadParcelamento.FormCreate(Sender: TObject);
begin
  inherited;
  qryPlano.open;
  qryRegra.open;
  qryRegra2.open;
  qryAlterador.open;
  qryPortForm.open;

  qry.close;
  qry.parambyname('IDPARCASS').AsInteger := -1;
  qry.open;

  SelecionaAlteradores(-1);
  SelecionaContribuicoes(-1);
  SelecionaParcelas(-1);
  bPodeAlterar := false;
  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
  iTabCorrente := 0;
end;

procedure TfrmCadParcelamento.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := true;
   SelecionaAlteradores(-1);
   SelecionaContribuicoes(-1);
   SelecionaAlteradores(-1);

   inherited;

   bPodeAlterar := true;
   dtPrevisao.enabled := bPodeAlterar;
   dbchkFlgRecalcular.State := cbChecked;
   spdApagaPlano.enabled := true;
   btnProcurar.enabled := true;
   iIdParticOld := iIdPartic;
   iIdPartic := -1;

   InsereParcAssItens;

   HabilitaCampos(true);
   dblcPlano.SetFocus;
end;

procedure TfrmCadParcelamento.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := false;
   inherited;
   if (dblcPlano.text = '') then
   begin
     dbcbIdRegra.enabled := true;
     spNumParcelas.enabled := true;
     spdApagaPlano.enabled := false;
     dbcbIdRegra.SetFocus;
   end
   else
   begin
     dbcbIdRegra.enabled := false;
     spNumParcelas.enabled := false;
     spdApagaPlano.enabled := true;
     dblcPlano.SetFocus;
   end;

   InsereParcAssItens;

   HabilitaCampos(true);
end;

procedure TfrmCadParcelamento.CmeCadastroConfirma(Sender: TObject);
begin
  if (qry.State = dsInsert) then
  begin
    iIdParcAss := LeUltRegistro(nil,'PARCASS');
    qry.FieldByName('IDPARCASS').asInteger := iIdParcAss;
    qry.FieldByName('IDREGRAPRINCIPAL').asInteger := qryregra.FieldByName('IDREGRA').asInteger;
    qry.FieldByName('IDPESSJUR').asInteger := iIdPatro;
    qry.FieldByName('SEQPROPOSTA').asInteger := 1;
    qry.FieldByName('IDPLANOPREV').asInteger := iIdPlanoPrev;
    qry.FieldByName('IDPLANASS').asInteger := iIdPlanoAss;
    qry.FieldByName('IDPESSOA').asInteger := iIdPartic;
    if dblcPlano.text = '' then
      qry.FieldByName('IDPARCASSTIPOS').asString := ''
    else
      qry.FieldByName('IDPARCASSTIPOS').asInteger := qryPlano.FieldByName('IDPARCASSTIPOS').asInteger;
    qry.FieldByName('NUMPARCELAS').asInteger := strtoint(spNumParcelas.text);
    qry.FieldByName('TOTALCONTRIB').asInteger := 0;     //completar
    qry.FieldByName('TOTALALTERADORES').asInteger := 0; //completar
    qry.FieldByName('FLGPAROK').asInteger := 0;
  end;

  if (qry.State in [dsInsert,dsEdit]) then
  begin
    qryDet.First;
    while not qryDet.EOF do
    begin
       qryDet.edit;
       qryDet.FieldByName('IDPARCASS').AsInteger := iIdParcAss;
       qryDet.next;
    end;
    AplicaAlteracoes([qry,qryDet,qryContrib]);
  end
  else
  begin
    AplicaAlteracoes([qryDet,qry]);
  end;

  btnProcurar.enabled := false;
  spdApagaPlano.enabled := false;

  inherited;

  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
  HabilitaCampos(false);
end;

function VerificaPodeAlterar(pIdParcAss: integer): boolean;
var qry: TwwQuery;
begin
  //verifica se existe alguma parcela que já foi para cobranca
  qry := TwwQuery.Create(Application);
  qry.DatabaseName := 'BaseDados';
  qry.SQL.add('select p.idparcass'+
               ' from parcass p, parcassitens pi, hstcontribass h'+
              ' where (p.idparcass = :idparcass) and'+
                    ' (p.idparcass = pi.idparcass) and'+
                    ' (pi.seqproposta = h.seqproposta) and'+
                    ' (pi.mes = h.mes) and'+
                    ' (pi.idmotivo = h.idmotivo) and'+
                    ' (pi.mescobranca = h.mescobranca) and'+
                    ' (pi.idplanass = h.idplanass) and'+
                    ' (pi.idplanoprev = h.idplanoprev) and'+
                    ' (pi.idpessjur = h.idpessjur) and'+
                    ' (pi.idtitular = h.idtitular) and'+
                    ' (pi.iddependente = h.iddependente) and'+
                    ' (pi.idcontass = h.idcontass) and'+
                    ' (pi.tipo = ''P'') and'+
                    ' (h.sitrecebimento <> 0)');
  qry.paramByName('IDPARCASS').asInteger := pIdParcAss;
  try
    qry.open;
  except
    raise;
    result := false;
    exit;
  end;
  result := qry.IsEmpty;
end;

procedure TfrmCadParcelamento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    qryDet.close;
    qry.close;
    iIdParcAss := strtoint(MontaSelect.ValoresChave[0]);
    qry.parambyname('IDPARCASS').AsInteger := iIdParcAss;
    try
      qry.open;
      iIdPartic    := qry.FieldByName('IDPESSOA').asInteger;
      iIdPatro     := qry.FieldByName('IDPESSJUR').asInteger;
      iIdPlanoPrev := qry.FieldByName('IDPLANOPREV').asInteger;
      iIdPlanoAss  := qry.FieldByName('IDPLANASS').asInteger;
      sFlgInterno  := MontaSelect.ValoresChave[1];
    except
      exit;
    end;
    bPodeAlterar := VerificaPodeAlterar(iIdParcAss);
    SelecionaAlteradores(iIdParcAss);
    SelecionaContribuicoes(iIdParcAss);
    SelecionaAlteradores(iIdParcAss);

    bCalcularDivida := false;
    bCalcularParcelas := false;
    bViuParcelas := false;

    if sFlgInterno = 'MA' then
    begin
      rgFlgCobCarne.itemIndex := 1;
      rgFlgCobCarne.enabled := false;
      dtPrevisao.Text := datetostr(date);
      dtPrevisao.enabled := true;
    end
    else
    begin
      rgFlgCobCarne.itemIndex := 0;
      rgFlgCobCarne.enabled := true;
      dtPrevisao.text := VencimentoPrimeiraParcela();
      dtPrevisao.enabled := false;
    end;
    HabilitaCampos(false);
  end;
end;

procedure TfrmCadParcelamento.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  iIdPartic := iIdParticOld;
  btnProcurar.enabled := false;
  spdApagaPlano.enabled := false;
  dtPrevisao.enabled := false;

  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
  HabilitaCampos(false);
end;



procedure TfrmCadParcelamento.spdApagaPlanoClick(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDPARCASSTIPOS').asString := '';
  dbcbIdRegra.enabled := true;
  spNumParcelas.enabled := true;
  spdApagaPlano.down := false;
  spdApagaPlano.enabled := false;
end;

procedure TfrmCadParcelamento.btnProcurarClick(Sender: TObject);
begin
  MontaSelect1.Executar;
  if MontaSelect1.RetornouValor then
  begin
    iIdPartic    := strtoint(MontaSelect1.ValoresChave[0]);
    iIdPatro     := strtoint(MontaSelect1.ValoresChave[1]);
    iIdPlanoPrev := strtoint(MontaSelect1.ValoresChave[2]);
    iIdPlanoAss  := strtoint(MontaSelect1.ValoresChave[3]);
    sFlgInterno  := MontaSelect1.ValoresChave[8];

    dbedPartAss.Text  := MontaSelect1.ValoresChave[4];
    dbedPatro.Text    := MontaSelect1.ValoresChave[5];
    dbedPlanPrev.Text := MontaSelect1.ValoresChave[6];
    dbedPlanAss.Text  := MontaSelect1.ValoresChave[7];
  end;
end;

procedure TfrmCadParcelamento.dblcPlanoChange(Sender: TObject);
begin
  inherited;
  if (dblcPlano.text <> '') and (qry.State <> dsBrowse) then
  begin
    iIdRegraPlano := qryPlano.FieldByName('IDREGRAPRINCIPAL').asInteger;
    qry.FieldByName('NUMPARCELAS').asInteger := qryPlano.FieldByName('NUMPARCELAS').asInteger;
    iIdNumParcelasPlano := qryPlano.FieldByName('NUMPARCELAS').asInteger;
    qry.FieldByName('IDREGRAPRINCIPAL').asInteger := iIdRegraPlano;
    //qryRegra.locate('IDREGRA', iIdRegraPlano, []);
    spNumParcelas.text := inttostr(iIdNumParcelasPlano);
    dbcbIdRegra.enabled := false;
    spNumParcelas.enabled := false;
    spdApagaPlano.enabled := true;
  end;
end;

procedure TfrmCadParcelamento.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbcbAlterador.setFocus;
  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
end;

procedure TfrmCadParcelamento.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbcbAlterador.setFocus;
  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
end;

procedure TfrmCadParcelamento.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
end;

procedure TfrmCadParcelamento.CmeDetalheConfirma(Sender: TObject);
begin
  if (qrydet.state = dsInsert) then
  begin
    if (dbcbAlterador.text = '') then
    begin
       MsgDlg('Nenhum alterador foi selecionado.','Erro',mtError,[MbOK],0);
       dbcbAlterador.setfocus;
       exit;
    end;
    if (dbcbIdRegra2.text = '') then
    begin
       MsgDlg('Nenhuma regra foi selecionada.','Erro',mtError,[MbOK],0);
       dbcbIdRegra2.setfocus;
       exit;
    end;
  end;//if
  if (qrydet.state in [dsEdit, dsInsert]) then
  begin
    qryDet.FieldByName('IDPARCASS').asInteger := iIdParcAss;
    qryDet.FieldByName('DESCRICAO').asString := dbcbAlterador.text;
    qryDet.FieldByName('NOMEREGRA').asString := dbcbIdRegra2.text;
  end;

  inherited;

  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
end;

procedure TfrmCadParcelamento.rgFlgCobCarneClick(Sender: TObject);
begin
  inherited;
  if (rgFlgCobCarne.ItemIndex = 1) then
  begin
    cmbFormaPag.enabled := true;
    dtPrevisao.enabled := true;
  end
  else
  begin
    cmbFormaPag.enabled := false;
    cmbFormaPag.text := '';
    dtPrevisao.text := VencimentoPrimeiraParcela();
    dtPrevisao.enabled := false;
  end;
end;

procedure TfrmCadParcelamento.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IDPARCASS').AsInteger := iIdParcAss;
end;

procedure TfrmCadParcelamento.sbtnAlterarClick(Sender: TObject);
begin
  if not bPodeAlterar then
  begin
    MsgDlg('Parcelamento não pode ser alterado, pois existe parcela em cobrança ou já paga.',
           'Atenção', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;
  inherited;
end;

procedure TfrmCadParcelamento.sbtnApagarClick(Sender: TObject);
begin
  if not bPodeAlterar then
  begin
    MsgDlg('Parcelamento não pode ser excluído, pois existe parcela em cobrança ou já paga.',
           'Atenção', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;
  inherited;
end;

procedure TfrmCadParcelamento.bbtnConfirmarClick(Sender: TObject);
begin
  if (not bCalcularDivida) then
  begin
    MsgDlg('A dívida não foi calculada. Use o botão "Calcular dívida".',
           'Erro', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;
  if (not bCalcularParcelas) then
  begin
    MsgDlg('As parcelas não foram calculadas. Use o botão "Calcular parcelas".',
           'Erro', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;
  if (not bViuParcelas) then
  begin
    MsgDlg('As prestações não foram visualizadas. Selecione a página "Parcelas".',
           'Atenção', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;

  inherited;

  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
end;

procedure TfrmCadParcelamento.tbcDetalheChange(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 2) then
  begin
    if (not bCalcularDivida) then
    begin
      MsgDlg('A dívida não foi calculada. Use o botão "Calcular dívida".',
             'Erro', mtInformation, [mbOk, mbHelp], 0);
      tbcDetalhe.TabIndex := iTabCorrente;
      exit;
    end;
    if (not bCalcularParcelas) then
    begin
      MsgDlg('As parcelas não foram calculadas. Use o botão "Calcular parcelas".',
             'Erro', mtInformation, [mbOk, mbHelp], 0);
      tbcDetalhe.TabIndex := iTabCorrente;
      exit;
    end;
  end;

  inherited;

  iTabCorrente := tbcDetalhe.TabIndex;
  if (iTabCorrente = 2) then
    bViuParcelas := true;
end;

procedure TfrmCadParcelamento.dbgrdContribDblClick(Sender: TObject);
begin
  inherited;
  qryContrib.edit;
  qryContrib.FieldByName('flgContribuicao').asInteger := 1 - qryContrib.FieldByName('flgContribuicao').asInteger;
  qryContrib.post;

  bCalcularDivida := false;
  bCalcularParcelas := false;
  bViuParcelas := false;
end;

procedure TfrmCadParcelamento.btnCalcularParcelasClick(Sender: TObject);
begin
  inherited;
  if (not bCalcularDivida) then
  begin
    MsgDlg('A dívida não foi calculada. Use o botão "Calcular dívida".',
           'Erro', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;

  showmessage('Calcular...');
//...
  bCalcularParcelas := true;
end;

procedure TfrmCadParcelamento.btnCalcularDividaClick(Sender: TObject);
begin
  inherited;
  dblDivida := CalculaDividaAtual();
             //==================
  bCalcularDivida := true;
  lbDivida.caption := format('R$ %4.2f', [dblDivida]);
  tbcDetalhe.TabIndex := 3;
  pgctrlDetalhe.ActivePage := tabOutras;
end;

procedure TfrmCadParcelamento.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := false;
   if (iIdPartic = -1) then
   begin
      MsgDlg('Nenhum participante foi selecionado.','Erro',mtError,[MbOK],0);
      exit;
   end;
   if (trim(dblcPlano.text) = '') and (trim(dbcbIdRegra.text) = '') then
   begin
      MsgDlg('Selecione uma regra para cálculo do principal.','Erro',mtError,[MbOK],0);
      dbcbIdRegra.SetFocus;
      exit;
   end;
   Accept := true;
  inherited;
end;

end.
