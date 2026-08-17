unit FDesvioAutomatico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, mListaPlano, mListaPatro,
  mContratoEmptmo, wwdblook, Wwdbigrd, Grids, Wwdbgrid, Mask, wwdbedit,
  Wwdbspin, Db, DBTables, Wwquery, Wwdatsrc;

type
  TTipoTratamento = (ttDesvioFolha, ttDesvioCAR);

  TfrmDesvioAutomatico = class(TfrmWizardMTEP)
    Label1: TLabel;
    Label2: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    molContratoEmptmo: TmolContratoEmptmo;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    DBgrdHistMov: TwwDBGrid;
    DBgrdHistMovIButton: TwwIButton;
    Panel4: TPanel;
    btnInverteSelecao: TBitBtn;
    btnMarcaTodos: TBitBtn;
    qryHistMov: TwwQuery;
    dsDesvio: TDataSource;
    TabSheet3: TTabSheet;
    dtsHistMovVirtual: TwwDataSource;
    updHistMovVirtual: TUpdateSQL;
    qryHistMovVirtual: TwwQuery;
    qryHistMovVirtualTRATAMENTO: TStringField;
    qryHistMovVirtualHMEPARCELA: TFloatField;
    qryHistMovVirtualPARCELA: TStringField;
    qryHistMovVirtualANOMES: TStringField;
    qryHistMovVirtualHMEDATAPREVISTA: TStringField;
    qryHistMovVirtualDESCRICAO: TStringField;
    qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField;
    qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
    qryHistMovVirtualHMEDATAVENCTO: TStringField;
    qryHistMovVirtualVALOR: TFloatField;
    DBgrdHistMovVirtual: TwwDBGrid;
    pnlInformaFinal: TPanel;
    qryHistMovFLGESCOLHA: TStringField;
    qryHistMovIDHISTMOVEMPTMO: TFloatField;
    qryHistMovITEDESCRICAO: TStringField;
    qryHistMovANOMES: TStringField;
    qryHistMovHMEANOCOMPETENCIA: TFloatField;
    qryHistMovHMEMESCOMPETENCIA: TFloatField;
    qryHistMovHMESEQCOBRANCA: TFloatField;
    qryHistMovHMETIPOMOV: TFloatField;
    qryHistMovIDCONTRATOEMPTMO: TFloatField;
    qryHistMovIDITEMEMPTMO: TFloatField;
    qryHistMovFLGBAIXADO: TFloatField;
    qryHistMovHMEDATAPREVISTA: TDateTimeField;
    qryHistMovHMEVLRPREVISTO: TFloatField;
    qryHistMovHMESALDODEV: TFloatField;
    qryHistMovPLNCODIGO: TFloatField;
    qryHistMovHMETXJUROS: TFloatField;
    qryHistMovHMEPARCELA: TFloatField;
    qryHistMovHMEDATAATUALIZA: TDateTimeField;
    qryHistMovHMENUMPARCELAS: TFloatField;
    qryHistMovHMEDATAEFETIVA: TDateTimeField;
    qryHistMovHMEVLREFETIVO: TFloatField;
    qryHistMovHMERECPAG: TStringField;
    qryHistMovIDITEMCENTRALIZA: TFloatField;
    qryHistMovIDREGRA: TFloatField;
    qryHistMovHMEORIGEM: TFloatField;
    qryHistMovHMEPRIORIDADE: TFloatField;
    qryHistMovEVENTO: TStringField;
    qryHistMovHMEFORMACOBRANCA: TStringField;
    qryHistMovIDRUBRICA: TFloatField;
    qryHistMovIDPATRO: TFloatField;
    qryHistMovCODDOCUMENTO: TFloatField;
    qryHistMovHMECENTRALIZA: TFloatField;
    qryHistMovHMEDESTACADO: TFloatField;
    qryHistMovHMEANOCOBRANCA: TFloatField;
    qryHistMovHMEMESCOBRANCA: TFloatField;
    qryHistMovFORMACOBRANCA: TStringField;
    qryHistMovHMEDATAVENCTO: TDateTimeField;
    qryHistMovFLGENVIO: TFloatField;
    qryHistMovFLGBAIXAMANUAL: TFloatField;
    qryHistMovSTATUS: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    pbExclui : Boolean;

    function DesviarParaFolha: Boolean;
    function DesviarParaCAR: Boolean;
    function VerificaTMPDESC: Boolean;
    function MontaSqlItens : String;
    procedure PreencheTabelaVirtual(bAbreTabela : Boolean);
    
  public
    { Public declarations }
  end;

var
  frmDesvioAutomatico: TfrmDesvioAutomatico;
  TipoTratamento     : TTipoTratamento;

implementation

