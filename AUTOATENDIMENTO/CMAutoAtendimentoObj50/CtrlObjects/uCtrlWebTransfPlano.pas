unit uCtrlWebTransfPlano;

interface

Uses  SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
      uCtrlRegra, JCLSysUtils, uCtrlFuncoesAA, Classes, uTiposRegraMT;

Type
  TCtrlWebTransfPlano = class(TCmControlObject)
  private

  protected

  public

    function ParticipantePlano( iIdPessoa : integer ) : OleVariant;

    function ExisteSimulaTransfPlano( iIdEventoGerador, iIdPessoa : integer ) : boolean;

    function ParticipanteOrigem( iIdEventoGerador,
                                 iIdPessoa,
                                 iIdPessJur,
                                 iIdPlanoPrev,
                                 iSeqProposta : integer): OleVariant;


    function RecebeBenef( iIdPessoa,
                          iIdPessJur,
                          iIdPlanoPrev : integer): OleVariant;


    function ContaBeneficiarios( iIdPessoa,
                                 iIdPessJur,
                                 iIdPlanoPrev : integer): OleVariant;

    function LookupPlanos : OleVariant;

    function RecuperaNomePlano( iIdPlanoPrev: integer): OleVariant;

    function RecuperaEventoGerador : OleVariant;

    function SelecionaInput( iIdEventoGerador : integer;
                             sFlgInterno : string;
                             iInput : integer ) : OleVariant;

    function TiposTransfPlano( iIdEventoGerador : integer; sFlgTipo : string ) : OleVariant;

    function ConfigTransfPlano( iIdEventoGerador : integer ) : OleVariant;

    function SimulaTransferencia( iIdPessJur,
                                  iIdPlanoPrev,
                                  iIdPessoa,
                                  iSeqProposta,
                                  iIdEventoGerador : integer;
                                  sFLGINTERNO,
                                  sDATAMORTE : string;
                                  iIdEmpresa : integer;
                                  sFlgTipo,
                                  sOpcao,
                                  sDataRef : string;
                                  bBeneficioTemporario : boolean;
                                  oInput,
                                  oResult : OleVariant ): OleVariant;

    function DatasetResultTransfPlano( iIdEventoGerador, iIdPessJur, iIdPlanoPrev,
                                       iIdPessoa, iSeqProposta, iIdTipoTransf : integer;
                                       sSQLInput, sDataRef, sOpcao : string ) : OleVariant;

    function DadosAssistido( iIdPessJur,
                             iIdPlanoPrev,
                             iIdPessoa,
                             iSeqProposta : integer ) : OleVariant;


    function GeraOpcoes( iIdPessJur,
                         iIdPlanoPrev,
                         iIdPessoa,
                         iSeqProposta,
                         iIdEventoGerador : integer;
                         sFLGINTERNO : string;
                         iIdEmpresa : integer;
                         sDataRef : string;
                         bBeneficioTemporario : boolean;
                         oInput,
                         oResult : OleVariant ): OleVariant;


    function GeraCamposOpcoes( iIdEmpresa,
                               iIdEventoGerador : integer;
                               sFlgInterno,
                               sFlgBenefTemp : string;
                               iIdPessJur,
                               iIdPlanoPrevAtual,
                               iIdPessoa,
                               iSeqProposta : integer;
                               dDataRef : string;
                               sListaCampos : String;
                               oInput : OleVariant ) : OleVariant;


    function GeraCamposEstimativas(  iIdEmpresa,
                                     iIdEventoGerador : integer;
                                     sFlgInterno,
                                     sFlgBenefTemp : string;
                                     iIdPessJur,
                                     iIdPlanoPrevAtual,
                                     iIdPessoa,
                                     iSeqProposta : integer;
                                     dDataRef : string;
                                     sListaCampos : String;
                                     oInput : OleVariant ) : OleVariant;


    function GeraEstimativas(  iIdPessJur,
                               iIdPlanoPrev,
                               iIdPessoa,
                               iSeqProposta,
                               iIdEventoGerador : integer;
                               sOpcao,
                               sFLGINTERNO : string;
                               iIdEmpresa : integer;
                               sDataRef : string;
                               bBeneficioTemporario : boolean;
                               oInput,
                               oResult : OleVariant ): OleVariant;




    function DatasetCamposTransfPlano( iIdEventoGerador, iIdPessJur, iIdPlanoPrev,
                                       iIdPessoa, iSeqProposta : integer;
                                       sSQLInput, sDataRef : string ) : OleVariant;

    function ValidaConteudo(  iRegra : integer;
                              sValor : string;
                              iIdPessJur,
                              iIdPlanoPrev,
                              iIdPessoa,
                              iSeqProposta,
                              iIdEventoGerador,
                              iIdEmpresa : integer;
                              sOpcao : string;
                              sDataRef : string;
                              oInfBanco : OleVariant ) : boolean;

    function GeraObservacoes( iIdEventoGerador,
                              iTipoObs : integer;
                              sFlgInterno : string ) : OleVariant;

  published

end;

implementation

{ TCtrlWebTransfPlano }

function TCtrlWebTransfPlano.ConfigTransfPlano( iIdEventoGerador: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT   IDTIPOTRANSF,     ' +
   '          IDCONFIG,         ' +
   '          NOME,             ' +
   '          IDREGRA,          ' +
   '          ORDEM,            ' +
   '          TIPODADO          ' +
   ' FROM     CONFIGTRANSFPLANO ' +
   ' WHERE    IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador ) +
   ' ORDER BY IDTIPOTRANSF,     ' +
   '          ORDEM             ' );
end;

function TCtrlWebTransfPlano.ContaBeneficiarios(iIdPessoa, iIdPessJur,
  iIdPlanoPrev: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select count( distinct bf.IDPESSOA ) as NUMBENEF   ' +
   ' from   BFCIARIOTITPLAN bf                          ' +
   ' where  bf.IDPESSJUR   = ' + IntToStr( iIdPessJur   ) +
   '   and  bf.IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) +
   '   and  bf.IDTITULAR   = ' + IntToStr( iIdPessoa    ) +
   '   and  bf.SEQPROPOSTA =  1                         ' +
   '   and  bf.IDPESSOA    <> bf.IDTITULAR              ' );
end;

function TCtrlWebTransfPlano.RecuperaEventoGerador : OleVariant;
begin
  Result := GetDataPacket(
   ' select IDEVENTOGERADOR                          ' +
   ' from   EVENTOGERADOR                            ' +
   ' where  FLGINTERNO = ''TP''                      ' );
end;

function TCtrlWebTransfPlano.LookupPlanos : OleVariant;
begin
  Result := GetDataPacket(
   ' select                                        ' +
   ' distinct pl.IDPLANOPREV,                      ' +
   '          pl.NOME                              ' +
   ' from     PLANPREV pl,                         ' +
   '          CONFIGTRANSFPLANO cfg                ' +
   ' where    pl.IDPLANOPREV = cfg.IDPLANOPREV     ' +
   ' order by PL.NOME                              ' );
end;

