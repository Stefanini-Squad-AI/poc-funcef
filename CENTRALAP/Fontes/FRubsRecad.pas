(*******************************************************************************
 Analista Responsável: André C. Tavares     20/03/2002
 Gera Rubs para Recadastramento  - Solicitação da Fundação FCRT
*******************************************************************************)


unit FRubsRecad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, uRUBS, uDatabase,
  Wwdatsrc, Mask, wwdbedit, ComCtrls;

type
  TfrmRubsRecad = class(TfrmOkCancelar)
    qryBENEFBFCIARIO: TwwQuery;
    DTPaPartir: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    qryConfigRubTitular: TwwQuery;
    QryRubxBenef: TwwQuery;
    QryDocAssoc: TwwQuery;
    QryDocAssocIDDOCUMENTO: TFloatField;
    QryDocAssocNOMEDOCUMENTO: TStringField;
    UpdQryRubxBenef: TUpdateSQL;
    QryRubxBenefIDRUBXBENEFICIO: TFloatField;
    QryRubxBenefIDPESSJUR: TFloatField;
    QryRubxBenefIDPESSOA: TFloatField;
    QryRubxBenefIDPLANOPREV: TFloatField;
    QryRubxBenefIDBENEFICIO: TFloatField;
    QryRubxBenefIDRUBS: TFloatField;
    QryRubxBenefIDSITBENEF: TFloatField;
    UpdRubs: TUpdateSQL;
    qryRubs: TwwQuery;
    qryRubsIDRUBS: TFloatField;
    qryRubsFLGSTATUS: TStringField;
    qryRubsIDASSUNTOXATEND: TFloatField;
    qryRubsIDHISTLANCTO: TFloatField;
    qryRubsIDHISTBAIXA: TFloatField;
    qryRubsIDCANCELAMENTO: TFloatField;
    qryHistRubs: TwwQuery;
    qryHistRubsIDHISTMOVRUBS: TFloatField;
    qryHistRubsIDRUBS: TFloatField;
    qryHistRubsFLGSTATUS: TStringField;
    qryHistRubsHISTORICO: TMemoField;
    qryHistRubsDATAMOV: TDateTimeField;
    UpdHistRubs: TUpdateSQL;
    UpdqryTipoDocXrub: TUpdateSQL;
    qryTipodocXrub: TwwQuery;
    qryTipodocXrubIDRUBXBENEFICIO: TFloatField;
    qryTipodocXrubIDTIPODOCXRUB: TFloatField;
    qryTipodocXrubIDDOCUMENTO: TFloatField;
    qryTipodocXrubDATARECEB: TDateTimeField;
    qryTipodocXrubFLGRECEBIDO: TStringField;
    Label3: TLabel;
    qryBenefServicoTitular: TwwQuery;
    DBLkBenefServicoTitular: TwwDBLookupCombo;
    Label4: TLabel;
    DBLkBenefServicoDepend: TwwDBLookupCombo;
    Label5: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    qryRubsIDCONFIGRUBS: TFloatField;
    qryBenefServicoDepend: TwwQuery;
    qryConfigRubDepend: TwwQuery;
    qryConfigRubTitularIDCONFIGRUBS: TFloatField;
    qryConfigRubTitularDESCRUB: TStringField;
    qryConfigRubDependIDCONFIGRUBS: TFloatField;
    qryConfigRubDependDESCRUB: TStringField;
    qryBenefServicoTitularIDSERVICOS: TFloatField;
    qryBenefServicoTitularNOME: TStringField;
    qryBenefServicoTitularIDREGRA: TFloatField;
    qryBenefServicoDependIDSERVICOS: TFloatField;
    qryBenefServicoDependNOME: TStringField;
    qryBenefServicoDependIDREGRA: TFloatField;
    DBLKConfigRubTitular: TwwDBLookupCombo;
    DBLKConfigRubDepend: TwwDBLookupCombo;
    QryRubxBenefIDTITULAR: TFloatField;
    ProgressBar1: TProgressBar;
    qryRubsDATAGERACAO: TDateTimeField;
    qryCheckRubs: TwwQuery;
    qryCheckRubsIDPESSOA: TFloatField;
    qryCheckRubsIDRUBS: TFloatField;
    qryCheckRubsDATAGERACAO: TDateTimeField;
    qryBENEFBFCIARIOIDPESSOA: TFloatField;
    qryBENEFBFCIARIOIDTITULAR: TFloatField;
    qryBENEFBFCIARIOIDPESSJUR: TFloatField;
    qryBENEFBFCIARIOIDPLANOPREV: TFloatField;
    qryBENEFBFCIARIODATAEMISSAORECAD: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PegaBeneficio;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBLkBenefServicoTitularChange(Sender: TObject);
    function encontraRubRecadGerada : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    abortaOperacao : boolean;
  end;

var
  frmRubsRecad: TfrmRubsRecad;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmRubsRecad.FormCreate(Sender: TObject);
