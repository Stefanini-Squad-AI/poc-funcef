unit FPRel2ViaCCheque;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics   , Controls, Forms   ,
  MAHlpBtn  , StdCtrls, Buttons , cmRepBtn, ExtCtrls   , Db      , Dialogs ,
  DBTables   , Wwquery , checklst, Spin    , wwdblook   , TB97    , ComCtrls,
  MontaSelect, IvDictio, IvMulti , IvEMulti, FOkCancelar, Wwdatsrc, TB97Tlbr,
  dRel2ViaCCheque, fAguarde;

type
  TfrmPRel2ViaCCheque = class(TfrmOkCancelar)
    MontaSelectBenef: TMontaSelect;
    Panel1          : TPanel;
    Label7          : TLabel;
    Label3          : TLabel;
    Label8          : TLabel;
    edMatricula     : TEdit;
    edTitular       : TEdit;
    edNumInscr      : TEdit;
    bbtnProcurar    : TBitBtn;
    qryHistorico    : TwwQuery;
    cmbHistorico: TwwDBLookupCombo;
    lblhistorico: TLabel;
    cmbRecebedor: TwwDBLookupCombo;
    Label1: TLabel;
    qryRecebedor: TwwQuery;
    qryAux: TwwQuery;
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure cmbRecebedorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    sIdTitular  : String;
    iIdRecebedor   : Integer;
  public
    { Public declarations }
    sStrPatro,
    sStrPlano,
    sMesReferencia,
    sAnoReferencia,
    sMesPagamento : string;
    bFaz: boolean;
    bFlgAgrupaFolhaBen: boolean;
    Procedure EmiteContraCheque;
  end;

var
  frmPRel2ViaCCheque: TfrmPRel2ViaCCheque;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmPRel2ViaCCheque.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPRel2ViaCCheque.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  bFaz := True;
  if cmbHistorico.Text = '' then
  begin
    ShowMessage('Selecione um Histórico.');
    bFaz := False;
  end;
  if cmbRecebedor.Text = '' then
  begin
    ShowMessage('Selecione um Recebedor.');
    bFaz := False;
  end;
  if edTitular.Text = '' then
  begin
    ShowMessage('Selecione um Participante.');
    bFaz := False;
  end;

  If bFaz Then
     EmiteContraCheque
  Else ModalResult := mrNone;
end;

procedure TfrmPRel2ViaCCheque.FormCreate(Sender: TObject);
begin
  inherited;
  edTitular.Text       := '';
  edMatricula.Text     := '';
  edNumInscr.Text      := '';
  qryhistorico.Open;
  try
    qryAux.open;
    bFlgAgrupaFolhaBen:=qryAux.fields[0].asinteger=0;
  except
    bFlgAgrupaFolhaBen:=true;
  end;
end;

procedure TfrmPRel2ViaCCheque.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectBenef.Executar;
  if (MontaSelectBenef.ValoresChave.Count > 0) and
     (MontaSelectBenef.ValoresChave[0] <> '') then
  begin
     edNumInscr.Text      := MontaSelectBenef.ValoresChave[0];
     edMatricula.Text     := MontaSelectBenef.ValoresChave[1];
     edTitular.Text       := MontaSelectBenef.ValoresChave[2];
     sIdTitular           := MontaSelectBenef.ValoresChave[3];
     // ABRE COMBO RECEBEDOR.
     qryRecebedor.close;
     qryRecebedor.Prepare;
     qryRecebedor.Params[0].AsInteger := StrToInt(MontaSelectBenef.ValoresChave[3]);
     qryRecebedor.Open;
     // CGUEDES - 15/08/2201: SE FOR NOVO PLANO PODE NÃO ESTAR EM BFCIARIOTITPLAN
     // COLOCAR O NOME DO PRÓPRIO
     cmbRecebedor.OnCloseUp(self,qryRecebedor,qryRecebedor,False);
     if not qryRecebedor.IsEmpty then
       cmbRecebedor.Text := qryRecebedor.FieldByName('NOME').AsString
     else cmbRecebedor.Text := MontaSelectBenef.ValoresChave[2];
  end;
end;

Procedure TfrmPRel2ViaCCheque.EmiteContraCheque;
 var ssql: String;