function TCtrlWebTransfPlano.ParticipanteOrigem( iIdEventoGerador,
                                                 iIdPessoa,
                                                 iIdPessJur,
                                                 iIdPlanoPrev,
                                                 iSeqProposta : integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select s.IDPESSJUR,                                                                 ' +
   '        s.IDPLANOPREV,                                                               ' +
   '        s.IDPESSOA,                                                                  ' +
   '        s.SEQPROPOSTA,                                                               ' +
   '        s.MATRICULA,                                                                 ' +
   '        s.INSCRICAODATA,                                                             ' +
   '        s.SITUACAO,                                                                  ' +
   '        s.IDADEAPOS,                                                                 ' +
   '        s.DATANASC,                                                                  ' +
   '        s.DATAMORTE,                                                                 ' +
   '        s.ESTADOCIVIL         as ESTCIVIL,                                           ' +
   '        s.SEXO,                                                                      ' +
   '        s.DATAADMISSAO,                                                              ' +
   '        s.DATADEMISSAO,                                                              ' +
   '        s.SITUACAO            as FLGINTERNO,                                         ' +
   '        el.TEMPONAOCREDITADO,                                                        ' +
   '        el.TEMPOSERVANTERIOR,                                                        ' +
   '        el.TEMPOSERVANTREAL,                                                         ' +
   '        el.TEMPOSERVCALC,                                                            ' +
   '        el.TEMPOSERVPRIVANT,                                                         ' +
   '        el.TEMPOSERVPUBLANT,                                                         ' +
   '        el.TEMPOSERVTOTAL,                                                           ' +
   '        el.TEMPOSERVTOTDIA,                                                          ' +
   '        el.TEMPOSERVTOTMES,                                                          ' +
   '        el.TEMPOSITESPECIAL,                                                         ' +
   '        s.SALPARTICIPACAO     as VALORPROVENTO,                                      ' +
   '        s.SALPARTICIPACAO,                                                           ' +
   '        s.REMUNERACAO,                                                               ' +
   '        s.CONTRIBUICAO,                                                              ' +
   '        s.TEMPOINSS,                                                                 ' +
   '        s.JOIA,                                                                      ' +
   '        s.PRAZOJOIAFALTA,                                                            ' +
   '        s.PRAZOJOIAPAGO,                                                             ' +
   '        s.RPTRIBUTAVEL,                                                              ' +
   '        s.RPNAOTRIBUTAVEL,                                                           ' +
   '        s.SRB,                                                                       ' +
   '        s.FATORPREVIDENC,                                                            ' +
   '        s.TEMPOMINCONTRIB,                                                           ' +
   '        s.DATAINICIOFUND,                                                            ' +
   '        s.VALORATUAL,                                                                ' +
   '        s.VLRINFINSS,                                                                ' +
   '        s.IDBENEFICIO,                                                               ' +
   '        s.VALORABONO,                                                                ' +
   '        s.DATAULTSIMULA,                                                             ' +
   '        s.PROPORCAO,                                                                 ' +
   '        s.COTAPENSAO,                                                                ' +
   '        s.DATANASCVIT,                                                               ' +
   '        s.DATANASCTEMP,                                                              ' +
   '        s.NUMDEPEN,                                                                  ' +
   '        s.OPCAO,                                                                     ' +
   '        s.TAXAJOIA,                                                                  ' +
   '        s.NOMESITUACAO,                                                              ' +
   '        s.NOMEBENEFICIO,                                                             ' +
   '        p.NOME                as NOMEPARTICIP,                                       ' +
   '        pat.NOME              as NOMEPATRO,                                          ' +
   '        pl.NOME               as NOMEPLANO,                                          ' +
   '        b.FLGBENEFTEMP,                                                              ' +
   '        eg.DATADADOS          as DATAREF,                                            ' +
   '        eg.DATATRANSACAO,                                                            ' +
   '        s.NUMDEPENVIT,                                                               ' +
   '        s.CAMPOOP1,                                                                  ' +
   '        s.CAMPOOP2,                                                                  ' +
   '        s.CAMPOOP3,                                                                  ' +
   '        s.CAMPOOP4,                                                                  ' +
   '        s.CAMPOOP5,                                                                  ' +
   '        s.NUMDEPENTEMP                                                               ' +
   ' from   PESSOA                p,                                                     ' +
   '        PESSOA                pat,                                                   ' +
   '        ELEGPATRO             el,                                                    ' +
   '        SIMULAMIGRACAO        s,                                                     ' +
   '        EVENTOGERADOR         eg,                                                    ' +
   '        PLANPREV              pl,                                                    ' +
   '        BENEFICIO             b,                                                     ' +
   '        BENEFPLANPREV         bp                                                     ' +
   ' where  eg.IDEVENTOGERADOR    = ' + IntToStr( iIdEventoGerador )                       +
   '   and  s.IDPESSJUR           = ' + IntToStr( iIdPessJur       )                       +
   '   and  s.IDPLANOPREV         = ' + IntToStr( iIdPlanoPrev     )                       +
   '   and  s.IDPESSOA            = ' + IntToStr( iIdPessoa        )                       +
   '   and  s.SEQPROPOSTA         = ' + IntToStr( iSeqProposta     )                       +
   '   and  s.ANOMESREF           = to_char( nvl( eg.DATADADOS, sysdate ), ''YYYY/MM'' ) ' +
   '   and  el.IDPESSJUR          = s.IDPESSJUR                                          ' +
   '   and  el.IDPESSOA           = s.IDPESSOA                                           ' +
   '   and  p.IDPESSOA            = el.IDPESSOA                                          ' +
   '   and  pat.IDPESSOA          = el.IDPESSJUR                                         ' +
   '   and  pl.IDPLANOPREV        = s.IDPLANOPREV                                        ' +
   '   and  b.IDBENEFICIO  (+)    = s.IDBENEFICIO                                        ' +
   '   and  bp.IDPLANOPREV (+)    = s.IDPLANOPREV                                        ' +
   '   and  bp.IDBENEFICIO (+)    = s.IDBENEFICIO                                        ' );
end;

function TCtrlWebTransfPlano.ParticipantePlano( iIdPessoa : integer ) : OleVariant;
begin
  Result := GetDataPacket( ' select pp.IDPESSJUR,                         ' +
                           '        pp.IDPLANOPREV,                       ' +
                           '        pp.IDPESSOA                           ' +
                           ' from   PARTPREVPLAN PP                       ' +
                           ' where  PP.IDPESSOA = ' + IntToStr( iIdPessoa ) );
end;

function TCtrlWebTransfPlano.RecebeBenef(iIdPessoa, iIdPessJur, iIdPlanoPrev: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select b.IDBENEFICIO,                                  ' +
   '        b.NOME,                                         ' +
   '        bf.IDSITBENEFICIO                               ' +
   ' from   BENEFICIO     b,                                ' +
   '        BENEFBFCIARIO bf                                ' +
   ' where  bf.IDPESSJUR      =  ' + IntToStr( iIdPessJur   ) +
   '   and  bf.IDPLANOPREV    =  ' + IntToStr( iIdPlanoPrev ) +
   '   and  bf.IDTITULAR      =  ' + IntToStr( iIdPessoa    ) +
   '   and  bf.SEQPROPOSTA    =  1                          ' +
   '   and  bf.IDSITBENEFICIO in ( 1, 2 )                   ' +
   '   and  b.IDBENEFICIO     =  bf.iDBENEFICIO             ' );
end;

function TCtrlWebTransfPlano.RecuperaNomePlano(
  iIdPlanoPrev: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select   NOME                                       ' +
   ' from     PLANPREV                                   ' +
   ' where    IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) );
end;

function TCtrlWebTransfPlano.SelecionaInput( iIdEventoGerador : integer;
                                             sFlgInterno : string;
                                             iInput : integer ) : OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select   IDEVENTOGERADOR,                                   ' +
   '          IDINPUT,                                           ' +
   '          DESCRICAO,                                         ' +
   '          IDREGRA,                                           ' +
   '          FLGTIPO,                                           ' +
   '          TABELA,                                            ' +
   '          CAMPO,                                             ' +
   '          NOMEPARAREGRA,                                     ' +
   '          FLGATIVO,                                          ' +
   '          FLGMANTIDO,                                        ' +
   '          FLGMANTPARC,                                       ' +
   '          FLGASSISTIDO,                                      ' +
   '          FLGBENEFICIARIO,                                   ' +
   '          FLGPODEALTERAR,                                    ' +
   '          ORDEM,                                             ' +
   '          VALORDEFAULT,                                      ' +
   '          IDREGRAVALIDA,                                     ' +
   '          OBSERVACAO,                                        ' +
   '          TIPODADO,                                          ' +
   '          IDREGRAVLRDEFAULT,                                 ' +
   '          ''                              '' as VALOR        ' +
   ' from     INPUTTRANSFPLANO                                   ' +
   ' where    IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador   ) ;

  if iInput = 1 then sSQL := sSQL + ' and FLGTIPO <> ''I'' ' else
  if iInput = 2 then sSQL := sSQL + ' and FLGTIPO =  ''I'' ';

  if      sFlgInterno = 'AT' then sSQL := sSQL + ' and FLGATIVO        = 1 '
  else if sFlgInterno = 'MA' then sSQL := sSQL + ' and FLGMANTIDO      = 1 '
  else if sFlgInterno = 'MP' then sSQL := sSQL + ' and FLGMANTPARC     = 1 '
  else if sFlgInterno = 'FL' then sSQL := sSQL + ' and FLGBENEFICIARIO = 1 '
  else                            sSQL := sSQL + ' and FLGASSISTIDO    = 1 ';


  sSQL := sSQL +
   ' order by ORDEM,                                             ' +
   '          DESCRICAO                                          ' ;

  Result := GetDataPacket( sSQL );
end;

function TCtrlWebTransfPlano.SimulaTransferencia( iIdPessJur,
                                                  iIdPlanoPrev,
                                                  iIdPessoa,
                                                  iSeqProposta,
                                                  iIdEventoGerador : integer;
                                                  sFLGINTERNO,
                                                  sDATAMORTE : string;
                                                  iIdEmpresa : integer;
                                                  sFlgTipo,
                                                  sOpcao,
                                                  sDataRef : string;
                                                  bBeneficioTemporario : boolean;
                                                  oInput,
                                                  oResult : OleVariant ): OleVariant;
var
  Regra : TCtrlRegra;

  cdsTiposTransfPlano,
  cdsConfigTransfPlano,
  cdsInput,
  cdsParticipanteOrigem,
  cdsDataSetIn,
  cdsResult :  TCMClientDataSet;

  sSQLInput, sValorItem : string;
  bOpcaoPermitida : boolean;

  i : integer;

  sItem, sMsg, sOp : string;
begin


  Regra := TCtrlRegra.Create;

  cdsTiposTransfPlano   := TCMClientDataSet.Create(nil);
  cdsConfigTransfPlano  := TCMClientDataSet.Create(nil);
  cdsInput              := TCMClientDataSet.Create(nil);
  cdsDataSetIn          := TCMClientDataSet.Create(nil);
  cdsResult             := TCMClientDataSet.Create(nil);

  try

    try

      Regra.InitializeAs( Self );
      Regra.IdEmpresa := iIdEmpresa;
      Regra.TipoCliente := tcFundacao;

      cdsInput.Data              := oInput;
      cdsResult.Data             := oResult;

      sSQLInput := '';
      cdsInput.First;

      while not cdsInput.Eof do
      begin
        if trim( cdsInput.FieldByName('NOMEPARAREGRA').AsString ) <> '' then
          sSQLInput := sSQLInput +
           '''' + OraNumero( cdsInput.FieldByName('VALOR').AsString ) + ''' as ' +
           Trim( cdsInput.FieldByName('NOMEPARAREGRA').AsString ) + ', ';

        cdsInput.Next;
      end;
      cdsInput.Close;

      cdsTiposTransfPlano.Data  := TiposTransfPlano( iIdEventoGerador, sFlgTipo );
      cdsConfigTransfPlano.Data := ConfigTransfPlano( iIdEventoGerador );

      i := 0;
      cdsTiposTransfPlano.First;
      while not cdsTiposTransfPlano.Eof do
      begin
        sItem := cdsTiposTransfPlano.FieldByName('NOME').AsString;

        bOpcaoPermitida := True;
        sMsg := '';

        // Verificar se opcao é permitida para situação correspondente
        if   ( ( cdsTiposTransfPlano.FieldByName('FLGATIVO').AsInteger = 0 )
          or   bBeneficioTemporario )
         and ( sFLGINTERNO = 'AT' ) then
        begin
           sMsg := 'Esta opção não é permitida para participantes ativos.';
           bOpcaoPermitida := False;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'MA' ) then
        begin
          sMsg := 'Esta opção não é permitida para participantes mantidos.';
          bOpcaoPermitida := False;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTPARC').AsInteger = 0 )
         and ( sFLGINTERNO = 'MP' ) then
        begin
          sMsg := 'Esta opção não é permitida para participantes mantidos parciais.';
          bOpcaoPermitida := False;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGASSISTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AS' ) and ( sDATAMORTE = '' ) then
        begin
          sMsg := 'Esta opção não é permitida para participantes assistidos.';
          bOpcaoPermitida := False;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGBENEFICIARIO').AsInteger = 0 )
         and ( sDATAMORTE <> '' ) then
        begin
          sMsg := 'Esta opção não é permitida para beneficiários.';
          bOpcaoPermitida := False;
        end;

        if bOpcaoPermitida then
        begin
          Inc( i );

          cdsConfigTransfPlano.First;
          while not cdsConfigTransfPlano.Eof do
          begin
            if  ( cdsConfigTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger <>
                  cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger )
             or ( cdsConfigTransfPlano.FieldByName('IDREGRA').AsInteger <= 0 ) then
            begin
              cdsConfigTransfPlano.Next;
              Continue;
            end;

            sValorItem := '';
            cdsDataSetIn.Close;

            sOp := iff( trim( sOpcao ) <> '', sOpcao, IntToStr( i ) );

            cdsDataSetIn.Data := DatasetResultTransfPlano( iIdEventoGerador,
                                                           iIdPessJur,
                                                           iIdPlanoPrev,
                                                           iIdPessoa,
                                                           iSeqProposta,
                                                           cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger,
                                                           sSQLInput,
                                                           sDataRef,
                                                           sOp );


            Regra.CopiaData( cdsDataSetIn.Data );
            Regra.RuleNumber := cdsConfigTransfPlano.FieldByName('IDREGRA').AsString;
            Regra.Execute;
            sValorItem := Regra.Result;

            cdsResult.Insert;
            cdsResult.FieldByName('ITEM').AsString         := sItem;
            cdsResult.FieldByName('IDTIPOTRANSF').AsString := cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsString;
            cdsResult.FieldByName('IDCONFIG').AsString     := cdsConfigTransfPlano.FieldByName('IDCONFIG').AsString;
            cdsResult.FieldByName('FLGTIPO').AsString      := cdsTiposTransfPlano.FieldByName('FLGTIPO').AsString;
            cdsResult.FieldByName('NOME').AsString         := cdsConfigTransfPlano.FieldByName('NOME').AsString;
            cdsResult.FieldByName('VALOR').AsString        := sValorItem;
            cdsResult.FieldByName('MSG').AsString          := sMsg;
            cdsResult.Post;

            cdsConfigTransfPlano.Next;
          end;

        end
        else
        begin
          cdsResult.Insert;
          cdsResult.FieldByName('ITEM').AsString         := sItem;
          cdsResult.FieldByName('IDTIPOTRANSF').AsString := cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsString;
          cdsResult.FieldByName('IDCONFIG').AsString     := cdsConfigTransfPlano.FieldByName('IDCONFIG').AsString;
          cdsResult.FieldByName('FLGTIPO').AsString      := cdsTiposTransfPlano.FieldByName('FLGTIPO').AsString;
          cdsResult.FieldByName('MSG').AsString          := sMsg;
          cdsResult.Post;
        end;

        cdsTiposTransfPlano.Next;
      end;

      Result := cdsResult.Data;

    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        Rollback;
        raise;
      end;
    end;

  finally
    Regra.Free;
    cdsTiposTransfPlano.Free;
    cdsConfigTransfPlano.Free;
    cdsInput.Free;
    cdsDataSetIn.Free;
    cdsResult.Free;
  end;