begin
  inherited;
  abortaOperacao := false;
  bbtnConfirmar.enabled := false;
  qryBenefServicoTitular.open;
  qryCheckRubs.open;
  qryBenefServicoDepend.open;
  qryConfigRubTitular.Open;
  qryConfigRubDepend.Open;
end;

procedure TfrmRubsRecad.bbtnConfirmarClick(Sender: TObject);
begin
  abortaOperacao := false;
  if NOT (((DBLkBenefServicoTitular.text <> '') and (DBLKConfigRubTitular.text <> '')) OR
     ((DBLkBenefServicoDepend.text <> '') and (DBLKConfigRubDepend.text <> ''))) then
  begin
    Application.MessageBox('Deve ser selecionado o serviço de RECADASTRAMENTO e o seu modelo de RUBS para TITULAR e/ou DEPENDENTE',
                           'Erro',Mb_IconInformation);
    if DBLkBenefServicoTitular.CanFocus Then DBLkBenefServicoTitular.setFocus;
    abort;
  end;

  if dtpApartir.text = '' then
  begin
    Application.MessageBox('Data em branco!','Erro',Mb_IconInformation);
    if dtpApartir.CanFocus Then dtpApartir.setFocus;
    abort;
  end;
  PegaBeneficio;
end;

// verifica se já existe uma RUBS de recadastramento gerada no ano;
function TfrmRubsRecad.encontraRubRecadGerada : boolean;
var anoGera, mesGera, diaGera, anoCorr, mesCorr, diaCorr : word;
    achou : boolean;
begin
  achou := false;
  qryCheckRubs.close;
  qryCheckRubs.open;
  qryCheckRubs.First;
  while (not qryCheckRubs.eof) and (not achou) do
  begin
    decodeDate(qryCheckRubsDATAGERACAO.asDateTime, anoGera, mesGera, diaGera);
    decodeDate(qryBenefBfciarioDATAEMISSAORECAD.asDateTime, anoCorr, mesCorr, diaCorr);
    achou := (qryCheckRubsIDPESSOA.asInteger = qryBenefBfCiarioIDPESSOA.asInteger) and (anoGera = anoCorr);
    qryCheckRubs.next;
  end;
  encontraRubRecadGerada := achou;
end;


procedure TfrmRubsRecad.PegaBeneficio;
begin
  bbtnConfirmar.enabled := false;
  bbtnSair.enabled := false;