begin
  with dtmRel2ViaCCheque.qrydemonstpag do
  begin
    Close;
    ssql:='SELECT DISTINCT HST.IDRESPONSAVEL, HST.IDPESSJUR, HST.MESCOBRANCA, '+
          'PVD.IDPROVENTO, BEN.NOME, '+
          'NVL(PVD.CODPROVDESC,PVD.IDPROVENTO) CODIGO, '+
          'NVL(PVD.DESCRPROVDESC,PVD.DESCRICAO) DESCRICAO, '+
          'ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, HST.VALORINFO, '+
          'PVD.FLGDESCONTO, '+
          'PFI.NUMDEPIRRF, AG.NUMAGENCIA, CB.CONTACORRENTE, PVD.FLGESPECIAL, ';

    if bFlgAgrupaFolhaBen then
      ssql:=ssql+'BC.NOME AS BANCO, '+
                 'SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+
                 'HST.VALORPROVENTO, '+
                 'DECODE(PVD.FLGDESCONTO,2,HST.VALORINFO||'' (I)'',0,NULL,1, '+
                   ' DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO,0, '+
                   ' DECODE(HST.VALORINFO,0,NULL,HST.VALORINFO||'' (I)''), '+
                   ' HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')) INFORMATIVO, '
    else
      ssql:=ssql+'HST.MESCOBRANCA, '+
                 'SUM(HST.VALORPROVENTO) VALORPROVENTO, '+
                 'DECODE(PVD.FLGDESCONTO,2,SUM(HST.VALORINFO)||'' (I)'',0,NULL,1, '+
                   ' DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),0, '+
                   ' DECODE(SUM(HST.VALORINFO),0,NULL,SUM(HST.VALORINFO)||'' (I)''), '+
                   ' SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')) INFORMATIVO, ';

    ssql:=ssql+'EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, EP.CEP, '+
               'EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, '+
               'CID.NOME AS CIDADE, EP.TIPOENDERECO, EP.NOME, '+
               'AGN.NOME AS AGENCIA, '+
               'DECODE(PVD.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'',''INFORMATIVA'') AS PD, '+
               'DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0) AS VLPROVENTO, '+
               'DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0) AS VLDESCONTO '+
               'FROM HISTRUBSAL HST, ELEGPATRO ELP, PARTPREVPLAN PPP, '+
               ' PESSOA BEN, PESSOAFISICA PFI, PROVDESC PVD, ENDPESS EP, '+
               ' CONTABANCARIA CB, PESSOA BC, PESSOA AGN , '+
               ' BANCO BCO, AGENCIABANCARIA AG, CIDADES CID, ESTADO EST '+
               ' WHERE HST.IDHSTFOLHABENEF = '+QryHistorico.FieldByName('IDHSTFOLHABENEF').AsString+
               ' AND HST.IDTITULAR = ' + sIdTitular+
               ' AND HST.IDRESPONSAVEL = ' + IntToStr(iIdRecebedor)+
               ' AND PVD.IDPROVENTO = HST.IDRUBRICA '+
               ' AND ELP.IDPESSOA = HST.IDTITULAR '+
               ' AND ELP.IDPESSJUR = HST.IDPATRO '+
               ' AND PPP.IDPESSJUR = HST.IDPATRO '+
               ' AND PPP.IDPLANOPREV = HST.IDPLANOPREV '+
               ' AND PPP.IDPESSOA = HST.IDTITULAR '+
               ' AND PFI.IDPESSOA = HST.IDRESPONSAVEL '+
               ' AND EP.IDPESSOA(+) = HST.IDPESSOA '+
               ' AND EP.IDCIDADES = CID.IDCIDADES(+) '+
               ' AND EST.IDESTADO(+) = CID.IDESTADO '+
               ' AND BEN.IDPESSOA = HST.IDRESPONSAVEL '+
               //P.RAMOS - 25.09.2001 - conta preferencial
               ' AND RTRIM(HST.NUMBANCO) = BCO.NUMBANCO '+
               ' AND HST.NUMAGENCIA = AG.NUMAGENCIA '+
               ' AND CB.IDPESSOA = HST.IDRESPONSAVEL '+
               ' AND AG.IDPESSOA = CB.IDAGENCIA '+
               ' AND BC.IDPESSOA = AG.IDBANCO '+
               ' AND AGN.IDPESSOA = AG.IDPESSOA '+
               ' AND BC.IDPESSOA = BCO.IDPESSOA ';
    if bFlgAgrupaFolhaBen then
      ssql:=ssql+'ORDER BY BEN.NOME, PVD.FLGDESCONTO, PVD.IDPROVENTO'
    else
      ssql:=ssql+'GROUP BY HST.MESCOBRANCA, HST.IDRUBRICA, HST.IDRUBRICA,'+
                         ' PVD.DESCRICAO, PVD.FLGESPECIAL ';
    sql.clear;
    sql.add(ssql);
    Open;
    if IsEmpty then
    begin
      MsgDlg('Não existem pessoas para Emissão de Contra Cheque com as opções selecionadas','Erro',mtError,[mbOk,mbHelp],0);
      frmAguarde.Close;
      ModalResult := mrNone;
      Exit;
    end;
  End;
end;//FIM DA FUNÇÃO

procedure TfrmPRel2ViaCCheque.cmbRecebedorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qryRecebedor.IsEmpty then
    iIdRecebedor := qryRecebedor.FieldByName('IDRECEBEDOR').AsInteger
  else iIdRecebedor := StrToInt(sIdTitular);
end;

end.