{$R *.DFM}
uses
   UFuncoesEmptmo, // LimpaParametros, AtualizaConjunto
   uCalcEmptmo,
   UMensErro,      // MsgDlg 
   USistema,       // Sistema 
   dBaseDados,
   UIntegraEmptmo, // IntegraEmptmo 
   dEmptmo,        // qryParamEmptmo 
   DLookEmptmo,    // qryLookPortadorFormaR 
   FProgresso,     // FrmProgresso 
   UDocumento,     // Rotinas do CAPCAR 
   uDatabase,
   uModulo,
   uDiasUteis,
   uVerificaPreenchimento,
   uBiblioteca, dMS, fAguarde;    // ZD, ZE 


procedure TfrmDesvioAutomatico.bbtnConfirmarClick(Sender: TObject);
begin
    if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

    try
       with qryHistMov do
       begin
          DisableControls;
          First;

          while not(qryHistMov.EOF) do
          begin
             if FieldByName('FLGESCOLHA').AsInteger <> 0 then
             begin
                Case qryHistMov.FieldByName('HMEFORMACOBRANCA').AsString[1] of
                   'C': DesviarParaFolha;
                   'F': DesviarParaCAR;
                end;
             end;
             PreencheTabelaVirtual(False);
             qryHistMov.Next;
          end;
          EnableControls;
       end;


       // -------------------------------------------------------------------------------------
       // Log de operações
       if not(Sistema.GravaLogOperacoes('Trat. Parcelas Contrato ' +
                                        IntToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsInteger) +
                                        ': Desvio')) then
       begin
          Raise Exception.Create('Falha na gravação do Log da operação.');
       end;
       // -------------------------------------------------------------------------------------

       if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
       pgcControle.ActivePageIndex := 2;

    except
       if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

       Raise;
       Repaint;
    end;

end;



function TfrmDesvioAutomatico.DesviarParaFolha: Boolean;
var
   sMsg     : String;
   iRetorno : Integer;
begin
   { 1º Passo: Verifica se foi enviado e exclui Documento              }
   { 2º Passo: Alterar tabela HISTMONEMPTMO                            }
   { OBS.: Não trata envio.}

   TipoTratamento := ttDesvioFolha;
   Result := True;

   {1ºPasso ===========================================================}
   if not(qryHistMovCODDOCUMENTO.IsNull) then
   begin
      iRetorno := IntegraEmptmo.ExcluiFinanceiro(qryHistMov.FieldByName('CODDOCUMENTO').AsInteger, sMsg);

      if iRetorno <> 0 then MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbOk], 0);
   end;

   {2ºPasso ===========================================================}
   dtmEmptmo.qryAux.SQL.Clear;
   dtmEmptmo.qryAux.SQL.Add(' UPDATE HISTMOVEMPTMO SET HMEFORMACOBRANCA = ''F'', HMETIPOFOLHA = ''B'', ' +
                            ' FLGENVIO               = 0 '+
                            ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
                            ' AND IDHISTMOVEMPTMO    = '+qryHistMov.FieldByname('IDHISTMOVEMPTMO').AsString+
                            ' AND   HMEPARCELA       = '+qryHistMov.FieldBYName('HMEPARCELA').AsString);
   try
     dtmEmptmo.qryAux.ExecSql;
   except
     Result := False;
   end;
   {FIM - 2ºPasso}
end;



function TfrmDesvioAutomatico.DesviarParaCAR: Boolean;
var
  lsMesCobranca : String;
begin
   {1º Passo: Verifica se foi enviado (TMPDESC)
              Ir na TMPDESC através de rubricas. Portanto, saber quais rubricas
              foram inseridas. }
   {2º Passo: Excluir da TmpDesc as parcelas não enviadas.
              Para setar os registros na TMPDESC não utilizo o campo MESREFERENCIA,
              pois devo pegar todos os registros daquela parcela.              }
   {3º Passo: Alterar tabela HISTMOVEMPTMO                            }
   {OBS.: Não trata envio.
          Ao desviar uma parcela, será considerada todas àquelas que possuirem
          o mesmo MESCOBRANCA.}

   {1ºPasso ===========================================================}

   TipoTratamento := ttDesvioCAR;
   Result := VerificaTMPDESC;

   {FIM - 1ºPasso}

   with dtmEmptmo.qryAux Do begin
     {2ºPasso ===========================================================}
     if pbExclui then

       IntegraEmptmo.ExcluiTMPDESC(qryHistMovIDCONTRATOEMPTMO.AsInteger,
                                   qryHistMovIDHISTMOVEMPTMO.AsInteger,
                                   '', True);
     {FIM - 2ºPasso}

     {3ºPasso ===========================================================}
        SQL.Clear;
        SQL.Add(' UPDATE HISTMOVEMPTMO SET HMEFORMACOBRANCA = ''C'', HMETIPOFOLHA = NULL, '+
                ' FLGENVIO              = 0 '+
                ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
                ' AND   IDHISTMOVEMPTMO  = '+qryHistMov.FieldByname('IDHISTMOVEMPTMO').AsString+
                ' AND   HMEPARCELA      = '+qryHistMov.FieldBYName('HMEPARCELA').AsString);
        try
          ExecSql;
        except
          Result := False;
        end;
     {FIM - 3ºPasso}
   end; // with qryAux do
