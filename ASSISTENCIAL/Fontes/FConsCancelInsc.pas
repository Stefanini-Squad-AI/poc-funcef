unit FConsCancelInsc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPadraoParticipante, Db, DBTables, Wwquery, Wwdatsrc, ComCtrls, Buttons,
  StdCtrls, ExtCtrls, Mask, MskEdDlg, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  MAHlpBtn,  URegra, cmseldlg, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, Menus, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsCancelInsc = class(TfrmPadraoParticipante)
    dbgrdResultado: TwwDBGrid;
    ds: TwwDataSource;
    qry: TwwQuery;
    qryAux: TwwQuery;
    pmnu: TPopupMenu;
    pmenCancelIn: TMenuItem;
    Panel5: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    qryPlanAss: TwwQuery;
    dsPlanAss: TwwDataSource;
    dblkpcmbPlanass: TwwDBLookupCombo;
    RegraCancel: TRegra;
    Shape8: TShape;
    Label17: TLabel;
    Shape9: TShape;
    Label18: TLabel;
    Shape10: TShape;
    Label19: TLabel;
    Shape11: TShape;
    Label20: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Label21: TLabel;
    Label22: TLabel;
    Shape14: TShape;
    Label23: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Shape3: TShape;
    Label10: TLabel;
    Shape4: TShape;
    Label11: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Label14: TLabel;
    Label15: TLabel;
    qryRegraCancel: TwwQuery;
    Label7: TLabel;
    ednome: TEdit;
    sldlgProcPart: TcmSelectDlg;
    pmenCancelar: TMenuItem;
    Label6: TLabel;
    Label16: TLabel;
    numinscprev: TEdit;
    datainscprev: TCMDateTimePicker;
    Label26: TLabel;
    Label27: TLabel;
    edmatricula: TEdit;
    edcpf: TEdit;
    Shape1: TShape;
    Label28: TLabel;
    Label29: TLabel;
    cmbfilial: TwwDBLookupCombo;
    qryFilial: TwwQuery;
    Splitter1: TSplitter;
    mnuCancelar: TMenuItem;
    mnuBeneficiario: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    pmemTransferencia: TMenuItem;
    procedure Consulta; override;
    procedure MeuHint(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure dbgrdResultadoCalcCellColors(Sender: TObject; Field: TField;
              State: TGridDrawState; Highlight: Boolean; AFont: TFont;
              ABrush: TBrush);
    procedure pmenCancelInClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmenCancelarClick(Sender: TObject);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuBeneficiarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmnuPopup(Sender: TObject);
  private
    procedure preparaQryRegra(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss,
              sIdPlanoPrev: string; var qryRegra : TwwQuery);
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmConsCancelInsc: TfrmConsCancelInsc;

implementation

uses UMensErro, FCancelaInsc, UAdmAss, FPrincipal;

{$R *.DFM}

var varHint: TNotifyEvent;

procedure TfrmConsCancelInsc.MeuHint(Sender: TObject);
begin
   with frmPrincipal.stbarStatusBar do
   begin
      SimplePanel := true;
      SimpleText  := Application.Hint;
   end;
end;

procedure TfrmConsCancelInsc.Consulta;
var sSQL : string; { variável para montar as condições da cláusulas WHERE }
begin
  { Procurar participante }
  sSQL := 'SELECT PARTASS.IDPESSJUR,PARTASS.SEQPROPOSTA,PARTASS.IDPLANOPREV,'+
                 'PARTASS.IDPESSOA,PARTASS.IDPLANASS,PARTASS.IDSITPART,'+
                 'PARTASS.DATAENTRADA,PARTASS.FLGINSCRICAOCANC,PARTASS.INSCRICAONUMERO,'+
                 'PARTASS.DATACANCELAMENTO,PARTASS.INSCRICAOTIPO,PARTASS.OBSCANCEL,'+
                 'PARTASS.FLGPARTBENEF,PESSOA.NOME,PESSOA.NUMDOCUMENTO CPF,'+
                 'ELEGPATRO.MATRICULA,ELEGPATRO.DATAADMISSAO,PLANASS.IDREGRADESISTENC,'+
                 'PLANASS.NOME NOMEPLANO,PLANASS.IDREGRACANCELAME,P2.NOME NOMEPATRO,'+
                 'PR.NOME NOMEPLANPREV,SITPART.DESCRICAO DESCSITUACAO,SITPART.DESCRICAO,'+
                 'SITPART.FLGINTERNO '+
           ' FROM ELEGPATRO,PARTASS,PESSOA,PLANASS,SITPLANOASS SITPART,'+
                 'PESSOA P2,PLANPREV PR,PARTPREVPLAN PREV,PESSOAFISICA '+
          ' WHERE ';

  { Adicionar Consulta Avancada }
  sSQL := sSQL + sSQLAvanc;

  { Adicionar Consulta específica }

  sSQL := sSQL +'(PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA) AND '+
                '(PARTASS.IDPESSJUR = P2.IDPESSOA) AND '+
                '(P2.IDPESSOA = ELEGPATRO.IDPESSJUR) AND '+
                '(ELEGPATRO.IDPESSJUR = PARTASS.IDPESSJUR) AND '+
                '(ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA) AND '+
                '(PLANASS.IDPLANASS = PARTASS.IDPLANASS) AND '+
                '(SITPART.IDSITPLANOASS = PARTASS.IDSITPART) AND '+
                '(PARTASS.IDPLANOPREV = PR.IDPLANOPREV) AND '+
                '(PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA) AND '+
                '(PARTASS.IDPESSOA = PREV.IDPESSOA) AND '+
                '(PARTASS.IDPLANOPREV = PREV.IDPLANOPREV) AND '+
                '(PARTASS.IDPESSJUR = PREV.IDPESSJUR) AND ';

  if edmatricula.text <> '' then
  begin
     sSQL := sSql + ' (ELEGPATRO.MATRICULA = '''+edmatricula.text+''') AND ';
  end;

  if cmbfilial.text <> '' then
  begin
     sSQL := sSql + ' (ELEGPATRO.IDESTAB = '''+qryfilial.fieldbyname('idpessoa').AsString+''') AND ';
  end;

  if edcpf.text <> '' then
  begin
     sSQL := sSql + ' (PESSOA.NUMDOCUMENTO = '''+edcpf.text+''') AND ';
  end;

  if Trim(dblkpcmbPlano.Text) <> '' then
    sSQL := sSQL + '(PARTASS.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+') AND ';

  if ednome.text <> '' then
  begin
     sSQL := sSQL +' (UPPER(PESSOA.NOME) LIKE ''%'+UpperCase(trim(ednome.text))+'%'') AND ';
  end;

  if Trim(dblkpcmbPlanass.Text) <> '' then
    sSQL := sSQL + '(PARTASS.IDPLANASS = '+qryPlanass.FieldByName('IDPLANASS').AsString+') AND ';

  if Trim(dblkpcmbPatro.Text) <> '' then
    sSQL := sSQL + '(PARTASS.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString+') AND ';

  if Trim(edNumInsc.Text) <> '' then
    sSQL := sSQL + '(PARTASS.INSCRICAONUMERO = '''+Trim(edNumInsc.Text)+''') AND ';

  if (Trim(mskdlgDataInsc.Text) <> '') and (Trim(mskdlgDataInsc.Text) <> '/  /') then
    sSQL := sSQL + '(PARTASS.DATAENTRADA = TO_DATE('''+Trim(mskdlgDataInsc.Text)+''',''DD/MM/YYYY'')'+') AND ';

  if Trim(NumInscprev.Text) <> '' then
    sSQL := sSQL + '(PREV.INSCRICAONUMERO = '''+Trim(NumInscPrev.Text)+''') AND ';

  if (Trim(datainscprev.Text) <> '') and (Trim(datainscprev.Text) <> '/  /') then
    sSQL := sSQL + '(PREV.INSCRICAODATA = TO_DATE('''+Trim(datainscprev.Text)+''',''DD/MM/YYYY'')'+') AND ';

  if  dblkpcmbSituacao.Text <> '' then
  begin
       sSQL := sSQL + ' (SITPART.IDSITPART = '+qrysitpart.fieldbyname('idsitpart').AsString+') AND ';
  end;

  case rgrpStatusInsc.itemindex of
    0: sSQL := sSQL + '(SITPART.FLGINTERNO = ''NO'') AND ';
    1: sSQL := sSQL + '(SITPART.FLGINTERNO = ''CA'') AND ';
    2: sSQL := sSQL + '(SITPART.FLGINTERNO = ''CI'') AND ';
    3: sSQL := sSQL + '(SITPART.FLGINTERNO = ''IN'') AND ';
    4: sSQL := sSQL + '(SITPART.FLGINTERNO = ''TR'') AND ';
  end;

  if sSQL <> '' then
    sSQL := Copy(sSQL, 1, Length(sSQL)-5);

  sSQL := sSQL + ' ORDER BY PESSOA.NOME';
  qry.SQL.Clear;
  qry.SQL.Add(sSQL);  

  // Executar query com condicoes especificadas pelo usuario
  try
     qry.Open;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;
end;

procedure TfrmConsCancelInsc.FormShow(Sender: TObject);
begin
  inherited;
  qry.Close;
end;

procedure TfrmConsCancelInsc.dbgrdResultadoCalcCellColors(Sender: TObject;
          Field: TField; State: TGridDrawState; Highlight: boolean; AFont: TFont;
          ABrush: TBrush);
begin
  if rgrpStatusInsc.itemindex = 5 then
  begin
    inherited;
    if (qry.FieldByName('FLGINTERNO').AsString = 'NO') then
    begin //Normal
      ABrush.Color := clWhite;
    end
    else
      if (qry.FieldByName('FLGINTERNO').AsString = 'CA') then
      begin //Cancelado
        ABrush.Color := clRed;
      end
      else
        if (qry.FieldByName('FLGINTERNO').AsString = 'CI') then
        begin //Cancelado por Inadimp.
          ABrush.Color := clAqua;
        end
        else
          if (qry.FieldByName('FLGINTERNO').AsString = 'IN') then
          begin //Inadimplente
            ABrush.Color := clSilver;
          end
          else
            if (qry.FieldByName('FLGINTERNO').AsString = 'TR') then
            begin //Transferido
              ABrush.Color := clYellow;
            end;
    if Highlight then
    begin
      AFont.Style := [fsBold];
      AFont.Color  := clBlack;
    end;
  end;
end;

procedure TfrmConsCancelInsc.pmenCancelInClick(Sender: TObject);
begin
  inherited;
  if qry.isempty then
    exit;

  if qry.fieldByName('FLGINSCRICAOCANC').asInteger = 1 then
  begin
    MsgDlg('A inscrição do participante no plano já está cancelada !',
           'Erro', mtError, [mbOk,mbHelp], 0);
    exit;
  end;
  //-- REGRA
  if not (qry.fieldbyname('IDREGRACANCELAME').AsString = '') then
  begin
     regraCancel.rulename := qry.fieldbyname('IDREGRACANCELAME').AsString;
     //qryregraCancel.open;
     preparaqryregra(qry.fieldbyname('IDPESSJUR').AsString,
                     qry.fieldbyname('IDPESSOA').AsString,
                     qry.fieldbyname('IDPESSOA').AsString,
                     qry.fieldbyname('IDPLANASS').AsString,
                     qry.fieldbyname('IDPLANOPREV').AsString,
                     qryRegraCancel);
     regraCancel.QueryIn := qryRegraCancel;
     //regraCancel.execute;
     regraCancel.passoapasso;
     if (regraCancel.result = 'False') or (regraCancel.result = '') then
     begin
       MsgDlg('A pessoa em questão não pode ser cancelada por Inadimplência, em vista da Regra de Cancelamento por Inadimplência do plano !','Erro',mtError,[mbOk,mbHelp],0);
       qryregraCancel.close;
       exit;
     end;
     qryregraCancel.close;
  end;

  { Chamar formulário de cancelamento de inscricao }
  frmCancelaInsc := TfrmCancelaInsc.Create(Self);
  frmCancelaInsc.CancelaPorInadimplencia(qry);
  //  frmCancelaInsc.Free;
  qry.Close;
  qry.Open;
  dbGrdResultado.Repaint;
end;

procedure TfrmConsCancelInsc.bbtnSairClick(Sender: TObject);
begin
  //  inherited;
  close;
end;

procedure TfrmConsCancelInsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //  inherited;
  Application.OnHint := varHint;
  action := cafree;
end;

procedure TfrmConsCancelInsc.pmenCancelarClick(Sender: TObject);
begin
  inherited;
  if qry.isempty then
    exit;

  if qry.fieldByName('FLGINSCRICAOCANC').asInteger = 1 then
  begin
    MsgDlg('A inscrição do participante no plano já está cancelada !',
           'Erro', mtError, [mbOk,mbHelp], 0);
    exit;
  end;
  //REGRA
  if not (qry.fieldbyname('IDREGRADESISTENC').AsString = '') then
  begin
     regraCancel.rulename := qry.fieldbyname('IDREGRADESISTENC').AsString;
     //qryregraCancel.open;
     preparaQryRegra(qry.fieldbyname('IDPESSJUR').AsString,
                     qry.fieldbyname('IDPESSOA').AsString,
                     qry.fieldbyname('IDPESSOA').AsString,
                     qry.fieldbyname('IDPLANASS').AsString,
                     qry.fieldbyname('IDPLANOPREV').AsString,
                     qryregracancel);
     regraCancel.QueryIn := qryRegraCancel;
     regraCancel.execute;
     if (regraCancel.result = 'False') or (regraCancel.result = '') then
     begin
       MsgDlg('A pessoa em questão não pode ser cancelada por Desistência, em vista da Regra de Cancelamento por Desistência do plano !',
              'Erro',mtError,[mbOk,mbHelp],0);
       qryregraCancel.close;
       exit;
     end;
     qryregraCancel.close;
  end;

  //Chamar formulário de cancelamento de inscrição
  frmCancelaInsc := TfrmCancelaInsc.Create(Self);
  frmCancelaInsc.Cancelar(qry);
  qry.Close;
  qry.Open;
  dbGrdResultado.Repaint;
end;

procedure TfrmConsCancelInsc.bbtnConsultarClick(Sender: TObject);
begin
  inherited;
  if rgrpStatusInsc.itemindex <> 5 then
    panel5.visible := false
  else
    panel5.visible := true;
end;

procedure TfrmConsCancelInsc.FormActivate(Sender: TObject);
begin
  inherited;
  qryplanass.open;
  qryfilial.open;
end;

procedure TfrmConsCancelInsc.PreparaQryRegra(sIdPessJur, sIdTitular, sIdDependente,
          sIdPlanAss, sIdPlanoPrev : string; var qryRegra : TwwQuery);
var datault : string;
    NumContribAtraso : integer;
begin
   DataUlt := DataUltEvento(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss, sIdPlanoPrev);
   NumContribAtraso := MensAtraso(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss,
                       sIdPlanoPrev);
   qryRegra.Close;
   qryRegra.sql.clear;
   qryRegra.sql.add
     ('SELECT H.CODDOCEFET,H.CODDOCPREV,H.CODPORTFORMA,H.CODREFERENCIA,'+
             'H.DATA,H.DATAPREVISAO,H.FLGCOBCARNE,H.IDCONTASS,H.IDDEPENDENTE,'+
             'H.IDMOTIVO,H.IDPAGADOR,H.IDPESSJUR,H.IDPLANASS,H.IDPLANOPREV,'+
             'H.IDREGRA,H.IDTITULAR,H.MES,H.MESCOBRANCA,H.NUMRECEBIMENTO,'+
             'H.PLNCODEFET,H.PLNCODPREV,H.SEQPROPOSTA,H.SITRECEBIMENTO,'+
             'H.VALORESPERADO,H.VALORRECEBIDO,'+
             'EL.CODCENTROCUSTO,EL.DATAADMISSAO,EL.DATADEMISSAO,EL.DATAFIMAFAST,'+
             'EL.DATAINICIOAFAST,EL.IDCARGOEXT,EL.IDCARGOEXT,EL.IDEMPRESAPROP,'+
             'EL.IDESTAB,EL.IDPESSJUR,EL.IDPESSOA,EL.IDSITFUNC,EL.MATRICULA,'+
             'EL.NIVEL,EL.PARTICIPASSIST,EL.PARTICIPPREVID,EL.SALTOTAL,'+
             'EL.TEMPONAOCREDITADO,EL.TEMPOSERVANTERIOR,EL.TEMPOSERVANTREAL,'+
             'EL.TEMPOSERVTOTAL,EL.TEMPOSITESPECIAL,EL.VALORBASE1,EL.VALORBASE2,'+
             'EL.VALORBASE3,'+
             'PT.DATACANCELAMENTO,PT.DATAENTRADA,PT.FLGINSCRICAOCANC,PT.FLGPARTBENEF,'+
             'PT.IDPESSJUR,PT.IDPESSOA,PT.IDPLANASS,PT.IDPLANOPREV,PT.IDSITPART,'+
             'PT.INSCRICAONUMERO,PT.INSCRICAOTIPO,PT.OBSCANCEL,PT.SEQPROPOSTA,'+
             'PL.CODPORTFORMA,PL.CODTIPODOCHISTPAG,PL.CODTIPODOCHISTREC,'+
             'PL.CODTIPORECHISTREC,PL.CODTIPRECHISTPAG,PL.DATAINICIOCOM,'+
             'PL.DATAINICIOVIGENC,PL.FLGFECHADO,PL.IDFORNSERV,PL.IDPESSOA,'+
             'PL.IDPLANASS,PL.IDPRODASS,PL.IDREGRAADMINISTR,PL.IDREGRAADMISSAO,'+
             'PL.IDREGRAATRASOCOR,PL.IDREGRAATRASOJUR,PL.IDREGRABENEFICIA,'+
             'PL.IDREGRACANCELAME,PL.IDREGRACOBRANCA,PL.IDREGRACOMISSAO,'+
             'PL.IDREGRADESISTENC,PL.IDREGRADEVOLCORR,PL.IDREGRADEVOLJUROS,'+
             'PL.IDREGRAGERAL,PL.IDREGRAPAGAMENTO,PL.NOME,PL.NUMCONTRATO,'+
             'PL.RECPAGHISTPAG,PL.RECPAGHISTREC,'+
             'PF.CODESTADO,PF.DATAMORTE,PF.DATANASC,PF.ESTCIVIL,PF.FLGISENTOIRRF,'+
             'PF.IDFONTRECR,PF.IDGRINSTR,PF.IDPAIS,PF.IDPESSOA,PF.IDPROFISS,'+
             'PF.IDSINDICATO,PF.NOMEMAE,PF.NOMEPAI,PF.NUMDEPIRRF,PF.NUMDEPSALF,'+
             'PF.NUMDEPTOT,PF.SEXO,PF.TIPOSANG,'+
             'PE.EMAIL,PE.FLGINVALIDO,PE.IDDOCUMENTO,PE.IDGRUPO,PE.IDIMAGEM,'+
             'PE.IDPESSOA,PE.NOME,PE.NUMDOCUMENTO,PE.RAZAOSOCIAL,PE.SEQTRANSMISSAO,PE.TIPO,'+
             ''''+DataUlt+''' DTULTEVENTO,'+inttostr(NumContribAtraso)+' CONTATRASO'+
       ' FROM HSTCONTRIBASS H,ELEGPATRO EL,PARTASS PT,PLANASS PL,PESSOAFISICA PF,PESSOA PE'+
      ' WHERE (H.IDPLANASS = '+sIdPlanAss+')'+
        ' AND (H.IDPESSJUR = '+sIdPessJur+')'+
        ' AND (H.IDPLANOPREV = '+sIdPlanoPrev+')'+
        ' AND (H.IDTITULAR = '+sIdTitular+')'+
        ' AND (H.IDDEPENDENTE = '+sIdDependente+')'+
        ' AND (H.IDTITULAR = EL.IDPESSOA)'+
        ' AND (H.IDPESSJUR = EL.IDPESSJUR)'+
        ' AND (H.SEQPROPOSTA = PT.SEQPROPOSTA)'+
        ' AND (H.IDPESSJUR   = PT.IDPESSJUR)'+
        ' AND (H.IDPLANOPREV = PT.IDPLANOPREV)'+
        ' AND (H.IDPLANASS   = PT.IDPLANASS)'+
        ' AND (H.IDTITULAR   = PT.IDPESSOA)'+
        ' AND (H.IDPLANASS = PL.IDPLANASS)'+
        ' AND (H.IDTITULAR = PE.IDPESSOA)'+
        ' AND (H.IDDEPENDENTE = PF.IDPESSOA)');
   qryregra.open;