// pega os dados necessários
  qryBenefBfCiario.close;
  qryBenefBfCiario.sql.clear;

  qryBenefBfCiario.sql.text := ' SELECT '+
                               '   DISTINCT '+
                               '   B.IDPESSOA, '+
                               '   B.IDTITULAR, '+
                               '   B.IDPESSJUR, '+
                               '   B.IDPLANOPREV, '+
                               '   B.DATAEMISSAORECAD  '+
                               ' FROM BENEFBFCIARIO B, BENEFICIO BN, SITBENEFICIO S, BENEFPLANPREV BNP '+
                               ' WHERE B.NUMCARTARECAD IS NOT NULL AND '+
                               '       B.DATARECEBRECAD IS NULL AND '+
                               '       B.IDSITBENEFICIO <> 3 AND '+
                               '       B.IDBENEFICIO = BN.IDBENEFICIO AND '+
                               '       B.IDSITBENEFICIO = S.IDSITBENEFICIO AND '+
                               '       B.IDBENEFICIO = BNP.IDBENEFICIO AND '+
                               ' B.DATAEMISSAORECAD >= TO_DATE('''+ DtpApartir.text+ ''', ''DD/MM/YYYY'')';

  qryBenefBfCiario.open;
  QryRubxBenef.open;
  qryRubs.open;
  qryHistRubs.open;
  QryRubxBenef.open;
  qryTipodocXrub.open;

  qryBenefBfCiario.First;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := qryBenefBfCiario.RecordCount;
  while not qryBenefBfCiario.Eof do
  begin
    if abortaOperacao then
    begin
      qryRubxBenef.CancelUpdates;
      qryRubs.CancelUpdates;
      qryHistRubs.CancelUpdates;
      qryRubxBenef.CancelUpdates;
      qryTipodocXrub.CancelUpdates;
      abort;
    end;
    // se um dos campos da RUB do titular estiver em branco a rub nâo é gerada
    while (not qryBenefBfCiario.Eof) and
       (((qryBenefBfCiarioIDTITULAR.asInteger = qryBenefBfCiarioIDPESSOA.asInteger) and
       (DBLkBenefServicoTitular.text = '') and (DBLKConfigRubTitular.text = ''))
       OR
    //ou se um dos campos da RUB do dependente estiver em branco a rub nâo é gerada
       ((qryBenefBfCiarioIDTITULAR.asInteger <> qryBenefBfCiarioIDPESSOA.asInteger) and
       (DBLkBenefServicoDepend.text = '') and (DBLKConfigRubDepend.text = '')))
       OR
      //ou se já existe rub de recadastramento para esta pessoa
         encontraRubRecadGerada
       do
       // dá skip
       begin
         qryBenefBfCiario.Next;
         application.ProcessMessages;
         ProgressBar1.Position := ProgressBar1.Position + 1;
         if qryBenefBfCiario.Eof then
         begin
            bbtnConfirmar.enabled := true;
            bbtnSair.enabled := true;
            abort;
         end;
       end;


      // insere na tabela RUBS
      qryRubs.insert;
      qryRubsIDRUBS.AsFloat := LeultRegistro(nil,'RUBS');
      qryRubsFLGSTATUS.AsString := '1';
      qryRubsIDASSUNTOXATEND.clear;
      qryRubsIDHISTLANCTO.Clear;
      qryRubsIDHISTBAIXA.Clear;
      qryRubsIDCANCELAMENTO.Clear;
      qryRubsDATAGERACAO.asDateTime := qryBenefBfciarioDATAEMISSAORECAD.asDateTime;

      if qryBenefBfCiarioIDTITULAR.asInteger = qryBenefBfCiarioIDPESSOA.asInteger then  // se é titular
        qryRubsIDCONFIGRUBS.asInteger := qryConfigRubTitularIDCONFIGRUBS.asInteger
      else
        qryRubsIDCONFIGRUBS.asInteger := qryConfigRubDependIDCONFIGRUBS.asInteger;

      qryRubs.post;
      qryRubs.ApplyUpdates;

      //insere na tabela HISTMOVRUBS
      qryHistRubs.insert;
      qryHistRubsIDHISTMOVRUBS.AsFloat := LeultRegistro(nil,'HISTMOVRUBS');
      qryHistRubsIDRUBS.AsFloat     := qryRubsIDRUBS.AsFloat;
      qryHistRubsFLGSTATUS.AsString := IntToStr(Integer(srGerado) + 1);
      qryHistRubsHISTORICO.AsString := 'Gerada';
      qryHistRubsDATAMOV.AsDateTime := Date;
      qryHistRubs.post;
      qryHistRubs.ApplyUpdates;

      // insere na tabela RUBXBENEFICIO
      QryRubxBenef.Insert;
      QryRubxBenefIDRUBXBENEFICIO.asInteger := LeultRegistro(nil,'RUBXBENEFICIO');
      QryRubxBenefIdPessJur.CLEAR;
      QryRubxBenefIdPessoa.asInteger        := qryBenefBfCiarioIDPESSOA.AsInteger;
      QryRubxBenefIdPlanoPrev.CLEAR;
      QryRubxBenefIDTITULAR.asInteger       := qryBenefBfCiarioIDTITULAR.asInteger;
      //se é titular
      if qryBenefBfCiarioIDTITULAR.asInteger = qryBenefBfCiarioIDPESSOA.asInteger then
        QryRubxBenefIdBeneficio.asInteger := qryBenefServicoTitularIDSERVICOS.asInteger
      else
        QryRubxBenefIdBeneficio.asInteger := qryBenefServicoDependIDSERVICOS.asInteger;

      QryRubxBenefIDRUBS.AsInteger      := qryRubsIDRUBS.asInteger;
      QryRubxBenefIdsitbenef.asInteger  := 17;
      QryRubxBenef.post;
      QryRubxBenef.ApplyUpdates;

      qryDocAssoc.close;
      qryDocAssoc.paramByName('IDBENEFICIO').asFloat := QryRubxBenefIdBeneficio.asFloat;
      qryDocAssoc.open;

      QryDocAssoc.First;
      While Not QryDocAssoc.Eof Do
      Begin
         // insere na tabela TIPODOCXRUB todos os documentos associados ao modelo de RUB
        qryTipodocXrub.insert;
        qryTipodocXrubIDTIPODOCXRUB.AsFloat   := LeultRegistro(nil,'TIPODOCXRUB');
        qryTipodocXrubIDRUBXBENEFICIO.AsFloat := QryRubxBenefIDRUBXBENEFICIO.asInteger;
        qryTipodocXrubIDDOCUMENTO.AsFloat     := QryDocAssocIDDOCUMENTO.AsInteger;
        qryTipodocXrubFLGRECEBIDO.AsString    := 'N';
        qryTipodocXrubDATARECEB.Clear;
        qryTipodocXrub.post;
        qryTipodocXrub.ApplyUpdates;

        QryDocAssoc.Next;
      End;

    qryBenefBfCiario.Next;
    application.ProcessMessages;
    ProgressBar1.Position := ProgressBar1.Position + 1;
  end; // end while

  bbtnConfirmar.enabled := true;
  bbtnSair.enabled := true;
END;

procedure TfrmRubsRecad.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  abortaOperacao := true;
  bbtnConfirmar.enabled := true;
  DBLkBenefServicoTitularChange(Sender);
end;

procedure TfrmRubsRecad.DBLkBenefServicoTitularChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.enabled := (((DBLkBenefServicoTitular.text <> '') and (DBLKConfigRubTitular.text <> '')) OR
                    ((DBLkBenefServicoDepend.text <> '') and (DBLKConfigRubDepend.text <> '')));
end;

end.