end;



function TfrmDesvioAutomatico.VerificaTMPDESC: Boolean;
var
   lbOk           : Boolean;
   lsMesCobranca  : String;
begin
   // 1ºPasso -----------------------------------------------------------------------------------
   lsMesCobranca  := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString + '/' +
                     Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString), 2);

   lbOk     := True;
   pbExclui := True;

   with dtmEmptmo.qryAux do begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS OCORRENCIA, SITENVIO FROM TMPDESC WHERE '+
              '     MESCOBRANCA = '+ QuotedStr(lsMesCobranca) +
              ' AND IDDESCONTO  = '+ qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString +
              ' AND IDMODULO    = '+ IntToStr(Sistema.IdModulo) +
              ' GROUP BY SITENVIO ');
      try
        Open;
      except
        lbOk := False;
        MsgDlg('Erro ao abrir tabela.', 'Empréstimo',MtError,[mbOk],0);
      end;

      // SE RETORNAR MAIS DE UM REGISTRO PODE HAVER INCONSISTÊNCIA,
      // POIS, PARA UM MESCOBRANCA EXISTE UMA RUBRICA ENVIADA E OUTRA NÃO.
      if RecordCount > 1 then begin
         MsgDlg('Existem problemas no Envio.', 'Empréstimo',MtError,[mbOk],0);
         lbOk := False;
      end;

      // uma linha não eviada.
      lbOk := (RecordCount = 1) and (FieldByName('SITENVIO').AsInteger = 0);

      if (not lbOk) and (not IsEmpty) then
         MsgDlg('A parcela já foi Enviada pela Folha de Benefícios'+#13+
                'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0)
      else if IsEmpty then begin
         pbExclui := False;
      end;
   end;

   Result := lbOk;
end;


procedure TfrmDesvioAutomatico.PreencheTabelaVirtual(bAbreTabela : Boolean);
var
   lsMesCobranca  : String;
begin

   if bAbreTabela or not(qryHistMovVirtual.Active) then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;
   end;

   // preenche a parcela tratada.
   lsMesCobranca   := FormatFloat('0000', qryHistMov.FieldByName('HMEANOCOBRANCA').AsFloat) + '/' +
                      FormatFloat('00', qryHistMov.FieldByName('HMEMESCOBRANCA').AsFloat);

   qryHistMovVirtual.Insert;

   qryHistMovVirtualANOMES.AsString                := lsMesCobranca;

   qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime;

   qryHistMovVirtualHMEPARCELA.AsInteger        := qryHistMov.FieldByName('HMEPARCELA').AsInteger;

   qryHistMovVirtualDESCRICAO.AsString        := 'Parcela';
   // tipo de tratamento
   Case TipoTratamento of
      ttDesvioFolha : qryHistMovVirtualTRATAMENTO.AsString := 'Desvio Folha';
      ttDesvioCAR   : qryHistMovVirtualTRATAMENTO.AsString := 'Desvio CaR';
   end;

   qryHistMovVirtual.Post;
end;



procedure TfrmDesvioAutomatico.btnContinuarClick(Sender: TObject);
begin
  inherited;

  with qryHistMov do begin
     Sql.Text := MontaSqlItens;
     
     LimpaParametros(qryHistMov);

     if molContratoEmptmo.IDContrato > 0 then
        ParamByName('PIDCONTRATOEMPTMO').AsInteger  := molContratoEmptmo.IDContrato;

     if DBcboTipoContrato.LookupValue <> '' then
        ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);

     Open;
  end;

  pgcControle.ActivePageIndex := 1;
end;


function TfrmDesvioAutomatico.MontaSqlItens : String;
var
   sSql : String;