end;

procedure TfrmConsCancelInsc.mnuBeneficiarioClick(Sender: TObject);
begin
  qryAux.close;
  qryAux.SQL.Clear;

  qryAux.SQL.Add
    ('SELECT COUNT(*) TOT FROM BENEFASS'+
     ' WHERE (IDPESSJUR = '+qry.fieldbyname('IDPESSJUR').AsString+') AND'+
           ' (IDTITULAR <> '+qry.fieldbyname('IDPESSOA').AsString+') AND'+
           ' (IDPLANOPREV = '+qry.fieldbyname('IDPLANOPREV').AsString+') AND '+
           ' (IDPLANASS = '+qry.fieldbyname('IDPLANASS').AsString+')');
  qryAux.open;
  if qryAux.fieldByName('TOT').asInteger = 0 then
  begin
    MsgDlg('Participante não possui dependente inscrito como beneficiário do plano.'+
           ' Use a opção de cancelamento por desistência.',
           'Erro',mtError,[mbOk,mbHelp],0);
    exit;
  end;

  //REGRA
  if not (qry.fieldbyname('IDREGRADESISTENC').AsString = '') then
  begin
     regraCancel.rulename := qry.fieldbyname('IDREGRADESISTENC').AsString;
     //qryregraCancel.open;
     preparaQryRegra(qry.fieldbyname('IDPESSJUR').AsString,
                     qry.fieldbyname('IDPESSOA').AsString,
                     qry.fieldbyname('IDPESSOA').AsString,
                     qry.fieldbyname('IDPLANASS').AsString,
                     qry.fieldbyname('IDPLANOPREV').AsString,
                     qryregracancel);
     regraCancel.QueryIn := qryRegraCancel;
     regraCancel.execute;
     if (regraCancel.result = 'False') or (regraCancel.result = '') then
     begin
       MsgDlg('A pessoa em questão não pode ser cancelada, em vista da Regra de Cancelamento por Desistência do plano !',
              'Erro',mtError,[mbOk,mbHelp],0);
       qryregraCancel.close;
       exit;
     end;
     qryregraCancel.close;
  end;

  //Chamar formulário de cancelamento de inscrição
  frmCancelaInsc := TfrmCancelaInsc.Create(Self);
  frmCancelaInsc.CancelarBenef(qry);
  qry.Close;
  qry.Open;
  dbGrdResultado.Repaint;
end;

procedure TfrmConsCancelInsc.FormCreate(Sender: TObject);
begin
  inherited;
  varHint := Application.OnHint;
  Application.OnHint := MeuHint;
end;

procedure TfrmConsCancelInsc.pmnuPopup(Sender: TObject);
var sFlag: string;
begin
  if (qry.isEmpty) then
  begin
    mnuCancelar.enabled := false;
    exit;
  end;

  mnuCancelar.enabled := true;
  pmenCancelar.enabled      := false;
  pmenCancelIn.enabled      := false;
  mnuBeneficiario.enabled   := false;
  pmemTransferencia.enabled := false;

  sflag := qry.fieldbyname('FLGINTERNO').AsString;
  pmenCancelar.enabled      := (sFlag = 'NO');
  pmenCancelIn.enabled      := (sFlag = 'IN');
  mnuBeneficiario.enabled   := (sFlag = 'NO') and
                               (qry.fieldbyname('FLGPARTBENEF').AsInteger = 1);
  pmemTransferencia.enabled := (sFlag = 'NO');
end;

end.