end;

function TCtrlWebTransfPlano.TiposTransfPlano( iIdEventoGerador : integer; sFlgTipo : string ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   IDEVENTOGERADOR,                                   ' +
   '          IDTIPOTRANSF,                                      ' +
   '          NOME,                                              ' +
   '          FLGATIVO,                                          ' +
   '          FLGMANTIDO,                                        ' +
   '          FLGMANTPARC,                                       ' +
   '          FLGASSISTIDO,                                      ' +
   '          FLGBENEFICIARIO,                                   ' +
   '          FLGTIPO,                                           ' +
   '          VALORAMIGRAR,                                      ' +
   '          TIPODADO,                                          ' +
   '          IDREGRABASE                                        ' +   
   ' from     TIPOSTRANSFPLANO                                   ' +
   ' where    IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador   ) +
   '   and    FLGTIPO         = ' + QuotedStr( sFlgTipo          ) +
   ' order by VALORAMIGRAR                                       ' );
end;


//Prepara dataset para regra de montagem de campos para transferência de campo
function TCtrlWebTransfPlano.DatasetResultTransfPlano( iIdEventoGerador, iIdPessJur, iIdPlanoPrev,
                                                       iIdPessoa, iSeqProposta, iIdTipoTransf : integer;
                                                       sSQLInput, sDataRef, sOpcao : string ) : OleVariant;
var
  sSQL : String;