begin
   sSql :=
    'SELECT '                                                                                    + #13 +
    '  ''0'' AS FLGESCOLHA, '                                                                    + #13 +
    '   HME.IDHISTMOVEMPTMO, '                                                                   + #13 +
    '   IRC.ITEDESCRICAO, '                                                                      + #13 +
    '   TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'') || '' /'' || HME.HMEANOCOMPETENCIA AS ANOMES, '   + #13 +
    '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA, '                      + #13 +
    '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO  ,  HME.FLGBAIXADO, '     + #13 +
    '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV   ,  HME.PLNCODIGO, '      + #13 +
    '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAATUALIZA, HME.HMENUMPARCELAS, ' + #13 +
    '   HME.HMEDATAEFETIVA   , HME.HMEVLREFETIVO    , HME.HMERECPAG, HME.IDITEMCENTRALIZA, '     + #13 +
    '   HME.IDREGRA          , HME.HMEORIGEM        , HME.HMEPRIORIDADE, '                       + #13 +
    '   DECODE(HME.HMETIPOMOV,0,''Concessão'', '                                                 + #13 +
    '                         1,''Parcela '', '                                                  + #13 +
    '                         2,''Amortização'', '                                               + #13 +
    '                         3,''Quitação'', '                                                  + #13 +
    '                         4,''Atualização Débito'') AS EVENTO, '                             + #13 +
    '   HME.HMEFORMACOBRANCA, '                                                                  + #13 +
    '   HME.IDRUBRICA, '                                                                         + #13 +
    '   CNT.IDPATRO, '                                                                           + #13 +

    '   HME.CODDOCUMENTO, '                                                                      + #13 +

    '   HME.HMECENTRALIZA, '                                                                     + #13 +
    '   HME.HMEDESTACADO, '                                                                      + #13 +
    '   HME.HMEANOCOBRANCA, '                                                                    + #13 +
    '   HME.HMEMESCOBRANCA, '                                                                    + #13 +
    '   DECODE(HME.HMEFORMACOBRANCA,''F'',''Folha'', ''C'',''Financeiro'') AS FORMACOBRANCA, '   + #13 +
    '   HME.HMEDATAVENCTO, HME.FLGENVIO, '                                                       + #13 +
    '   HME.FLGBAIXAMANUAL, '                                                                    + #13 +
    '   DECODE(HME.FLGBAIXAMANUAL, 1, ''Baixa Manual'', NULL) AS STATUS '                        + #13 +
    'FROM '                                                                                      + #13 +
    '   HISTMOVEMPTMO  HME, '                                                                    + #13 +
    '   CONTRATOEMPTMO CNT, '                                                                    + #13 +
    '   ITEMXTIPOCONTR IRT, '                                                                    + #13 +
    '   ITEMEMPTMO     IRC '                                                                     + #13 +

    'WHERE '                                                                                     + #13 +
    '       ((:PIDCONTRATOEMPTMO  IS NULL) OR ( HME.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO )) '   + #13 +
    '   AND ((:PIDTIPOCONTREMPTMO IS NULL) OR ( IRT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )) '  + #13 +
    '   AND ( CNT.IDPATRO            IN ( ' + molListaPatro.PegaPatro + ' ) ) '                  + #13 +
    '   AND ( CNT.IDPLANOPREV        IN ( ' + molListaPlano.PegaPlano + ' ) ) '                  + #13 +
    '   AND ( HME.IDITEMEMPTMO      = IRT.IDITEMEMPTMO ) '                                       + #13 +
    '   AND ( IRT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                       + #13 +
    '   AND ( (HME.HMECENTRALIZA    = 1) OR (HME.HMEDESTACADO = 1) ) '                           + #13 +
    '   AND ( HME.HMETIPOMOV        NOT IN (5, 8) ) '                                            + #13 +
    '   AND ( HME.FLGDIVERGPEND     = 1 ) '                                                      + #13 +
    '   AND ( HME.FLGTIPODIVERG     = 6 ) '                                                      + #13 +
    '   AND ( (HME.FLGESTORNADO     = 0) OR (HME.FLGESTORNADO IS NULL) ) '                       + #13 +
    '   AND ( (HME.FLGABONADO       = 0) OR (HME.FLGABONADO IS NULL) ) '                         + #13 +
    '   AND ( (HME.FLGQUITADO       = 0) OR (HME.FLGQUITADO IS NULL) ) '                         + #13 +
    '   AND ( (HME.FLGBAIXADO       = 0) ) '                                                     + #13 +
    '   AND ( CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO ) '                                   + #13 +

    'ORDER BY '                                                                                  + #13 +
    '   HME.HMEPARCELA, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA '                           + #13;

    Result := sSql;

end;



procedure TfrmDesvioAutomatico.FormShow(Sender: TObject);
begin
  inherited;
   molListaPatro.PreenchePatro;
   (* ...e marca todas por default *)
   molListaPatro.btnMarcaTodosPatroClick(self);

   (* Preenche a listbox de Planos... *)
   molListaPlano.PreenchePlano;
   (* ...e marca todos por default *)
   molListaPlano.btnMarcaTodosPlanoClick(self);
end;



end.