begin
  sSQL :=
   ' select ' + sSQLInput                                                                +
   '        s.IDPESSJUR,                                                               ' +
   '        s.IDPLANOPREV,                                                             ' +
   '        s.IDPESSOA,                                                                ' +
   '        s.SEQPROPOSTA,                                                             ' +
   '        s.MATRICULA,                                                               ' +
   '        decode( s.SITUACAO, ''FL'', ''AS'', s.SITUACAO ) as SITUACAO,              ' +
   '        s.DATANASC,                                                                ' +
   '        s.DATAMORTE,                                                               ' +
   '        s.ESTADOCIVIL      as ESTCIVIL,                                            ' +
   '        s.SEXO,                                                                    ' +
   '        s.DATAADMISSAO,                                                            ' +
   '        s.DATADEMISSAO,                                                            ' +
   '        s.COTAPENSAO,                                                              ' +
   '        s.DATANASCVIT,                                                             ' +
   '        s.DATANASCTEMP,                                                            ' +
   '        s.NUMDEPEN,                                                                ' +
   '        s.NUMDEPENVIT,                                                             ' +
   '        s.NUMDEPENTEMP,                                                            ' +
   '        el.TEMPONAOCREDITADO,                                                      ' +
   '        el.TEMPOSERVANTERIOR,                                                      ' +
   '        el.TEMPOSERVANTREAL,                                                       ' +
   '        el.TEMPOSERVCALC,                                                          ' +
   '        el.TEMPOSERVPRIVANT,                                                       ' +
   '        el.TEMPOSERVPUBLANT,                                                       ' +
   '        el.TEMPOSERVTOTAL,                                                         ' +
   '        el.TEMPOSERVTOTDIA,                                                        ' +
   '        el.TEMPOSERVTOTMES,                                                        ' +
   '        el.TEMPOSITESPECIAL,                                                       ' +
   '        s.SALPARTICIPACAO  as VALORPROVENTO,                                       ' +
   '        s.SALPARTICIPACAO,                                                         ' +
   '        s.REMUNERACAO,                                                             ' +
   '        s.CONTRIBUICAO,                                                            ' +
   '        s.TEMPOINSS,                                                               ' +
   '        s.JOIA,                                                                    ' +
   '        s.PRAZOJOIAFALTA,                                                          ' +
   '        s.PRAZOJOIAPAGO,                                                           ' +
   '        s.RPTRIBUTAVEL,                                                            ' +
   '        s.RPNAOTRIBUTAVEL,                                                         ' +
   '        s.SRB,                                                                     ' +
   '        s.FATORPREVIDENC,                                                          ' +
   '        s.TEMPOMINCONTRIB,                                                         ' +
   '        s.DATAINICIOFUND,                                                          ' +
   '        s.VALORATUAL,                                                              ' +
   '        s.VLRINFINSS,                                                              ' +
   '        s.IDBENEFICIO,                                                             ' +
   '        s.VALORABONO,                                                              ' +
   '        s.DATAULTSIMULA,                                                           ' +
   '        s.IDADEAPOS,                                                               ' +
   '        s.CAMPOOP1,                                                                ' +
   '        s.CAMPOOP2,                                                                ' +
   '        s.CAMPOOP3,                                                                ' +
   '        s.CAMPOOP4,                                                                ' +
   '        s.CAMPOOP5,                                                                ' +
   '        ''' + sOpcao + '''     as OPCAO,                                           ' +
   '        ''' + sDataRef + ''' as DATAREF,                                           ' +
   '        ''' + IntToStr( iIdTipoTransf ) + ''' as IDTIPOTRANSF                      ' +
   ' from   ELEGPATRO          el,                                                     ' +
   '        SIMULAMIGRACAO     s,                                                      ' +
   '        EVENTOGERADOR      eg                                                      ' +
   ' where  eg.IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador )                        +
   '   and  s.IDPESSJUR        = ' + IntToStr( iIdPessJur       )                        +
   '   and  s.IDPLANOPREV      = ' + IntToStr( iIdPlanoPrev     )                        +
   '   and  s.IDPESSOA         = ' + IntToStr( iIdPessoa        )                        +
   '   and  s.SEQPROPOSTA      = ' + IntToStr( iSeqProposta     )                        +
   '   and  s.ANOMESREF        = to_char( nvl( eg.DATADADOS, sysdate ), ''YYYY/MM'' )  ' +
   '   and  el.IDPESSJUR       = s.IDPESSJUR                                           ' +
   '   and  el.IDPESSOA        = s.IDPESSOA                                            ' ;

  Result := GetDataPacket( sSQL );
end;

function TCtrlWebTransfPlano.DadosAssistido(iIdPessJur, iIdPlanoPrev,
  iIdPessoa, iSeqProposta: integer): OleVariant;
begin
  Result := GetDataPacket( 
   ' select   bf.IDBENEFICIO,                                                 ' +
   '          bf.DATAINICIOFUND,                                              ' +
   '          bf.VALORSRB,                                                    ' +
   '          inss.VALORATUAL      as VLRCALCINSS,                            ' +
   '          inss.VALORATUAL      as VLRINFINSS,                             ' +
   '          sum( bf.VALORATUAL ) as VALORATUAL                              ' +
   ' from     BENEFBFCIARIO bf,                                               ' +
   '          BENEFPLANPREV bpsupl,                                           ' +
   '          ( select distinct                                               ' +
   '                   inss.NUMEROPROCESSO,                                   ' +
   '                   inss.VALORATUAL                                        ' +
   '            from   BENEFPLANPREV bpinss,                                  ' +
   '                   BENEFBFCIARIO inss                                     ' +
   '            where  inss.IDPESSJUR       = ' + IntToStr( iIdPessJur    )     +
   '              and  inss.IDPLANOPREV     = ' + IntToStr( iIdPlanoPrev  )     +
   '              and  inss.IDPESSOA        = ' + IntToStr( iIdPessoa     )     +
   '              and  inss.SEQPROPOSTA     = ' + IntToStr( iSeqProposta  )     +
   '              and  bpinss.IDPLANOPREV   = inss.IDPLANOPREV                ' +
   '              and  bpinss.IDBENEFICIO   = inss.IDBENEFICIO                ' +
   '              and  bpinss.FLGREFERENCIA = 1 ) inss                        ' +
   ' where    bf.IDPESSJUR           = ' + IntToStr( iIdPessJur    )            +
   '   and    bf.IDPLANOPREV         = ' + IntToStr( iIdPlanoPrev  )            +
   '   and    bf.IDPESSOA            = ' + IntToStr( iIdPessoa     )            +
   '   and    bf.SEQPROPOSTA         = ' + IntToStr( iSeqProposta  )            +
   '   and    bpsupl.IDPLANOPREV     = bf.IDPLANOPREV                         ' +
   '   and    bpsupl.IDBENEFICIO     = bf.IDBENEFICIO                         ' +
   '   and    bpsupl.FLGREFERENCIA   = 0                                      ' +
   '   and    inss.NUMEROPROCESSO(+) = bf.NUMEROPROCESSO                      ' +
   ' group by bf.IDBENEFICIO,                                                 ' +
   '          bf.DATAINICIOFUND,                                              ' +
   '          bf.VALORSRB,                                                    ' +
   '          inss.VALORATUAL                                                 ' );
end;

function TCtrlWebTransfPlano.GeraOpcoes(iIdPessJur, iIdPlanoPrev,
  iIdPessoa, iSeqProposta, iIdEventoGerador: integer;
  sFLGINTERNO: string; iIdEmpresa: integer;
  sDataRef: string; bBeneficioTemporario: boolean; oInput,
  oResult: OleVariant): OleVariant;
var
  Regra : TCtrlRegra;

  cdsTiposTransfPlano,
  cdsConfigTransfPlano,
  cdsInput,
  cdsInfBanco,
  cdsParticipanteOrigem,
  cdsDataSetIn,
  cdsResult :  TCMClientDataSet;

  sSQLInput, sValorItem : string;
  iAnos, iMeses : integer;

  i : integer;

  sItem, sOp : string;

begin

  Regra := TCtrlRegra.Create;

  cdsTiposTransfPlano   := TCMClientDataSet.Create(nil);
  cdsConfigTransfPlano  := TCMClientDataSet.Create(nil);
  cdsInfBanco           := TCMClientDataSet.Create(nil);
  cdsDataSetIn          := TCMClientDataSet.Create(nil);
  cdsResult             := TCMClientDataSet.Create(nil);
  cdsInput              := TCMClientDataSet.Create(nil);

  try

    try

      Regra.InitializeAs( Self );
      Regra.IdEmpresa := iIdEmpresa;
      Regra.TipoCliente := tcFundacao;

      cdsInfBanco.Data           := oInput;
      cdsResult.Data             := oResult;

      cdsInput.Data := SelecionaInput(  iIdEventoGerador, sFLGINTERNO, 2 );

      sSQLInput := '';

      //Dados vindos da interface
      cdsInfBanco.First;
      while not cdsInfBanco.Eof do
      begin
        if trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) <> '' then
          sSQLInput := sSQLInput +
           '''' + OraNumero( cdsInfBanco.FieldByName('VALOR').AsString ) + ''' as ' +
           Trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) + ', ';
        cdsInfBanco.Next;
      end;
      cdsInfBanco.Close;


      //Dados carregados localmente
      cdsInput.First;
      while not cdsInput.Eof do
      begin
        if trim( cdsInput.FieldByName('NOMEPARAREGRA').AsString ) <> '' then
          sSQLInput := sSQLInput +
           '''' + OraNumero( cdsInput.FieldByName('VALORDEFAULT').AsString ) + ''' as ' +
           Trim( cdsInput.FieldByName('NOMEPARAREGRA').AsString ) + ', ';

        cdsInput.Next;
      end;
      cdsInput.Close;


      cdsTiposTransfPlano.Data  := TiposTransfPlano( iIdEventoGerador, 'B' );

      if cdsTiposTransfPlano.IsEmpty then Exit;

      cdsTiposTransfPlano.First;
      while not cdsTiposTransfPlano.Eof do
      begin
        // Verificar se opcao é permitida para situação correspondente
        if   ( cdsTiposTransfPlano.FieldByName('FLGATIVO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AT' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'MA' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTPARC').AsInteger = 0 )
         and ( sFLGINTERNO = 'MP' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGASSISTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AS' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGBENEFICIARIO').AsInteger = 0 )
         and ( sFLGINTERNO = 'FL' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        sValorItem := '';
        cdsDataSetIn.Close;

        cdsDataSetIn.Data := DatasetResultTransfPlano( iIdEventoGerador,
                                                       iIdPessJur,
                                                       iIdPlanoPrev,
                                                       iIdPessoa,
                                                       iSeqProposta,
                                                       -1,
                                                       sSQLInput,
                                                       sDataRef,
                                                       '1' );

        Regra.CopiaData( cdsDataSetIn.Data );
        Regra.RuleNumber := cdsTiposTransfPlano.FieldByName('IDREGRABASE').AsString;

        Regra.Execute;
        sValorItem := Regra.Result;


        //Idade em anos e meses
        if cdsTiposTransfPlano.FieldByName('TIPODADO').AsString = 'I' then
        begin
          iAnos      := Trunc( StrToInt( sValorItem ) / 12 );
          iMeses     := StrToInt( sValorItem ) - ( iAnos * 12 );
          sValorItem := IntToStr( iAnos ) + ' anos e ' + IntToStr( iMeses )+' meses';
        end
        else
          if cdsTiposTransfPlano.FieldByName('TIPODADO').AsString = 'N' then
            sValorItem := FormatFloat( '#,##0.00', StrToFloat( OraNumeroInv( sValorItem ) ) );


        cdsResult.Insert;
        cdsResult.FieldByName('ITEM').AsString         := 'Dados para Cálculos';
        cdsResult.FieldByName('IDTIPOTRANSF').AsString := '';
        cdsResult.FieldByName('IDCONFIG').AsString     := '';
        cdsResult.FieldByName('FLGTIPO').AsString      := cdsTiposTransfPlano.FieldByName('FLGTIPO').AsString;
        cdsResult.FieldByName('NOME').AsString         := cdsTiposTransfPlano.FieldByName('NOME').AsString;
        cdsResult.FieldByName('VALOR').AsString        := sValorItem;
        cdsResult.Post;

        cdsTiposTransfPlano.Next;
      end;
      cdsTiposTransfPlano.Close;


      
      cdsConfigTransfPlano.Data := ConfigTransfPlano( iIdEventoGerador );

      i := 0;
      cdsTiposTransfPlano.Data  := TiposTransfPlano( iIdEventoGerador, 'O' );
      cdsTiposTransfPlano.First;
      while not cdsTiposTransfPlano.Eof do
      begin
        sItem := cdsTiposTransfPlano.FieldByName('NOME').AsString;      

        // Verificar se opcao é permitida para situação correspondente
        if   ( cdsTiposTransfPlano.FieldByName('FLGATIVO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AT' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'MA' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTPARC').AsInteger = 0 )
         and ( sFLGINTERNO = 'MP' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGASSISTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AS' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGBENEFICIARIO').AsInteger = 0 )
         and ( sFLGINTERNO = 'FL' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        Inc( i );
        cdsConfigTransfPlano.First;
        while not cdsConfigTransfPlano.Eof do
        begin

          if  ( cdsConfigTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger <>
                cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger ) then
          begin
            cdsConfigTransfPlano.Next;
            Continue;
          end;

          sValorItem := '';

          if ( cdsConfigTransfPlano.FieldByName('IDREGRA').AsInteger <= 0 ) then
            sValorItem := '0'
          else
          begin
            cdsDataSetIn.Close;

            cdsDataSetIn.Data := DatasetResultTransfPlano( iIdEventoGerador,
                                                           iIdPessJur,
                                                           iIdPlanoPrev,
                                                           iIdPessoa,
                                                           iSeqProposta,
                                                           cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger,
                                                           sSQLInput,
                                                           sDataRef,
                                                           IntToStr( i ) );

            Regra.CopiaData( cdsDataSetIn.Data );
            Regra.RuleNumber := cdsConfigTransfPlano.FieldByName('IDREGRA').AsString;

            Regra.Execute;
            sValorItem := Regra.Result;


          end;

          //Idade em anos e meses
          if cdsConfigTransfPlano.FieldByName('TIPODADO').AsString = 'I' then
          begin
            iAnos      := Trunc( StrToInt( sValorItem ) / 12 );
            iMeses     := StrToInt( sValorItem ) - ( iAnos * 12 );
            sValorItem := IntToStr( iAnos ) + ' anos e ' + IntToStr( iMeses )+' meses';
          end
          else
            if cdsConfigTransfPlano.FieldByName('TIPODADO').AsString = 'N' then
              sValorItem := FormatFloat( '#,##0.00', StrToFloat( OraNumeroInv( sValorItem ) ) );


          cdsResult.Insert;
          cdsResult.FieldByName('ITEM').AsString         := sItem;
          cdsResult.FieldByName('IDTIPOTRANSF').AsString := cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsString;
          cdsResult.FieldByName('IDCONFIG').AsString     := cdsConfigTransfPlano.FieldByName('IDCONFIG').AsString;
          cdsResult.FieldByName('FLGTIPO').AsString      := cdsTiposTransfPlano.FieldByName('FLGTIPO').AsString;
          cdsResult.FieldByName('NOME').AsString         := cdsConfigTransfPlano.FieldByName('NOME').AsString;
          cdsResult.FieldByName('VALOR').AsString        := sValorItem;
          cdsResult.Post;

          cdsConfigTransfPlano.Next;
        end;

        cdsTiposTransfPlano.Next;
      end;

      Result := cdsResult.Data;

    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        Rollback;
        raise;
      end;
    end;

  finally
    if Regra <> nil then FreeAndNil( Regra );
    cdsTiposTransfPlano.Free;
    cdsConfigTransfPlano.Free;
    cdsInfBanco.Free;
    cdsDataSetIn.Free;
    cdsResult.Free;
    cdsInput.Free;
  end;

end;


function TCtrlWebTransfPlano.GeraCamposOpcoes( iIdEmpresa,
                                               iIdEventoGerador : integer;
                                               sFlgInterno,
                                               sFlgBenefTemp : string;
                                               iIdPessJur,
                                               iIdPlanoPrevAtual,
                                               iIdPessoa,
                                               iSeqProposta : integer;
                                               dDataRef : string;
                                               sListaCampos : String;
                                               oInput : OleVariant ) : OleVariant;
var
  Regra : TCtrlRegra;

  cdsInputTransfPlano,
  cdsInputBanco,
  cdsDataSetIn  : TCmClientDataSet;

  Lista : TStringList;

  sSQLInput, sValorItem : string;
  iAnos, iMeses : integer;
begin

  Regra := TCtrlRegra.Create;

  Lista := TStringList.Create;

  cdsInputTransfPlano := TCmClientDataSet.Create( nil );
  cdsDataSetIn        := TCmClientDataSet.Create( nil );
  cdsInputBanco       := TCmClientDataSet.Create( nil );
  try

    cdsInputBanco.Data := SelecionaInput( iIdEventoGerador,
                                          sFlgInterno,
                                          1 );

    if not cdsInputBanco.IsEmpty then
    begin
      cdsInputBanco.First;

      cdsInputTransfPlano.Data := oInput;
      while not cdsInputBanco.Eof do
      begin
        cdsInputTransfPlano.Insert;
        cdsInputTransfPlano.FieldByName('IDEVENTOGERADOR').AsString   := cdsInputBanco.FieldByName('IDEVENTOGERADOR').AsString;
        cdsInputTransfPlano.FieldByName('IDINPUT').AsString           := cdsInputBanco.FieldByName('IDINPUT').AsString;
        cdsInputTransfPlano.FieldByName('DESCRICAO').AsString         := cdsInputBanco.FieldByName('DESCRICAO').AsString;
        cdsInputTransfPlano.FieldByName('IDREGRA').AsString           := cdsInputBanco.FieldByName('IDREGRA').AsString;
        cdsInputTransfPlano.FieldByName('FLGTIPO').AsString           := cdsInputBanco.FieldByName('FLGTIPO').AsString;
        cdsInputTransfPlano.FieldByName('TABELA').AsString            := cdsInputBanco.FieldByName('TABELA').AsString;
        cdsInputTransfPlano.FieldByName('CAMPO').AsString             := cdsInputBanco.FieldByName('CAMPO').AsString;
        cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString     := cdsInputBanco.FieldByName('NOMEPARAREGRA').AsString;
        cdsInputTransfPlano.FieldByName('FLGATIVO').AsString          := cdsInputBanco.FieldByName('FLGATIVO').AsString;
        cdsInputTransfPlano.FieldByName('FLGMANTIDO').AsString        := cdsInputBanco.FieldByName('FLGMANTIDO').AsString;
        cdsInputTransfPlano.FieldByName('FLGMANTPARC').AsString       := cdsInputBanco.FieldByName('FLGMANTPARC').AsString;
        cdsInputTransfPlano.FieldByName('FLGASSISTIDO').AsString      := cdsInputBanco.FieldByName('FLGASSISTIDO').AsString;
        cdsInputTransfPlano.FieldByName('FLGBENEFICIARIO').AsString   := cdsInputBanco.FieldByName('FLGBENEFICIARIO').AsString;
        cdsInputTransfPlano.FieldByName('FLGPODEALTERAR').AsString    := cdsInputBanco.FieldByName('FLGPODEALTERAR').AsString;
        cdsInputTransfPlano.FieldByName('ORDEM').AsString             := cdsInputBanco.FieldByName('ORDEM').AsString;
        cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString      := cdsInputBanco.FieldByName('VALORDEFAULT').AsString;
        cdsInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString     := cdsInputBanco.FieldByName('IDREGRAVALIDA').AsString;
        cdsInputTransfPlano.FieldByName('OBSERVACAO').AsString        := cdsInputBanco.FieldByName('OBSERVACAO').AsString;
        cdsInputTransfPlano.FieldByName('IDREGRAVLRDEFAULT').AsString := cdsInputBanco.FieldByName('IDREGRAVLRDEFAULT').AsString;
        cdsInputTransfPlano.FieldByName('TIPODADO').AsString          := cdsInputBanco.FieldByName('TIPODADO').AsString;
        cdsInputTransfPlano.FieldByName('VALOR').AsString             := cdsInputBanco.FieldByName('VALOR').AsString;
        cdsInputTransfPlano.Post;

        cdsInputBanco.Next;
      end;
    end;
    cdsInputBanco.Close;

    Regra.InitializeAs( Self );
    Regra.IdEmpresa := iIdEmpresa;
    Regra.TipoCliente := tcFundacao;

    Lista.Text := sListaCampos;
    sSQLInput := '';

    cdsInputTransfPlano.First;
    while not cdsInputTransfPlano.Eof do
    begin

      sValorItem := '';

      if ( cdsInputTransfPlano.FieldByName('FLGTIPO').AsString = 'I' ) then
      begin
        if cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString <> '' then
        begin
          if cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString = 'HOJE' then
            sValorItem := DateToStr( date )
          else
            sValorItem := cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString;
        end;
      end;


      if ( cdsInputTransfPlano.FieldByName('FLGTIPO').AsString = 'R' ) then
      begin



        cdsDataSetIn.Close;
        cdsDataSetIn.Data := DatasetCamposTransfPlano( iIdEventoGerador,
                                                       iIdPessJur,
                                                       iIdPlanoPrevAtual,
                                                       iIdPessoa,
                                                       iSeqProposta,
                                                       sSQLInput,
                                                       dDATAREF );
        Regra.CopiaData( cdsDataSetIn.Data );
        Regra.RuleNumber := cdsInputTransfPlano.FieldByName('IDREGRA').AsString;
        Regra.Execute;
        sValorItem := Regra.Result;
      end;


      if cdsInputTransfPlano.FieldByName('FLGTIPO').AsString = 'C' then
      begin
        if ( UpperCase( cdsInputTransfPlano.FieldByName('TABELA').AsString ) = 'PESSOAFISICA'   ) or
           ( UpperCase( cdsInputTransfPlano.FieldByName('TABELA').AsString ) = 'ELEGPATRO'      ) or
           ( UpperCase( cdsInputTransfPlano.FieldByName('TABELA').AsString ) = 'PARTPREVPLAN'   ) or
           ( UpperCase( cdsInputTransfPlano.FieldByName('TABELA').AsString ) = 'SIMULAMIGRACAO' ) then
          sValorItem := Lista.Values[ 'ed' + cdsInputTransfPlano.FieldByName('CAMPO').AsString ];
      end;

      if ( ( sFlgInterno = 'AS' ) or ( sFlgInterno = 'FL' ) )  and
         ( UpperCase( cdsInputTransfPlano.FieldByName('TABELA').AsString ) = 'BENEFBFCIARIO' ) then
      begin
        sValorItem := Lista.Values[ 'ed' + cdsInputTransfPlano.FieldByName('CAMPO').AsString + 'Assist' ];
      end;


      if   ( cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString <> '')
       and ( trim( sValorItem ) <> '' ) then
        sSQLInput := sSQLInput + '''' + OraNumero( trim( sValorItem ) ) + ''' as '+
        cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString + ', ';

      if cdsInputTransfPlano.FieldByName('TIPODADO').AsString = 'I' then
      begin
        iAnos      := Trunc( StrToInt( sValorItem ) / 12 );
        iMeses     := StrToInt( sValorItem ) - ( iAnos * 12 );
        sValorItem := IntToStr( iAnos ) + ' anos e ' + IntToStr( iMeses )+' meses';
      end
      else
        if cdsInputTransfPlano.FieldByName('TIPODADO').AsString = 'N' then
          sValorItem := FormatFloat('#,##0.00', StrToFloat( OraNumeroInv( sValorItem ) ) );

      cdsInputTransfPlano.Edit;
      cdsInputTransfPlano.FieldByName('VALOR').AsString := sValorItem;
      cdsInputTransfPlano.Post;

      cdsInputTransfPlano.Next;
    end;

    Result := cdsInputTransfPlano.Data;
    cdsInputTransfPlano.Close;

  finally
    cdsInputTransfPlano.Free;
    cdsDataSetIn.Free;
    cdsInputBanco.Free;
    Regra.Free;
    Lista.Free;
  end;
end;



function TCtrlWebTransfPlano.DatasetCamposTransfPlano( iIdEventoGerador, iIdPessJur, iIdPlanoPrev,
                                                       iIdPessoa, iSeqProposta : integer;
                                                       sSQLInput, sDataRef : string ) : OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select ' + sSQLInput                                                                +
   '        s.IDPESSJUR,                                                               ' +
   '        s.IDPLANOPREV,                                                             ' +
   '        s.IDPESSOA,                                                                ' +
   '        s.SEQPROPOSTA,                                                             ' +
   '        s.MATRICULA,                                                               ' +
   '        decode( s.SITUACAO, ''FL'', ''AS'', s.SITUACAO ) as SITUACAO,              ' +
   '        s.DATANASC,                                                                ' +
   '        s.DATAMORTE,                                                               ' +
   '        s.ESTADOCIVIL as ESTCIVIL,                                                 ' +
   '        s.SEXO,                                                                    ' +
   '        s.DATAADMISSAO,                                                            ' +
   '        s.DATADEMISSAO,                                                            ' +
   '        s.COTAPENSAO,                                                              ' +
   '        s.DATANASCVIT,                                                             ' +
   '        s.DATANASCTEMP,                                                            ' +
   '        s.NUMDEPEN,                                                                ' +
   '        s.NUMDEPENVIT,                                                             ' +
   '        s.NUMDEPENTEMP,                                                            ' +
   '        el.TEMPONAOCREDITADO,                                                      ' +
   '        el.TEMPOSERVANTERIOR,                                                      ' +
   '        el.TEMPOSERVANTREAL,                                                       ' +
   '        el.TEMPOSERVCALC,                                                          ' +
   '        el.TEMPOSERVPRIVANT,                                                       ' +
   '        el.TEMPOSERVPUBLANT,                                                       ' +
   '        el.TEMPOSERVTOTAL,                                                         ' +
   '        el.TEMPOSERVTOTDIA,                                                        ' +
   '        el.TEMPOSERVTOTMES,                                                        ' +
   '        el.TEMPOSITESPECIAL,                                                       ' +
   '        s.SALPARTICIPACAO as VALORPROVENTO,                                        ' +
   '        s.SALPARTICIPACAO,                                                         ' +
   '        s.REMUNERACAO,                                                             ' +
   '        s.CONTRIBUICAO,                                                            ' +
   '        s.TEMPOINSS,                                                               ' +
   '        s.JOIA,                                                                    ' +
   '        s.PRAZOJOIAFALTA,                                                          ' +
   '        s.PRAZOJOIAPAGO,                                                           ' +
   '        s.RPTRIBUTAVEL,                                                            ' +
   '        s.RPNAOTRIBUTAVEL,                                                         ' +
   '        s.SRB,                                                                     ' +
   '        s.FATORPREVIDENC,                                                          ' +
   '        s.TEMPOMINCONTRIB,                                                         ' +
   '        s.DATAINICIOFUND,                                                          ' +
   '        s.VALORATUAL,                                                              ' +
   '        s.VLRINFINSS,                                                              ' +
   '        s.IDBENEFICIO,                                                             ' +
   '        s.VALORABONO,                                                              ' +
   '        s.DATAULTSIMULA,                                                           ' +
   '        s.IDADEAPOS,                                                               ' +
   '        s.OPCAO,                                                                   ' +
   '        s.CAMPOOP1,                                                                ' +
   '        s.CAMPOOP2,                                                                ' +
   '        s.CAMPOOP3,                                                                ' +
   '        s.CAMPOOP4,                                                                ' +
   '        s.CAMPOOP5,                                                                ' +
   '        ''' + sDataRef + ''' AS DATAREF                                            ' +
   ' from   ELEGPATRO          el,                                                     ' +
   '        SIMULAMIGRACAO     s,                                                      ' +
   '        EVENTOGERADOR      eg                                                      ' +
   ' where  eg.IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador )                        +
   '   and  s.IDPESSJUR        = ' + IntToStr( iIdPessJur       )                        +
   '   and  s.IDPLANOPREV      = ' + IntToStr( iIdPlanoPrev     )                        +
   '   and  s.IDPESSOA         = ' + IntToStr( iIdPessoa        )                        +
   '   and  s.SEQPROPOSTA      = ' + IntToStr( iSeqProposta     )                        +
   '   and  s.ANOMESREF        = to_char( nvl( eg.DATADADOS, sysdate ), ''YYYY/MM'' )  ' +
   '   and  el.IDPESSJUR       = s.IDPESSJUR                                           ' +
   '   and  el.IDPESSOA        = s.IDPESSOA                                            ' ;

  Result := GetDataPacket( sSQL );
end;


function TCtrlWebTransfPlano.GeraEstimativas(iIdPessJur, iIdPlanoPrev,
  iIdPessoa, iSeqProposta, iIdEventoGerador : integer; sOpcao, sFLGINTERNO: string;
  iIdEmpresa: integer; sDataRef: string; bBeneficioTemporario: boolean;
  oInput, oResult: OleVariant): OleVariant;
var
  Regra : TCtrlRegra;

  cdsTiposTransfPlano,
  cdsConfigTransfPlano,
  cdsInfBanco,
  cdsParticipanteOrigem,
  cdsDataSetIn,
  cdsResult :  TCMClientDataSet;

  sSQLInput, sValorItem : string;
  iAnos, iMeses : integer;

  sItem : string;

begin

  Regra := TCtrlRegra.Create;

  cdsTiposTransfPlano   := TCMClientDataSet.Create(nil);
  cdsConfigTransfPlano  := TCMClientDataSet.Create(nil);
  cdsInfBanco           := TCMClientDataSet.Create(nil);
  cdsDataSetIn          := TCMClientDataSet.Create(nil);
  cdsResult             := TCMClientDataSet.Create(nil);

  try

    try

      Regra.InitializeAs( Self );
      Regra.IdEmpresa := iIdEmpresa;
      Regra.TipoCliente := tcFundacao;

      cdsInfBanco.Data           := oInput;
      cdsResult.Data             := oResult;

      sSQLInput := '';

      //Dados vindos da interface
      cdsInfBanco.First;
      while not cdsInfBanco.Eof do
      begin
        if trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) <> '' then
          sSQLInput := sSQLInput +
           '''' + OraNumero( cdsInfBanco.FieldByName('VALOR').AsString ) + ''' as ' +
           Trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) + ', ';
        cdsInfBanco.Next;
      end;
      cdsInfBanco.Close;

      cdsTiposTransfPlano.Data  := TiposTransfPlano( iIdEventoGerador, 'E' );

      if cdsTiposTransfPlano.IsEmpty then Exit;

      cdsConfigTransfPlano.Data := ConfigTransfPlano( iIdEventoGerador );

      cdsTiposTransfPlano.First;
      while not cdsTiposTransfPlano.Eof do
      begin
        sItem := cdsTiposTransfPlano.FieldByName('NOME').AsString;

        // Verificar se opcao é permitida para situação correspondente
        if   ( cdsTiposTransfPlano.FieldByName('FLGATIVO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AT' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'MA' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGMANTPARC').AsInteger = 0 )
         and ( sFLGINTERNO = 'MP' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGASSISTIDO').AsInteger = 0 )
         and ( sFLGINTERNO = 'AS' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        if   ( cdsTiposTransfPlano.FieldByName('FLGBENEFICIARIO').AsInteger = 0 )
         and ( sFLGINTERNO = 'FL' ) then
        begin
          cdsTiposTransfPlano.Next;
          Continue;
        end;

        cdsConfigTransfPlano.First;
        while not cdsConfigTransfPlano.Eof do
        begin

          if  ( cdsConfigTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger <>
                cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger ) then
          begin
            cdsConfigTransfPlano.Next;
            Continue;
          end;

          sValorItem := '';

          if ( cdsConfigTransfPlano.FieldByName('IDREGRA').AsInteger <= 0 ) then
            sValorItem := '0'
          else
          begin
            cdsDataSetIn.Close;

            cdsDataSetIn.Data := DatasetResultTransfPlano( iIdEventoGerador,
                                                           iIdPessJur,
                                                           iIdPlanoPrev,
                                                           iIdPessoa,
                                                           iSeqProposta,
                                                           cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsInteger,
                                                           sSQLInput,
                                                           sDataRef,
                                                           sOpcao );

            Regra.CopiaData( cdsDataSetIn.Data );
            Regra.RuleNumber := cdsConfigTransfPlano.FieldByName('IDREGRA').AsString;

            Regra.Execute;
            sValorItem := Regra.Result;


          end;

          //Idade em anos e meses
          if cdsConfigTransfPlano.FieldByName('TIPODADO').AsString = 'I' then
          begin
            iAnos      := Trunc( StrToInt( sValorItem ) / 12 );
            iMeses     := StrToInt( sValorItem ) - ( iAnos * 12 );
            sValorItem := IntToStr( iAnos ) + ' anos e ' + IntToStr( iMeses )+' meses';
          end
          else
            if cdsConfigTransfPlano.FieldByName('TIPODADO').AsString = 'N' then
              sValorItem := FormatFloat( '#,##0.00', StrToFloat( OraNumeroInv( sValorItem ) ) );


          cdsResult.Insert;
          cdsResult.FieldByName('ITEM').AsString         := sItem;
          cdsResult.FieldByName('IDTIPOTRANSF').AsString := cdsTiposTransfPlano.FieldByName('IDTIPOTRANSF').AsString;
          cdsResult.FieldByName('IDCONFIG').AsString     := cdsConfigTransfPlano.FieldByName('IDCONFIG').AsString;
          cdsResult.FieldByName('FLGTIPO').AsString      := cdsTiposTransfPlano.FieldByName('FLGTIPO').AsString;
          cdsResult.FieldByName('NOME').AsString         := cdsConfigTransfPlano.FieldByName('NOME').AsString;
          cdsResult.FieldByName('VALOR').AsString        := sValorItem;
          cdsResult.Post;

          cdsConfigTransfPlano.Next;
        end;

        cdsTiposTransfPlano.Next;
      end;

      Result := cdsResult.Data;

    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        Rollback;
        raise;
      end;
    end;

  finally
    if Regra <> nil then FreeAndNil( Regra );
    cdsTiposTransfPlano.Free;
    cdsConfigTransfPlano.Free;
    cdsInfBanco.Free;
    cdsDataSetIn.Free;
    cdsResult.Free;
  end;

end;

function TCtrlWebTransfPlano.ValidaConteudo(iRegra: integer;
  sValor: string; iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta,
  iIdEventoGerador, iIdEmpresa: integer; sOpcao, sDataRef: string; oInfBanco : OleVariant ): boolean;
var
  Regra : TCtrlRegra;
  cdsInfBanco : TCMClientDataSet;
  sSQLInput : string;
begin

  Regra       := TCtrlRegra.Create;
  cdsInfBanco := TCMClientDataSet.Create( nil );
  try

    sSQLInput := '';
    cdsInfBanco.Data := oInfBanco;
    while not cdsInfBanco.Eof do
    begin
      if   ( cdsInfBanco.FieldByName('FLGTIPO').AsString <> 'I' )
       and ( trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) <> '' ) then
      begin
        sSQLInput := sSQLInput +
         '''' + OraNumero( cdsInfBanco.FieldByName('VALOR').AsString ) + ''' as ' +
         Trim( cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString ) + ', ';
      end;

      cdsInfBanco.Next;
    end;

    Regra.InitializeAs( Self );
    Regra.IdEmpresa := iIdEmpresa;
    Regra.TipoCliente := tcFundacao;

    Regra.GeraDataSet(
     ' select ' + sSQLInput                                                               +
     '        ''' + sValor + ''' as VALOR,                                              ' +
     '        ' + sOpcao   + '   as OPCAO,                                              ' +
     '        el.TEMPONAOCREDITADO,                                                     ' +
     '        el.TEMPOSERVANTERIOR,                                                     ' +
     '        el.TEMPOSERVANTREAL,                                                      ' +
     '        el.TEMPOSERVCALC,                                                         ' +
     '        el.TEMPOSERVPRIVANT,                                                      ' +
     '        el.TEMPOSERVPUBLANT,                                                      ' +
     '        el.TEMPOSERVTOTAL,                                                        ' +
     '        el.TEMPOSERVTOTDIA,                                                       ' +
     '        el.TEMPOSERVTOTMES,                                                       ' +
     '        el.TEMPOSITESPECIAL,                                                      ' +
     '        s.SALPARTICIPACAO as VALORPROVENTO,                                       ' +
     '        s.IDPESSJUR,                                                              ' +
     '        s.IDPLANOPREV,                                                            ' +
     '        s.IDPESSOA,                                                               ' +
     '        s.SEQPROPOSTA,                                                            ' +
     '        s.MATRICULA,                                                              ' +
     '        s.IDADEAPOS,                                                              ' +
     '        decode( s.SITUACAO, ''FL'', ''AS'', s.SITUACAO ) as SITUACAO,             ' +
     '        s.DATANASC,                                                               ' +
     '        s.DATAMORTE,                                                              ' +
     '        s.ESTADOCIVIL as ESTCIVIL,                                                ' +
     '        s.SEXO,                                                                   ' +
     '        s.DATAADMISSAO,                                                           ' +
     '        s.DATADEMISSAO,                                                           ' +
     '        s.SALPARTICIPACAO,                                                        ' +
     '        s.REMUNERACAO,                                                            ' +
     '        s.CONTRIBUICAO,                                                           ' +
     '        s.TEMPOINSS,                                                              ' +
     '        s.JOIA,                                                                   ' +
     '        s.PRAZOJOIAFALTA,                                                         ' +
     '        s.PRAZOJOIAPAGO,                                                          ' +
     '        s.RPTRIBUTAVEL,                                                           ' +
     '        s.RPNAOTRIBUTAVEL,                                                        ' +
     '        s.SRB,                                                                    ' +
     '        s.FATORPREVIDENC,                                                         ' +
     '        s.TEMPOMINCONTRIB,                                                        ' +
     '        s.PROPORCAO,                                                              ' +
     '        s.COTAPENSAO,                                                             ' +
     '        s.DATANASCVIT,                                                            ' +
     '        s.DATANASCTEMP,                                                           ' +
     '        s.NUMDEPEN,                                                               ' +
     '        s.NUMDEPENTEMP,                                                           ' +
     '        s.NUMDEPENVIT,                                                            ' +
     '        s.DATAINICIOFUND,                                                         ' +
     '        s.VALORATUAL,                                                             ' +
     '        s.VLRINFINSS,                                                             ' +
     '        s.IDBENEFICIO,                                                            ' +
     '        s.VALORABONO,                                                             ' +
     '        s.DATAULTSIMULA,                                                          ' +
     '        s.CAMPOOP1,                                                               ' +
     '        s.CAMPOOP2,                                                               ' +
     '        s.CAMPOOP3,                                                               ' +
     '        s.CAMPOOP4,                                                               ' +
     '        s.CAMPOOP5,                                                               ' +
     '        ''' + sDataRef + ''' as DATAREF                                           ' +
     ' from   ELEGPATRO      el,                                                        ' +
     '        SIMULAMIGRACAO s,                                                         ' +
     '        EVENTOGERADOR  eg                                                         ' +
     ' where  eg.IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador )                       +
     '   and  s.IDPESSJUR        = ' + IntToStr( iIdPessJur       )                       +
     '   and  s.IDPLANOPREV      = ' + IntToStr( iIdPlanoPrev     )                       +
     '   and  s.IDPESSOA         = ' + IntToStr( iIdPessoa        )                       +
     '   and  s.SEQPROPOSTA      = ' + IntToStr( iSeqProposta     )                       +
     '   and  s.ANOMESREF        = to_char( nvl( eg.DATADADOS, sysdate ), ''YYYY/MM'' ) ' +
     '   and  el.IDPESSJUR       = s.IDPESSJUR                                          ' +
     '   and  el.IDPESSOA        = s.IDPESSOA                                           ' );

    Regra.RuleNumber := IntToStr( iRegra );
    Regra.Execute;

    Result := ( UpperCase( Trim( Regra.Result ) ) <> 'FALSE' );

  finally
    Regra.Free;
    cdsInfBanco.Free;
  end;

end;


function TCtrlWebTransfPlano.GeraCamposEstimativas(  iIdEmpresa,
                                                     iIdEventoGerador : integer;
                                                     sFlgInterno,
                                                     sFlgBenefTemp : string;
                                                     iIdPessJur,
                                                     iIdPlanoPrevAtual,
                                                     iIdPessoa,
                                                     iSeqProposta : integer;
                                                     dDataRef : string;
                                                     sListaCampos : String;
                                                     oInput : OleVariant ) : OleVariant;
var
  Regra : TCtrlRegra;

  cdsInputTransfPlano,
  cdsInfBanco,
  cdsInputBanco,
  cdsDataSetIn  : TCmClientDataSet;

  Lista : TStringList;

  sSQLInput, sValorItem : string;
  iAnos, iMeses : integer;
begin

  Regra := TCtrlRegra.Create;

  Lista := TStringList.Create;

  cdsInputTransfPlano := TCmClientDataSet.Create( nil );
  cdsDataSetIn        := TCmClientDataSet.Create( nil );
  cdsInfBanco         := TCmClientDataSet.Create( nil );
  cdsInputBanco       := TCmClientDataSet.Create( nil );
  try

    cdsInputBanco.Data := SelecionaInput( iIdEventoGerador, sFlgInterno, 2 );

    if not cdsInputBanco.IsEmpty then
    begin
      cdsInputBanco.First;

      cdsInputTransfPlano.Data := oInput;
      while not cdsInputBanco.Eof do
      begin
        cdsInputTransfPlano.Insert;
        cdsInputTransfPlano.FieldByName('IDEVENTOGERADOR').AsString   := cdsInputBanco.FieldByName('IDEVENTOGERADOR').AsString;
        cdsInputTransfPlano.FieldByName('IDINPUT').AsString           := cdsInputBanco.FieldByName('IDINPUT').AsString;
        cdsInputTransfPlano.FieldByName('DESCRICAO').AsString         := cdsInputBanco.FieldByName('DESCRICAO').AsString;
        cdsInputTransfPlano.FieldByName('IDREGRA').AsString           := cdsInputBanco.FieldByName('IDREGRA').AsString;
        cdsInputTransfPlano.FieldByName('FLGTIPO').AsString           := cdsInputBanco.FieldByName('FLGTIPO').AsString;
        cdsInputTransfPlano.FieldByName('TABELA').AsString            := cdsInputBanco.FieldByName('TABELA').AsString;
        cdsInputTransfPlano.FieldByName('CAMPO').AsString             := cdsInputBanco.FieldByName('CAMPO').AsString;
        cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString     := cdsInputBanco.FieldByName('NOMEPARAREGRA').AsString;
        cdsInputTransfPlano.FieldByName('FLGATIVO').AsString          := cdsInputBanco.FieldByName('FLGATIVO').AsString;
        cdsInputTransfPlano.FieldByName('FLGMANTIDO').AsString        := cdsInputBanco.FieldByName('FLGMANTIDO').AsString;
        cdsInputTransfPlano.FieldByName('FLGMANTPARC').AsString       := cdsInputBanco.FieldByName('FLGMANTPARC').AsString;
        cdsInputTransfPlano.FieldByName('FLGASSISTIDO').AsString      := cdsInputBanco.FieldByName('FLGASSISTIDO').AsString;
        cdsInputTransfPlano.FieldByName('FLGBENEFICIARIO').AsString   := cdsInputBanco.FieldByName('FLGBENEFICIARIO').AsString;
        cdsInputTransfPlano.FieldByName('FLGPODEALTERAR').AsString    := cdsInputBanco.FieldByName('FLGPODEALTERAR').AsString;
        cdsInputTransfPlano.FieldByName('ORDEM').AsString             := cdsInputBanco.FieldByName('ORDEM').AsString;
        cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString      := cdsInputBanco.FieldByName('VALORDEFAULT').AsString;
        cdsInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString     := cdsInputBanco.FieldByName('IDREGRAVALIDA').AsString;
        cdsInputTransfPlano.FieldByName('OBSERVACAO').AsString        := cdsInputBanco.FieldByName('OBSERVACAO').AsString;
        cdsInputTransfPlano.FieldByName('IDREGRAVLRDEFAULT').AsString := cdsInputBanco.FieldByName('IDREGRAVLRDEFAULT').AsString;
        cdsInputTransfPlano.FieldByName('TIPODADO').AsString          := cdsInputBanco.FieldByName('TIPODADO').AsString;        
        cdsInputTransfPlano.FieldByName('VALOR').AsString             := cdsInputBanco.FieldByName('VALOR').AsString;
        cdsInputTransfPlano.Post;

        cdsInputBanco.Next;
      end;
    end;
    cdsInputBanco.Close;


    Regra.InitializeAs( Self );
    Regra.IdEmpresa := iIdEmpresa;
    Regra.TipoCliente := tcFundacao;

    Lista.Text := sListaCampos;
    sSQLInput := '';

    cdsInputTransfPlano.First;
    while not cdsInputTransfPlano.Eof do
    begin
      sValorItem := '';

      if ( cdsInputTransfPlano.FieldByName('FLGTIPO').AsString = 'I' ) then
      begin
        if cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString <> '' then
        begin
          if cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString = 'HOJE' then
            sValorItem := DateToStr( date )
          else
            sValorItem := cdsInputTransfPlano.FieldByName('VALORDEFAULT').AsString;
        end;

        cdsInputTransfPlano.Edit;
        cdsInputTransfPlano.FieldByName('VALOR').AsString := sValorItem;
        cdsInputTransfPlano.Post;

        if   ( cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString <> '')
         and ( trim( sValorItem ) <> '' ) then
          sSQLInput := sSQLInput + '''' + OraNumero( trim( sValorItem ) ) + ''' as '+
          cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString + ', ';
      end;

      cdsInputTransfPlano.Next;
    end;


    cdsInfBanco.Data := SelecionaInput( iIdEventoGerador, sFlgInterno, 1 );
    cdsInfBanco.First;
    while not cdsInfBanco.Eof do
    begin
      if cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString <> '' then
        sSQLInput := sSQLInput + '''' + OraNumero( trim(
         Lista.Values[ 'edt' + cdsInfBanco.FieldByName('IDINPUT').AsString ] ) ) + ''' as '+
         cdsInfBanco.FieldByName('NOMEPARAREGRA').AsString + ', ';

      cdsInfBanco.Next;
    end;
    cdsInfBanco.Close;


    cdsInputTransfPlano.First;
    while not cdsInputTransfPlano.Eof do
    begin

      if cdsInputTransfPlano.FieldByName('IDREGRAVLRDEFAULT').AsString = '' then
      begin
         cdsInputTransfPlano.Next;
         Continue;
      end;

      cdsDataSetIn.Close;

      cdsDataSetIn.Data := DatasetCamposTransfPlano( iIdEventoGerador,
                                                     iIdPessJur,
                                                     iIdPlanoPrevAtual,
                                                     iIdPessoa,
                                                     iSeqProposta,
                                                     sSQLInput,
                                                     dDATAREF );

      Regra.CopiaData( cdsDataSetIn.Data );
      Regra.RuleNumber := cdsInputTransfPlano.FieldByName('IDREGRAVLRDEFAULT').AsString;
      Regra.Execute;
      sValorItem := Regra.Result;

      if   ( cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString <> '')
       and ( trim( sValorItem ) <> '' ) then
        sSQLInput := sSQLInput + '''' + OraNumero( trim( sValorItem ) ) + ''' as '+
        cdsInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString + ', ';


      if cdsInputTransfPlano.FieldByName('TIPODADO').AsString = 'I' then
      begin
        iAnos      := Trunc( StrToInt( sValorItem ) / 12 );
        iMeses     := StrToInt( sValorItem ) - ( iAnos * 12 );
        sValorItem := IntToStr( iAnos ) + ' anos e ' + IntToStr( iMeses )+' meses';
      end
      else
        if cdsInputTransfPlano.FieldByName('TIPODADO').AsString = 'N' then
          sValorItem := FormatFloat('#0.00', StrToFloat( OraNumeroInv( sValorItem ) ) );


      cdsInputTransfPlano.Edit;
      cdsInputTransfPlano.FieldByName('VALOR').AsString := sValorItem;
      cdsInputTransfPlano.Post;

      cdsInputTransfPlano.Next;
    end;

    Result := cdsInputTransfPlano.Data;
    cdsInputTransfPlano.Close;

  finally
    cdsInputTransfPlano.Free;
    cdsInfBanco.Free;
    cdsDataSetIn.Free;
    cdsInputBanco.Free;
    Regra.Free;
    Lista.Free;
  end;
end;



function TCtrlWebTransfPlano.GeraObservacoes( iIdEventoGerador,
                                              iTipoObs : integer;
                                              sFlgInterno : string ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select to_char( rownum ) || ''.) '' || NOME as OBSERVACAO ' +
   '   from TIPOSTRANSFPLANO                                   ' +
   '  where IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador )   +
   '    and TIPOOBS         = ' + IntToStr( iTipoObs         )   +
   '    and FLGTIPO         = ''R''                            ' ;

  if sFlgInterno = 'AT' then
    sSQL := sSQL + ' and FLGATIVO = 1 '
  else
    if sFlgInterno = 'MA' then
      sSQL := sSQL + ' and FLGMANTIDO = 1 '
    else
      if sFlgInterno = 'MP' then
        sSQL := sSQL + ' and FLGMANTPARC = 1 '
      else
        if sFlgInterno = 'FL' then
          sSQL := sSQL + ' and FLGBENEFICIARIO = 1 '
        else
          sSQL := sSQL + ' and FLGASSISTIDO    = 1 ';

  Result := GetDataPacket( sSQL );
end;

function TCtrlWebTransfPlano.ExisteSimulaTransfPlano( iIdEventoGerador, iIdPessoa: integer): boolean;
var
  cdsLocal : TCMClientDataSet;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' select count(*) QTDE        ' +
     ' from   SIMULAMIGRACAO s,    ' +
     '        EVENTOGERADOR  eg    ' +
     ' where  eg.IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador )                       +
     '   and  s.IDPESSOA         = ' + IntToStr( iIdPessoa )                              +
     '   and  s.ANOMESREF        = to_char( nvl( eg.DATADADOS, sysdate ), ''YYYY/MM'' ) ' ) ;

    Result := ( cdsLocal.FieldByName('QTDE').AsInteger >= 1 );

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;      

end;

end.
