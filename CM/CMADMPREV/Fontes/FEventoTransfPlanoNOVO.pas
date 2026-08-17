// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : GravaReservasParticipante
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 19.07.2004
// Pendência   : 17199
// Rotina      : TransfPlano
// Descrição   : Criacao da rotina VerificaMigraPlanoEmprestimo para atualizar
//               campos na tabela de contrato de emprestimo
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 10/12/2003
// Pendência   : 15779
// Rotina      : TransfPlano
// Descrição   : Inclusão de campos na regra de elegibilidade
//------------------------------------------------------------------------------
// Autor       : Ricardo Vigorito
// Data        : 15/10/2003
// Pendência   : 15143  - 15145
// Descrição   : Inclusão da chamada da rotina RODAPADRAOMOVRESERVA
//------------------------------------------------------------------------------
unit FEventoTransfPlanoNOVO;

// Etapas da Migração de Plano
// Etapa 1 : Procurar participante
// Etapa 2 : Informacoes de Entrada ( do Tipo Banco ou Regra )
// Etapa 3 : Opcoes
// Etapa 4 : Informacoes de Entrada ( do Tipo Informado )
// Etapa 5 : Estimativas
// Etapa 6 : Relatorios
// Etapa 7 : Migracao
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, ComCtrls, Db, DBTables, Wwquery,
  wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, ppEndUsr, ppBands, ppCtrls, ppClass, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, FPreview, Pptypes,
  ppStrtch, ppSubRpt, URegra, ppRichTx ;

type
  TfrmEventoTransfPlanoNOVO = class(TfrmOkCancelar)
    pgctrlEtapas: TPageControl;
    tbsEtapa1: TTabSheet;
    tbsEtapa2: TTabSheet;
    MontaSelectPart: TMontaSelect;
    ToolbarSep972: TToolbarSep97;
    bbtnAnterior: TBitBtn;
    qryPlanoDestino: TwwQuery;
    qryInputTransfPlano: TwwQuery;
    qryTiposTransf: TwwQuery;
    Label4: TLabel;
    dbgrdInfBanco: TwwDBGrid;
    dsInputTransfPlano: TwwDataSource;
    updInputTransfPlano: TUpdateSQL;
    tbsEtapa3: TTabSheet;
    lblTituloEtapa2: TLabel;
    lblTituloEtapa3: TLabel;
    Label5: TLabel;
    memOpcoes: TMemo;
    qryConfigTransf: TwwQuery;
    tbsEtapa6: TTabSheet;
    lblTituloEtapa6: TLabel;
    bbtnPrintOpcoes: TBitBtn;
    bbtnPrintTermo: TBitBtn;
    bbtnEfetuaMigracao: TBitBtn;
    bbtnConfirmacaoFinal: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    qryAux: TwwQuery;
    qryAux2: TwwQuery;
    qryGrava: TwwQuery;
    qryDadosNoPlanoOrigem: TwwQuery;
    dsConfigTransf: TwwDataSource;
    updConfigTransf: TUpdateSQL;
    Label12: TLabel;
    edOpcao: TEdit;
    tbsEtapa5: TTabSheet;
    lblTituloEtapa5: TLabel;
    lblEstimativa: TLabel;
    memEstimativas: TMemo;
    qryDadosAssistido: TwwQuery;
    qryRegra: TwwQuery;
    qryInfBanco: TwwQuery;
    dsInfBanco: TwwDataSource;
    updInfBanco: TUpdateSQL;
    tbsEtapa4: TTabSheet;
    lblTituloEtapa4: TLabel;
    Label14: TLabel;
    dbgrdInputTransfPlano: TwwDBGrid;
    qryPreviaMigra: TwwQuery;
    dsPreviaMigra: TwwDataSource;
    updPreviaMigra: TUpdateSQL;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    dtDataREF: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    lblValores: TLabel;
    lblCampoBusca: TLabel;
    edCampoBusca: TEdit;
    edNome: TEdit;
    Label3: TLabel;
    bbtnProcurar: TBitBtn;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    lblPlanoOrigem: TLabel;
    lblInscricaoData: TLabel;
    lblSitPart: TLabel;
    lblBeneficio: TLabel;
    lblFalecido: TLabel;
    lblDataTransacao: TLabel;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    dblkpcmbNovoPlano: TwwDBLookupCombo;
    rdgrpOpPart: TRadioGroup;
    MontaSelectBenef: TMontaSelect;
    tbsConfirmacao: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dtDataTRANSACAO: TCMDateTimePicker;
    Label11: TLabel;
    chkSoBeneficiario: TCheckBox;
    Label13: TLabel;
    dblkpcmbSitPlanoOrigem: TwwDBLookupCombo;
    Label15: TLabel;
    dblkpcmbSitPlanoDestino: TwwDBLookupCombo;
    bbtnEfetivaMigracao: TBitBtn;
    qrySitPlanoOrigem: TwwQuery;
    qrySitPlanoDestino: TwwQuery;
    dblkpcmbLote: TwwDBLookupCombo;
    qryLote: TwwQuery;

    procedure bbtnProcurarClick(Sender: TObject);
    procedure edCampoBuscaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnAnteriorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnEfetuaMigracaoClick(Sender: TObject);
    procedure bbtnConfirmacaoFinalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnPrintOpcoesClick(Sender: TObject);
    procedure dbgrdInputTransfPlanoFieldChanged(Sender: TObject;
      Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure rpDemonstrativoBeforePrint(Sender: TObject);
    procedure dbgrdInputTransfPlanoColExit(Sender: TObject);
    procedure bbtnPrintTermoClick(Sender: TObject);
    procedure rdgrpOpPartClick(Sender: TObject);
    procedure bbtnEfetivaMigracaoClick(Sender: TObject);
    procedure dblkpcmbNovoPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }

    sNumInscDestino : string;
    iEtapaAtiva,
    iIdEventosPrev,
    iIdEventoPrevOrig,
    iIdEventoPrevDest      : longint;
    sUltimaMatricula       : string;
    bCalculouBase,
    bMontandoDefault,
    bBeneficioTemporario   : boolean;
    siPessJur : String;
    sidpessoa : String;


    procedure MontaInformacoesParticipante (piIdPessJur, piIdPlanoPrev, piIdPessoa, piIdTitular, piSeqProposta : longint);
    procedure ExecutaEtapa2;
    procedure ExecutaEtapa4; 
    procedure ExecutaEtapa3ou5 (pcTipo : char);


    function VerificaMigraPlanoEmprestimo ( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa : longint ) : boolean; 
    function GravaEVENTOSPREV : boolean;
    function SuspendeContribuicoes     ( sIdPessJurTransf,
                                         sIdPlanoOrigem,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf     : string;
                                         qryAux,
                                         qryGrava               : TwwQuery) : boolean;

    function GravaReservasParticipante ( sIdPessJurTransf,
                                         sIdPlanoOrigem,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf     : string;
                                         qryaux,
                                         qryaux2,
                                         qrygrava               : TwwQuery): boolean ;

    function TransfPlano( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
                                            

    function RodaRegraSimula (sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
    function RodaRegraValida (sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
    function RodaRegraElegibili (sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;

    procedure InserePreviaMigraPlano ( psCodCampoMigra, psValorItem, psDescricao : string ) ;
  public
    { Public declarations }
  end;

var
  frmEventoTransfPlanoNOVO: TfrmEventoTransfPlanoNOVO;

implementation

uses DBaseDados, DAPrev, UAdmPREV, UDataBase, UMensErro, UEventos, fAguarde,
     UFuncoesUteis, UParticipante, UMovReserva, DRelTransfPlano, USistema,
  FNumInsc, UBeneficio;

{$R *.DFM}

function TfrmEventoTransfPlanoNOVO.RodaRegraSimula(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;
      if StrToInt(sNumRegra) <= 0 then Exit;

      RegraSimula.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;
         DecimalSeparator       := cAux;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            // Verificar se o resultado da regra é um número válido
            try
               StrToFloat(ClienteNumero(RegraSimula.Result))
            except
               MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                      '[VALOR = '+RegraSimula.Result+']','Erro',mtError,[mbOk, mbHelp],0);
               bErro := True;
               piIdCalculo := -1;
            end;
            Result := OraNumero(RegraSimula.Result);
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

function TfrmEventoTransfPlanoNOVO.RodaRegraValida(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;

      RegraSimula.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            // Verificar se o resultado da regra é um valor válido
            if (UpperCase(Trim(RegraSimula.Result)) <> 'FALSE') and
               (UpperCase(Trim(RegraSimula.Result)) <> 'TRUE')
            then begin
               MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                      '[VALOR = '+RegraSimula.Result+']','Erro',mtError,[mbOk, mbHelp],0);
               bErro := True;
               piIdCalculo := -1;
            end;
            Result := RegraSimula.Result;
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

function TfrmEventoTransfPlanoNOVO.RodaRegraElegibili(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;

      RegraSimula.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            Result := 'True';
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.MontaInformacoesParticipante (piIdPessJur, piIdPlanoPrev, piIdPessoa, piIdTitular, piSeqProposta : longint);
var sSQL : string;
    bErro : boolean;
begin
   iEtapaAtiva := -1;
   if qryInputTransfPlano.UpdatesPending then qryInputTransfPlano.CancelUpdates;
   if qryInfBanco.UpdatesPending         then qryInfBanco.CancelUpdates;
   if qryConfigTransf.UpdatesPending     then qryConfigTransf.CancelUpdates;

   qryPlanoDestino.Close;
   qryPlanoDestino.ParamByName('IDPESSJUR').AsInteger := piIdPessJur;
   qryPlanoDestino.Open;
   siPessJur := inttostr(piIdPessJur);
   sidpessoa := IntToStr(piIdPessoa) ;

    memOpcoes.Lines.Clear;
    bbtnConfirmacaoFinal.Visible := False;
    bBeneficioTemporario         := False;
    bCalculouBase                := False;
    bbtnEfetuaMigracao.Enabled   := True;

    if rdgrpOpPart.ItemIndex = 0 then
    begin
       qryaux.close;
       qryaux.sql.text := ' DELETE SIMULAMIGRACAO         '+
                          ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)  +
                          ' AND    IDTITULAR     = '+IntToStr(piIdPessoa)   +
                          ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                          ' AND    ANOMESREF     = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+'''';

       try
          qryaux.ExecSQL;
       except
       end;

       qryaux.close;
       qryaux.sql.text := ' INSERT INTO SIMULAMIGRACAO (IDPESSJUR, IDPLANOPREV, IDPESSOA, IDTITULAR, SEQPROPOSTA, '+
                          ' ANOMESREF, MATRICULA, SITUACAO, NOME, SEXO, ESTADOCIVIL, DATANASC, '+
                          ' DATAADMISSAO, INSCRICAODATA, '+
                          ' REMUNERACAO, SALPARTICIPACAO, CONTRIBUICAO, TEMPOINSS, NOMESITUACAO,NOMEBENEFICIO) '+
                          ' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.IDPESSOA, PP.SEQPROPOSTA, '+
                          ''''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''', '+
                          ' EL.MATRICULA, SP.FLGINTERNO, P.NOME, PF.SEXO, PF.ESTCIVIL, '+
                          ' PF.DATANASC,EL.DATAADMISSAO, PP.INSCRICAODATA, '+
                          ' EL.SALTOTAL, PP.SALPARTICIPACAO, 0 AS VALORESPERADO,EL.TEMPOSERVCALC, SP.DESCRICAO,NULL '+
                          ' FROM  PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, '+
                          ' SITPLANOPREV SP '+
                          ' WHERE        '+
                          ' PP.IDPESSJUR     = '+IntToStr(piIdPessJur)+' '+
                          ' AND   PP.IDPESSOA      = '+IntToStr(piIdPessoa)+' '+
                          ' AND   PP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+' '+
                          ' AND   EL.IDPESSJUR     = PP.IDPESSJUR '+
                          ' AND   EL.IDPESSOA      = PP.IDPESSOA '+
                          ' AND   PF.IDPESSOA      = PP.IDPESSOA '+
                          ' AND   P.IDPESSOA       = PP.IDPESSOA '+
                          ' AND   SP.IDSITPLANOPREV= PP.IDSITPLANOPREV';
       try
          qryaux.ExecSQL;
       except
       end;
    end
    else begin
       qryaux.close;
       qryaux.sql.text := ' DELETE SIMULAMIGRACAO           '+
                          ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)  +
                          ' AND    IDTITULAR     = '+IntToStr(piIdTitular)  +
                          ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)   +
                          ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                          ' AND    ANOMESREF     = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+'''';

       try
          qryaux.ExecSQL;
       except
       end;

       qryaux.close;
       qryaux.sql.text := ' INSERT INTO SIMULAMIGRACAO                                                 '+
                          '             ( IDPESSJUR,    IDPLANOPREV,   IDPESSOA,    IDTITULAR,         '+
                          '               SEQPROPOSTA,  ANOMESREF,     MATRICULA,   SITUACAO,          '+
                          '               NOME,         SEXO,          ESTADOCIVIL, DATANASC,          '+
                          '               DATAADMISSAO, INSCRICAODATA, REMUNERACAO, SALPARTICIPACAO,   '+
                          '               CONTRIBUICAO, TEMPOINSS,     NOMESITUACAO, NOMEBENEFICIO,    '+
                          '               SRB,          DATAINICIOFUND, VALORATUAL, VLRINFINSS,        '+
                          '               IDBENEFICIO,  DATAMORTE,    DATADEMISSAO )                   '+
                          ' SELECT        PP.IDPESSJUR, PP.IDPLANOPREV, BF.IDPESSOA, BF.IDTITULAR,     '+
                          '               PP.SEQPROPOSTA,                                              '+
                          '               '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''','+
                          '               DP.MATRICULA, SP.FLGINTERNO, P.NOME, PF.SEXO, PF.ESTCIVIL,   '+
                          '               PF.DATANASC,EL.DATAADMISSAO, PP.INSCRICAODATA,               '+
                          '               EL.SALTOTAL, PP.SALPARTICIPACAO, 0 AS VALORESPERADO,         '+
                          '               EL.TEMPOSERVCALC, SP.DESCRICAO, B.NOME,                      '+
                          '               BF.VALORSRB, BF.DATAINICIOFUND, BF.VALORATUAL, BF.VLRINFINSS, '+
                          '               BF.IDBENEFICIO, PF.DATAMORTE, EL.DATADEMISSAO                 '+
                          ' FROM  PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP,            '+
                          '       DEPENTIT DP, BENEFBFCIARIO BF, BENEFICIO B, SITPLANOPREV SP          '+
                          ' WHERE BF.IDPESSJUR     = '+IntToStr(piIdPessJur)                            +
                          ' AND   BF.IDPESSOA      = '+IntToStr(piIdPessoa)                             +
                          ' AND   BF.IDTITULAR     = '+IntToStr(piIdTitular)                            +
                          ' AND   BF.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)                          +
                          ' AND   PP.IDPESSJUR     = BF.IDPESSJUR                                      '+
                          ' AND   PP.IDPESSOA      = BF.IDTITULAR                                      '+
                          ' AND   PP.IDPLANOPREV   = BF.IDPLANOORIGEM                                  '+
                          ' AND   EL.IDPESSJUR     = PP.IDPESSJUR                                      '+
                          ' AND   EL.IDPESSOA      = PP.IDPESSOA                                       '+
                          ' AND   PF.IDPESSOA      = PP.IDPESSOA                                       '+
                          ' AND   P.IDPESSOA       = PP.IDPESSOA                                       '+
                          ' AND   SP.IDSITPLANOPREV= PP.IDSITPLANOPREV                                 '+
                          ' AND   DP.IDTITULAR     = BF.IDTITULAR                                      '+
                          ' AND   DP.IDPESSOA      = BF.IDPESSOA                                       '+
                          ' AND   B.IDBENEFICIO    = BF.IDBENEFICIO                                    ';
       try
          qryaux.ExecSQL;
       except
       end;
    end;

    // Abrir query com dados do participante no plano de origem
    with qryDadosNoPlanoOrigem do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger        := piIdPessJur;
       ParamByName('IDPLANOPREV').AsInteger      := piIdPlanoPrev;
       ParamByName('IDPESSOA').AsInteger         := piIdPessoa;
       ParamByName('IDTITULAR').AsInteger        := piIdTitular;
       ParamByName('SEQPROPOSTA').AsInteger      := piSeqProposta;
       ParamByName('IDEVENTOGERADOR').AsInteger  := StrToInt(sIdEventoGerador);
       ParamByName('DATAREF').AsDateTime         := StrToDate(dtDataRef.Text);
       Open;

       if not IsEmpty
       then begin
          lblTituloEtapa2.Caption  := 'Matrícula : '+FieldByName('MATRICULA').AsString+' - '+FieldByName('NOMEPARTICIP').AsString;
          lblTituloEtapa3.Caption  := lblTituloEtapa2.Caption;
          lblTituloEtapa4.Caption  := lblTituloEtapa2.Caption;
          lblTituloEtapa5.Caption  := lblTituloEtapa2.Caption;
          lblTituloEtapa6.Caption  := lblTituloEtapa2.Caption;

          edCampoBusca.Text        := FieldByName('MATRICULA').AsString;
          edNome.Text              := FieldByName('NOMEPARTICIP').AsString;
          lblPlanoOrigem.Caption   := 'Patrocinadora/Plano Origem : '+Trim(FieldByName('NOMEPATRO').AsString)+'/'+Trim(FieldByName('NOMEPLANO').AsString);
          lblInscricaoData.Caption := 'Titular Inscrito desde : '+FieldByName('INSCRICAODATA').AsString;

          if FieldByName('SITUACAO').AsString <> 'FL'
          then lblFalecido.Caption := 'Titular Falecido : Não '
          else lblFalecido.Caption := 'Titular Falecido : Sim - Data : '+FieldByName('DATAMORTE').AsString;

          if FieldByName('SITUACAO').AsString = 'AT'
          then lblSitPart.Caption  := 'Situação do Titular na Fundação : Ativo '
          else if FieldByName('SITUACAO').AsString = 'AS'
          then lblSitPart.Caption  := 'Situação do Titular na Fundação : Assistido '
          else if FieldByName('SITUACAO').AsString = 'MA'
          then lblSitPart.Caption  := 'Situação do Titular na Fundação : Mantido '
          else lblSitPart.Caption  := 'Situação do Titular na Fundação : Falecido  ';

          if FieldByName('NOMEBENEFICIO').AsString = ''
          then lblBeneficio.Caption := 'Pessoa Recebendo Benefício : Não '
          else lblBeneficio.Caption := 'Pessoa Recebendo Benefício : Sim - '+Trim(FieldByName('NOMEBENEFICIO').AsString);

          lblDataTransacao.Caption := 'Data da Simulação : ' + FormatDateTime('dd/mm/yyyy', Date); 

          if FieldByName('FLGBENEFTEMP').AsInteger = 1
          then bBeneficioTemporario := True
          else bBeneficioTemporario := False;

          qryPlanoDestino.First;
          if qryPlanoDestino.FieldByName('IDPLANOPREV').AsString <> FieldByName('IDPLANOPREV').AsString
          then dblkpcmbNovoPlano.Text :=  qryPlanoDestino.FieldByName('NOME').AsString;
          dblkpcmbNovoPlano.PerformSearch;

          bbtnAnterior.Enabled  := True;
          bbtnConfirmar.Enabled := True;
          iEtapaAtiva           := 1;

       end
       else begin // participante nao existe
           lblTituloEtapa2.Caption  := '';
           lblTituloEtapa3.Caption  := lblTituloEtapa2.Caption;
           lblTituloEtapa4.Caption  := lblTituloEtapa2.Caption;
           lblTituloEtapa5.Caption  := lblTituloEtapa2.Caption;
           edCampoBusca.Text        := '';
           edNome.Text              := '';
           lblPlanoOrigem.Caption      := 'Plano Origem : < não encontrado >';
           lblInscricaoData.Caption    := 'Titular Inscrito desde : < não encontrado >';
           lblFalecido.Caption         := 'Titular Falecido : < não encontrado >';
           lblSitPart.Caption          := 'Situação do Titular na Fundação : < não encontrado >';
           lblBeneficio.Caption        := 'Pessoa Recebendo Benefício : < não encontrado >';
           edCampoBusca.SetFocus;
       end;
    end;

    // Abrir querys de configuracao do evento
    with qryInputTransfPlano do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT IDINPUT, DESCRICAO, IDREGRA, FLGTIPO, TABELA, CAMPO,        '+
               '        NOMEPARAREGRA,''                              '' AS VALOR,  '+
               '        FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO,            '+
               '        FLGBENEFICIARIO, FLGPODEALTERAR, ORDEM, VALORDEFAULT,       '+
               '        IDREGRAVALIDA,TIPODADO                                      '+
               ' FROM   INPUTTRANSFPLANO                                            '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador                         +
               ' AND    FLGTIPO         = ''I''                                     ');
       if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       SQL.Add(' ORDER BY ORDEM, DESCRICAO ');
       Open;
    end;

    // Abrir querys de configuracao do evento
    with qryInfBanco do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT IDINPUT, DESCRICAO, IDREGRA, FLGTIPO, TABELA, CAMPO,        '+
               '        NOMEPARAREGRA,''                              '' AS VALOR,  '+
               '        FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO,            '+
               '        FLGBENEFICIARIO, FLGPODEALTERAR, ORDEM, VALORDEFAULT,       '+
               '        TIPODADO                                                    '+
               ' FROM   INPUTTRANSFPLANO                                            '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador                         +
               ' AND    FLGTIPO         <> ''I''                                    ');
       if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       SQL.Add(' ORDER BY ORDEM, DESCRICAO ');
       Open;
    end;

    if (qryDadosNoPlanoOrigem.FieldbyName('FLGINTERNO').AsString = 'AS') or
       (qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger)
    then begin
       with qryDadosAssistido do
       begin
          Close;
          ParamByName('IdPessJur').AsInteger   := piIdPessJur;
          ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
          ParamByName('IdPessoa').AsInteger    := piIdPessoa;
          ParamByName('SeqProposta').AsInteger := piSeqProposta;
          Open;
       end;
    end;

    with qryConfigTransf do
    begin
       Close;
       ParamByName('IDEVENTOGERADOR').AsInteger  := StrToInt(sIdEventoGerador);
       Open;
    end;

    // Abrir query com dados para demonstravio
    with dtmRelTransfPlano.qryFundacao do
    begin
       Close;
       ParamByName('pFundacao').AsInteger   := iIdFundacao;
       Open;
    end;
                              
    with dtmRelTransfPlano.qryDemonstrativo do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger       := piIdPessJur;
       ParamByName('IDPESSOA').AsInteger        := piIdPessoa;
       ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
       ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
       Open;
    end;

    with dtmRelTransfPlano.qrySubOpcoes do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;

    with dtmRelTransfPlano.qryBaseCalculo do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;

    with dtmRelTransfPlano.qryInfDigitadas do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;
    with dtmRelTransfPlano.qryEstimativas do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;

    with dtmRelTransfPlano.qryOBSPag1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT TO_CHAR(ROWNUM)||''.) ''||NOME AS OBSERVACAO '+
               ' FROM   TIPOSTRANSFPLANO                             '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador          +
               ' AND    FLGTIPO = ''R''                              '+
               ' AND    TIPOOBS = 1                                  ');

       if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       Open;
    end;

    with dtmRelTransfPlano.qryOBSPag2 do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT TO_CHAR(ROWNUM)||''.) ''||NOME AS OBSERVACAO '+
               ' FROM   TIPOSTRANSFPLANO                             '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador          +
               ' AND    FLGTIPO = ''R''                              '+
               ' AND    TIPOOBS = 2                                  ');
       if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       Open;
    end;

end;

procedure TfrmEventoTransfPlanoNOVO.ExecutaEtapa2;
var sSQL , sValorItem, sSQLInput  : string;
    bErro : boolean;
    iAnos, iMeses   : word;
begin
   frmAguarde.Mostra('Buscando Informações do Participante...');
   // Preencher qryInfBanco para os campos do Tipo C = Campo do Banco de Dados
   // Guardar valor de input de um campo para passar para a regra de outro campo
   with qryInfBanco do
   begin
      sSQLInput := '';
      First;
      while not Eof do
      begin
         if FieldByName('FLGTIPO').AsString = 'R'
         then begin
            sSQL := ' SELECT ';

            if POS(SSQLINPUT,'REVERPENSAO') < 0
            then ssql := ssql + '''N'' AS REVERPENSAO, ';

            ssql := ssql + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
                    '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
                    '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
                    '        EL.TEMPOSITESPECIAL,  S.SALPARTICIPACAO     AS VALORPROVENTO                       '+
                    '       '+sSQLInput                                                                          +
                    '        ,S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,    '+
                    '        S.MATRICULA,          S.IDADEAPOS,                                                 '+
                    '        DECODE(S.SITUACAO, ''FL'', DECODE(S.IDPESSOA, S.IDTITULAR, S.SITUACAO, ''AS''), ''AS'', S.SITUACAO) AS SITUACAO, '+
                    '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
                    '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
                    '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
                    '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA,                      '+
                    '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
                    '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
                    '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
                    '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
                    '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,         '+
                    '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
                    '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
                    '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+
                    '        '''+qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString+''' AS DATAREF           '+
                    ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
                    ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                    ' AND    S.IDPESSJUR   = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString          +
                    ' AND    S.IDPLANOPREV = '+qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString        +
                    ' AND    S.IDPESSOA    = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString           +
                    ' AND    S.SEQPROPOSTA = '+qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString        +
                    ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                    ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
                    ' AND    EL.IDPESSOA        = S.IDTITULAR                                                   ';

            sValorItem := RodaRegraSimula(FieldByName('IDREGRA').AsString, sSQL, bErro, iIdCalculoGeral);

            if bErro
            then begin
               frmAguarde.Apaga;
               MsgDlg('Erro ao calcular '+FieldByName('Descricao').AsString +'- Regra No. '+qryConfigTransf.FieldByName('IDREGRA').AsString+'.', 'Erro', mtError, [mbOk],0);
               frmAguarde.Mostra('Calculando Opções do Participante...');
               Next;
               continue;
            end;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (sValorItem <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(sValorItem))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;

           
            if FieldByName('TIPODADO').AsString = 'I'
            then begin
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            Edit;
            FieldByName('VALOR').AsString := sValorItem;
            Post;
         end;

         // Se chegar neste ponto, entao é do tipo C
         if (UpperCase(FieldByName('TABELA').AsString) = 'PESSOAFISICA' ) or
            (UpperCase(FieldByName('TABELA').AsString) = 'ELEGPATRO'    ) or
            (UpperCase(FieldByName('TABELA').AsString) = 'PARTPREVPLAN' ) or
            (UpperCase(FieldByName('TABELA').AsString) = 'SIMULAMIGRACAO' )
         then begin

            sValorItem := qryDadosNoPlanoOrigem.FieldByName(FieldByName('CAMPO').AsString).AsString;

            if FieldByName('TIPODADO').AsString = 'I'
            then begin
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            Edit;
            FieldByName('VALOR').AsString := sValorItem;
            Post;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (qryDadosNoPlanoOrigem.FieldByName(FieldByName('CAMPO').AsString).AsString <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(qryDadosNoPlanoOrigem.FieldByName(FieldByName('CAMPO').AsString).AsString))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;
         end;

         if ((qryDadosNoPlanoOrigem.FieldbyName('FLGINTERNO').AsString = 'AS') or
            (qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger) )  and
            (UpperCase(FieldByName('TABELA').AsString) = 'BENEFBFCIARIO' )
         then begin
            sValorItem := qryDadosAssistido.FieldByName(FieldByName('CAMPO').AsString).AsString;

            if FieldByName('TIPODADO').AsString = 'I'
            then begin
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            Edit;
            FieldByName('VALOR').AsString := sValorItem;
            Post;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (qryDadosAssistido.FieldByName(FieldByName('CAMPO').AsString).AsString <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(qryDadosAssistido.FieldByName(FieldByName('CAMPO').AsString).AsString))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;
         end;

         Next;
      end;
   end;
   frmAguarde.Apaga;
end;

procedure TfrmEventoTransfPlanoNOVO.ExecutaEtapa4;
var sSQL , sValorItem, sSQLInput  : string;
    bErro : boolean;
    iAnos,iMeses : word;
begin
   frmAguarde.Mostra('Verificando Opções do Participante...');
   // Preencher qryInputTransfPlano para os campos do Tipo I = Informado
   // Guardar valor de input de um campo para passar para a regra de outro campo
   with qryInputTransfPlano do
   begin
      sSQLInput := '';
      First;
      bMontandoDefault := True;
      while not Eof do
      begin
         if FieldByName('FLGTIPO').AsString = 'I'
         then begin
            if FieldByName('VALORDEFAULT').AsString <> ''
            then begin
               Edit;

               if FieldByName('VALORDEFAULT').AsString = 'HOJE' Then
                 FieldByName('VALOR').AsString := FormatDateTime('dd/mm/yyyy', Date) 
               Else
                 FieldByName('VALOR').AsString := FieldByName('VALORDEFAULT').AsString;

               Post;
            end;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (FieldByName('VALOR').AsString <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(FieldByName('VALOR').AsString))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;
         end;
         Next;
      end;
   end;
   bMontandoDefault := False;

   // Preencher query para executar regra de calculo
   with qryInfBanco do
   begin
      First;
      while not Eof do
      begin
         if (FieldByName('NOMEPARAREGRA').AsString <> '') then
           sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);
         Next;
      end;
   end;

   with qryInputTransfPlano do
   begin
     First;
     while not Eof do
     begin
        sSQL := ' SELECT ';

        if POS(SSQLINPUT,'REVERPENSAO') < 0 then
          ssql := ssql + '''N'' AS REVERPENSAO, ';

        sSQL := sSQL+ '  EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
                '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
                '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
                '        EL.TEMPOSITESPECIAL                                                                '+
                '       '+sSQLInput                                                                          +
                '        ,S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,    '+
                '        S.MATRICULA,          S.IDADEAPOS,                                                 '+
                '        S.SALPARTICIPACAO     AS VALORPROVENTO,                                            '+
                '        DECODE(S.SITUACAO, ''FL'', DECODE(S.IDPESSOA, S.IDTITULAR, S.SITUACAO, ''AS''), ''AS'', S.SITUACAO) AS SITUACAO, '+
                '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
                '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
                '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
                '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA,                      '+
                '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
                '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
                '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
                '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
                '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,        '+
                '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
                '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
                '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+

                '        '''+qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString+''' AS DATAREF           '+
                ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
                ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                ' AND    S.IDPESSJUR   = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString          +
                ' AND    S.IDPLANOPREV = '+qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString        +
                ' AND    S.IDPESSOA    = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString           +
                ' AND    S.SEQPROPOSTA = '+qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString        +
                ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
                ' AND    EL.IDPESSOA        = S.IDTITULAR                                                   ';


        if (FieldByName('NOMEPARAREGRA').AsString <> '') and (sValorItem <> '') then
          sSQLInput := sSQLInput + ', '''+OraNumero(Trim(sValorItem))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;

        if FieldByName('TIPODADO').AsString = 'I' then
        begin
          iAnos      := Trunc(StrToInt(sValorItem) / 12);
          iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
          sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
        end
        else
          if FieldByName('TIPODADO').AsString = 'N' then
          begin
           // No caso da etapa 4 o valor nao pode ser formatado
           sValorItem := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorItem)));           
          end;

        Edit;
        FieldByName('VALOR').AsString := sValorItem;
        Post;

        Next;
     end;
   end;
   frmAguarde.Apaga;
end;

procedure TfrmEventoTransfPlanoNOVO.ExecutaEtapa3ou5 (pcTipo : char);
var iOpcao          : word;
    bErro           : boolean;
    sSQL,
    sSQLInput,
    sValorItem      : string;
    bPossuiCalculo  : boolean;
    iAnos, iMeses   : word;
begin
   // Montar SQL com todos os dados da etapa 2 (input)
   frmAguarde.Mostra('Preparando Informações ...');

   sSQLInput := '';
   if (pcTipo <> 'E') and dtmRelTransfPlano.qryDemonstrativo.UpdatesPending then dtmRelTransfPlano.qryDemonstrativo.CancelUpdates;
   if (pcTipo <> 'E') and dtmRelTransfPlano.qrySubOpcoes.UpdatesPending     then dtmRelTransfPlano.qrySubOpcoes.CancelUpdates;
   if (pcTipo = 'B')  and dtmRelTransfPlano.qryBaseCalculo.UpdatesPending   then dtmRelTransfPlano.qryBaseCalculo.CancelUpdates;
   if (pcTipo = 'E')  and dtmRelTransfPlano.qryEstimativas.UpdatesPending   then dtmRelTransfPlano.qryEstimativas.CancelUpdates;

   with qryInfBanco do
   begin
      First;
      while not Eof do
      begin
         if (FieldByName('NOMEPARAREGRA').AsString <> '')
         then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);

         // Preencher dtmRelTransfPlano.qryDemonstrativo
         if pcTipo <> 'E'
         then begin
            dtmRelTransfPlano.qryDemonstrativo.Append;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('MATRICULA').AsString        := qryDadosNoPlanoOrigem.FieldByName('MATRICULA').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('NOMEPARTICIPANTE').AsString := qryDadosNoPlanoOrigem.FieldByName('NOMEPARTICIP').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('NOMEPLANOATUAL').AsString   := qryDadosNoPlanoOrigem.FieldByName('NOMEPLANO').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('NOMEINPUT').AsString        := FieldByName('DESCRICAO').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('VALORINPUT').AsString       := FieldByName('VALOR').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('DATADADOS').AsString        := qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('DATATRANSACAO').AsString    := FormatDateTime('dd/mm/yyyy', Date); 
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('SECAO').AsInteger           := 1;
            dtmRelTransfPlano.qryDemonstrativo.Post;
         end;

         Next;
      end;
   end;

   with qryInputTransfPlano do
   begin
      First;
      while not Eof do
      begin
         if (FieldByName('NOMEPARAREGRA').AsString <> '')
         then begin
            if pcTipo = 'E'
            then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString)
            else sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALORDEFAULT').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString)
         end;
         Next;
      end;
   end;

   with qryTiposTransf do
   begin
      Close;
      ParamByName('IDEVENTOGERADOR').AsInteger  := StrToInt(sIdEventoGerador);
      ParamByName('FLGTIPO').AsString           := pcTipo;
      Open;

      if IsEmpty
      then begin
         if pcTipo = 'O'
         then begin
            tbsEtapa1.TabVisible         := False;
            tbsEtapa2.TabVisible         := False;
            tbsEtapa3.TabVisible         := False;
            tbsEtapa4.TabVisible         := True;
            tbsEtapa5.TabVisible         := False;
            tbsEtapa6.TabVisible         := False;
            pgctrlEtapas.ActivePage      := tbsEtapa4;
            frmAguarde.Apaga;
            ExecutaEtapa4;
            Exit;
         end
         else begin
            frmAguarde.Apaga;
            tbsEtapa1.TabVisible         := False;
            tbsEtapa2.TabVisible         := False;
            tbsEtapa3.TabVisible         := False;
            tbsEtapa4.TabVisible         := False;
            tbsEtapa5.TabVisible         := False;
            tbsEtapa6.TabVisible         := True;
            pgctrlEtapas.ActivePage      := tbsEtapa6;
            Exit;
         end;
      end
   end;

   // Verificar se existem estimativas a fazer
   bPossuiCalculo  := False;
   with qryTiposTransf do
   begin
      First;
      iOpcao := 0;
      while not Eof do
      begin
         // Verificar se opcao é permitida para situação correspondente
         if ((FieldByName('FLGATIVO').AsInteger = 0) ) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AT')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGMANTIDO').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MA')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGMANTPARC').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MP')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGASSISTIDO').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AS')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGBENEFICIARIO').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger)
         then begin
              Next;
              Continue;
         end;
         bPossuiCalculo  := True;
         Next;
      end;
   end;

   if (not bPossuiCalculo) and (pcTipo <> 'B')
   then begin
      if pcTipo = 'O'
      then begin
         tbsEtapa1.TabVisible         := False;
         tbsEtapa2.TabVisible         := False;
         tbsEtapa3.TabVisible         := False;
         tbsEtapa4.TabVisible         := True;
         tbsEtapa5.TabVisible         := False;
         tbsEtapa6.TabVisible         := False;

         pgctrlEtapas.ActivePage := tbsEtapa4;
         ExecutaEtapa4;
         frmAguarde.Apaga;
         Exit;
      end
      else begin
         frmAguarde.Apaga;
         tbsEtapa1.TabVisible         := False;
         tbsEtapa2.TabVisible         := False;
         tbsEtapa3.TabVisible         := False;
         tbsEtapa4.TabVisible         := false;
         tbsEtapa5.TabVisible         := False;
         tbsEtapa6.TabVisible         := True;
         pgctrlEtapas.ActivePage := tbsEtapa6;
         Exit;
      end;
   end;

   if pcTipo <> 'E'
   then begin
      if pcTipo = 'B'
      then memOpcoes.Lines.Clear
      else if not bCalculouBase
           then memOpcoes.Lines.Clear;
      frmAguarde.Mostra('Calculando Opções do Participante...');
   end
   else begin
      memEstimativas.Lines.Clear;
      frmAguarde.Mostra('Calculando Estimativas para Opção '+Trim(edOpcao.Text)+'...');
      lblEstimativa.Caption := 'Estimativas para a Opção '+Trim(edOpcao.Text)+'...';
   end;

   // Calcular as opcoes do evento de transferencia
   with qryTiposTransf do
   begin
      First;
      iOpcao := 0;
      while not Eof do
      begin
         // Verificar se opcao é permitida para situação correspondente
         if ((FieldByName('FLGATIVO').AsInteger = 0) ) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AT')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGMANTIDO').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MA')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGMANTPARC').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'MP')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGASSISTIDO').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldByName('FLGINTERNO').AsString = 'AS')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGBENEFICIARIO').AsInteger = 0) and (qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger)
         then begin
              Next;
              Continue;
         end;
         inc(iOpcao);
         if pcTipo <> 'E'
         then begin
            if pcTipo = 'O'
            then begin
               memOpcoes.Lines.Add(' ');
               memOpcoes.Lines.Add('Opção '+IntToStr(iOpcao)+' .) Optando por '+FieldByName('NOME').AsString);
               memOpcoes.Lines.Add(' ');
            end;
         end
         else begin
            memOpcoes.Lines.Add(' ');
            memEstimativas.Lines.Add(IntToStr(iOpcao)+' .) '+FieldByName('NOME').AsString);
            memOpcoes.Lines.Add(' ');
         end;

         if pcTipo = 'B'
         then begin
            edOpcao.Text := IntToStr(iOpcao);
            // Calcular Item da Configuracao da Opção
            sSQL := ' SELECT ';

            if POS(SSQLINPUT,'REVERPENSAO') < 0
            then ssql := ssql + '''N'' AS REVERPENSAO, ';

            sSQL := sSQL + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
                    '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
                    '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
                    '        EL.TEMPOSITESPECIAL                                                                '+
                    '   '+sSQLInput                                                                              +
                    '        ,S.IDPESSJUR,         S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,     '+
                    '        S.MATRICULA,          S.IDADEAPOS,                           '+
                    '        DECODE(S.SITUACAO, ''FL'', DECODE(S.IDPESSOA, S.IDTITULAR, S.SITUACAO, ''AS''), ''AS'', S.SITUACAO) AS SITUACAO, '+
                    '        S.SALPARTICIPACAO   AS VALORPROVENTO,                                              '+
                    '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
                    '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
                    '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
                    '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA,                      '+
                    '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
                    '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
                    '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
                    '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,        '+
                    '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
                    '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
                    '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
                    '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+
                    '        '''+qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString+''' AS DATAREF,          '+
                    '-1 AS IDTIPOTRANSF,                     '+
                    OraNumero(Trim(edOpcao.Text))+' AS OPCAO                                                    '+
                    ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
                    ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                    ' AND    S.IDPESSJUR   = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString           +
                    ' AND    S.IDPLANOPREV = '+qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString         +
                    ' AND    S.IDPESSOA    = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString            +
                    ' AND    S.SEQPROPOSTA = '+qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString         +
                    ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                    ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
                    ' AND    EL.IDPESSOA        = S.IDTITULAR                                                   ';

            sValorItem := RodaRegraSimula(qryTiposTransf.FieldByName('IDREGRABASE').AsString, sSQL, bErro, iIdCalculoGeral);
            bCalculouBase := True;
            if bErro
            then begin
               frmAguarde.Apaga;
               MsgDlg('Erro ao calcular '+qryConfigTransf.FieldByName('NOME').AsString +'- Regra No. '+qryConfigTransf.FieldByName('IDREGRA').AsString+'.', 'Erro', mtError, [mbOk],0);
               frmAguarde.Mostra('Calculando Opções do Participante...');
               qryConfigTransf.Next;
               continue;
            end;

            if qryTiposTransf.FieldByName('TIPODADO').AsString = 'I'
            then begin // idade em anos e meses
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            memOpcoes.Lines.Add('     '+ PreparaStr(FieldByName('NOME').AsString ,50)+' '+
                                         CompletaString(sValorItem,' ', 20, False));

            dtmRelTransfPlano.qryBaseCalculo.Append;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('SECAO').AsInteger     := iOpcao;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('NUMOPCAO').AsInteger  := iOpcao;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('DESCOPCAO').AsString  := FieldByName('NOME').AsString;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('NOMEINPUT').AsString  := FieldByName('NOME').AsString;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('VALORINPUT').AsString := sValorItem;
            dtmRelTransfPlano.qryBaseCalculo.Post;


         end
         else begin
            qryConfigTransf.First;
            while not qryConfigTransf.Eof do
            begin
               if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger <> FieldByName('IDTIPOTRANSF').AsInteger)
               then begin
                  qryConfigTransf.Next;
                  continue;
               end;

               if pcTipo <> 'E'
               then edOpcao.Text := IntToStr(iOpcao);

               if (qryConfigTransf.FieldByName('IDREGRA').AsInteger <= 0)
               then sValorItem := '0'
               else begin
                  // Calcular Item da Configuracao da Opção
                  sSQL := ' SELECT ';

                  if POS(SSQLINPUT,'REVERPENSAO') < 0
                  then ssql := ssql + '''N'' AS REVERPENSAO, ';

                  sSQL := sSQL + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
                          '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
                          '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
                          '        EL.TEMPOSITESPECIAL                                                                '+
                          '   '+sSQLInput                                                                              +
                          '        ,S.IDPESSJUR,         S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,     '+
                          '        S.MATRICULA,          S.IDADEAPOS,                           '+
                          '        DECODE(S.SITUACAO, ''FL'', DECODE(S.IDPESSOA, S.IDTITULAR, S.SITUACAO, ''AS''), ''AS'', S.SITUACAO) AS SITUACAO, '+
                          '        S.SALPARTICIPACAO   AS VALORPROVENTO,                                              '+
                          '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
                          '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
                          '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
                          '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA,                      '+
                          '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
                          '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
                          '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
                          '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,        '+
                          '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
                          '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
                          '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
                          '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+
                          '        '''+qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString+''' AS DATAREF,          '+
                          qryConfigTransf.FieldByName('IDTIPOTRANSF').AsString+' AS IDTIPOTRANSF,                     '+
                          OraNumero(Trim(edOpcao.Text))+' AS OPCAO                                                    '+
                          ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
                          ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                          ' AND    S.IDPESSJUR   = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString           +
                          ' AND    S.IDPLANOPREV = '+qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString         +
                          ' AND    S.IDPESSOA    = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString            +
                          ' AND    S.SEQPROPOSTA = '+qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString         +
                          ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                          ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
                          ' AND    EL.IDPESSOA        = S.IDTITULAR                                                   ';

                  sValorItem := RodaRegraSimula(qryConfigTransf.FieldByName('IDREGRA').AsString, sSQL, bErro, iIdCalculoGeral);
               end;

               if bErro
               then begin
                  frmAguarde.Apaga;
                  MsgDlg('Erro ao calcular '+qryConfigTransf.FieldByName('NOME').AsString +'- Regra No. '+qryConfigTransf.FieldByName('IDREGRA').AsString+'.', 'Erro', mtError, [mbOk],0);
                  frmAguarde.Mostra('Calculando Opções do Participante...');
                  qryConfigTransf.Next;
                  continue;
               end;

               if qryConfigTransf.FieldByName('TIPODADO').AsString = 'I'
               then begin // idade em anos e meses
                  iAnos      := Trunc(StrToInt(sValorItem) / 12);
                  iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
                  sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
               end
               else if FieldByName('TIPODADO').AsString = 'N'
               then begin
                  sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
               end;

               qryConfigTransf.Edit;
               qryConfigTransf.FieldByName('VALOR').AsString := sValorItem;
               qryConfigTransf.Post;



               if pcTipo = 'O'
               then begin
                  memOpcoes.Lines.Add('     '+ PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,50)+' '+
                                                          CompletaString(sValorItem,' ', 20, False));
                  dtmRelTransfPlano.qrySubOpcoes.Append;
                  dtmRelTransfPlano.qrySubOpcoes.FieldByName('SECAO').AsInteger     := iOpcao;
                  dtmRelTransfPlano.qrySubOpcoes.FieldByName('NUMOPCAO').AsInteger  := iOpcao;
                  dtmRelTransfPlano.qrySubOpcoes.FieldByName('DESCOPCAO').AsString  := FieldByName('NOME').AsString;
                  dtmRelTransfPlano.qrySubOpcoes.FieldByName('NOMEINPUT').AsString  := qryConfigTransf.FieldByName('NOME').AsString;
                  dtmRelTransfPlano.qrySubOpcoes.FieldByName('VALORINPUT').AsString := sValorItem;
                  dtmRelTransfPlano.qrySubOpcoes.Post;
               end
               else begin
                  memEstimativas.Lines.Add('     '+PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,50)+' '+
                                                   CompletaString(sValorItem,' ', 20, False));
                  dtmRelTransfPlano.qryEstimativas.Append;
                  dtmRelTransfPlano.qryEstimativas.FieldByName('SECAO').AsInteger     := iOpcao;
                  dtmRelTransfPlano.qryEstimativas.FieldByName('NUMOPCAO').AsInteger  := iOpcao;
                  dtmRelTransfPlano.qryEstimativas.FieldByName('DESCOPCAO').AsString  := FieldByName('NOME').AsString;
                  dtmRelTransfPlano.qryEstimativas.FieldByName('NOMEINPUT').AsString  := qryConfigTransf.FieldByName('NOME').AsString;
                  dtmRelTransfPlano.qryEstimativas.FieldByName('VALORINPUT').AsString := sValorItem;
                  dtmRelTransfPlano.qryEstimativas.Post;
               end;
               qryConfigTransf.Next;
            end;
            if pcTipo <> 'E'
            then memOpcoes.Lines.Add ('  ')
            else memEstimativas.Lines.Add('  ');
         end;
         Next;
      end;
   end;
   frmAguarde.Apaga;

   if pcTipo = 'O'
   then begin
      edOpcao.SetFocus;
      edOpcao.Text := '';
   end;
end;


function TfrmEventoTransfPlanoNOVO.GravaEVENTOSPREV : boolean;
var sIdEventoGeradorDestino : string;
begin

   // Gravar evento da categoria Transferencia de Plano no plano de origem
   iIdEventoPrevOrig := LeUltRegistro(qryAux,'EVENTOSPREV');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                  '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                  '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                  '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                  '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                  '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                  ' VALUES(' + IntToStr(iIdEventoPrevOrig)                      + ',' +
                  ' TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date)     + ''',''DD/MM/YYYY'') ,' + 
                  ' TO_DATE(''' + Trim(dtDataTRANSACAO.Text) + ''',''DD/MM/YYYY'')     ,' +
                  qryDadosNoPlanoOrigem.FieldByName('IDTITULAR').AsString        + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString     + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString     + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITPLANOPREV').AsString  + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qrySitPlanoOrigem.FieldByName('IDSITPLANOPREV').AsString      + ',' +
                  sIdEventoGerador       + ',''1'',''1'',''1'',' +
                  ' TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/mm/yyyy''),''1'''+','+ 
                  qryDadosNoPlanoOrigem.FieldByName('INSCRICAONUMERO').AsString       +')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      exit;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MAX(IDEVENTOGERADOR) AS IDEVENTOGERADOR  '+
                  ' FROM   EVENTOGERADOR                            '+
                  ' WHERE  FLGINTERNO     = ''IP''                  ');
   qryAux.Open;
   if qryAux.IsEmpty or (qryAux.FieldByName('IDEVENTOGERADOR').AsString = '')
   then begin
      Close;
      MsgDlg('Nenhum evento da categoria "Inscrição no Plano" encontrada. ','Erro', mtError, [mbOk],0);
      Exit;
   end;

   sIdEventoGeradorDestino := qryAux.FieldByName('IDEVENTOGERADOR').AsString;

   // Gravar evento da categoria Inscricao no Plano no plano de destino
   iIdEventoPrevDest := LeUltRegistro(qryAux,'EVENTOSPREV');
   iIdEventosPrev    :=  iIdEventoPrevDest;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                  '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                  '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                  '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                  '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                  '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                  ' VALUES(' + IntToStr(iIdEventoPrevDest)                   + ',' +
                  ' TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date)     + ''',''DD/MM/YYYY'') ,' + 
                  ' TO_DATE(''' + Trim(dtDataTRANSACAO.Text) + ''',''DD/MM/YYYY'') ,' +
                  qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString        + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString       + ',' +
                  qryPlanoDestino.FieldByName('IDPLANOPREV').AsString           + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString     + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITPLANOPREV').AsString  + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryDadosNoPlanoOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qrySitPlanoDestino.FieldByName('IDSITPLANOPREV').AsString     + ',' +
                  sIdEventoGeradorDestino + ',''1'',''1'',''1'',' +
                  ' TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY''),''1'''   +','+ 
                  Trim(sNumInscDestino)+')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      Exit;
   end;
   Result := True;
end;

function TfrmEventoTransfPlanoNOVO.GravaReservasParticipante(sIdPessJurTransf,sIdPlanoOrigem,sIdPessoaTransf ,sSeqPropostaTransf : String ;
                                                          qryaux, qryaux2, qrygrava  : twwquery): Boolean ;
begin
    Result := false;

   // Filtra todas as Reservas do Plano
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO '+
                  ' WHERE  IDPLANOPREV      = ' + sIdPlanoOrigem+
                  ' AND    ANALITICOSINTETI = ' + '''A''' +
                  ' AND    FLGCOLETIVA      = 0 ');
   qryAux.Open;
   qryAux.First;

   while not qryAux.EOF do
   begin
       // Verifica se as Reservas do Participante ainda não foram gravadas
       qryAux2.Close;
       qryAux2.Sql.Clear;
       qryAux2.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAPART ' +
                       ' WHERE IDTIPORESERVA = ' + qryAux.FieldbyName('IDTIPORESERVA').AsString + ' AND ' +
                       '       IDPESSOA      = ' + sIdPessoaTransf + ' AND ' +
                       '       SEQPROPOSTA   = ' + sSeqPropostaTransf +' AND '+
                       '       IDPLANOPREV   = ' + sIdPlanoOrigem + ' AND ' +
                       '       IDPESSJUR     = ' + sIdPessJurTransf );
       qryAux2.Open;
       if qryAux2.IsEmpty
       then begin
           // Grava as Reservas do Participante
           qryGrava.Close;
           qryGrava.Sql.Clear;
           qryGrava.Sql.Add(' INSERT INTO RESERVAPART (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, SEQPROPOSTA, FLGATIVO, ' +
                            'IDPARTICIPANTE) ' +   
                            ' VALUES( ' + qryAux.FieldbyName('IDTIPORESERVA').AsString  + ',' +
                                          sIdPlanoOrigem+ ',' +
                                          sIdPessJurTransf+ ',' +
                                          sIdPessoaTransf+ ', '+sSeqPropostaTransf+',1, ' +
                                          sIdPessoaTransf + ')'); 
           try
              qryGrava.ExecSQL;
           except
              Exit;
           end;
       end;  //if

      qryAux.Next;
   end;//while

   Result := true;
end;

function TfrmEventoTransfPlanoNOVO.SuspendeContribuicoes(sIdPessJurTransf, sIdPlanoOrigem, sIdPessoaTransf,sSeqPropostaTransf : String ; qryAux, qryGrava : TwwQuery) : boolean ;
begin

  result := true;
end;

function TFrmEventoTransfPlanoNOVO.TransfPlano( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var sSQL     : string;
    sMsgErro : string;
    bErro    : boolean;
begin
   Result := False;

   // Seleciona todas as informações do participante no plano de origem
   sSQL := ' SELECT PP.REQUERIMENTODATA,                                                  '+
           '        PP.INSCRICAONUMERO,         PP.INSCRICAODATA,   PP.INSCRICAOTIPO,     '+
           '        PP.SALINSCRICAO,                                                      '+
           '        PP.DATAINICIOASSIST,        PP.SALPARTICIPACAO, PP.SALMANTIDO,        '+
           '        PP.SALVINCULADO,            PP.VALORCALCINSS,   PP.DATACANCELAMENTO,  '+
           '        PP.DATAINICIOMANUT,         PP.DATAFIMASSIST,   PP.FLGDEVEEMPRESTIMO, '+
           '        PP.FLGDEVEASSISTENC,        PP.FLGDEVEPREVIDENC,PP.VALORINFINSS,      '+
           '        PP.DATAINICIOSITTEMP,       PP.DATAFIMSITTEMP,  PP.SALAUXDOENCA,      '+
           '        PP.SEQPROPOSTA,             PP.IDSITPART,                             '+
           '        PP.REQUERIMENTODATA, '+
           '        PP.IDPLANOPREV, EL.IDSITFUNC '+   
           '  FROM  PARTPREVPLAN PP,'+
           '  ELEGPATRO EL '+                         
           '  WHERE PP.IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+
           '  AND   PP.IDPESSOA    = '+IntToStr(piIdTitular) +
           '  AND   PP.IDPESSJUR   = EL.IDPESSJUR '+  
           '  AND   PP.IDPESSOA    = EL.IDPESSOA  ';  


   // Executa regra de validação de transferencia de plano
   if qryPlanoDestino.FieldByName('IDREGRATRANSFPLA').AsString <> ''
   then begin
      if not RegraBooleana( qryPlanoDestino.Fieldbyname('IDREGRATRANSFPLA').AsString, sSQL, bErro)
      then begin
         Result := False;
         MsgDlg(edNome.Text+' não foi aprovado(a) pela Regra de Elegibilidade para Transferência de Plano.','Informação',mtInformation,[mbOK],0);
         Exit;
      end;

      if bErro
      then begin
         Result := False;
         Exit;
      end;
   end;//if

   if (piIdTitular = piIdPessoa) or (not chkSoBeneficiario.Checked)
   then begin
      qryAux.close;
      qryAux.sql.Clear;
      qryAux.sql.add('  UPDATE  PARTPREVPLAN SET FLGDESATIVADO    = 1, '+
                     '                           IDSITPLANOPREV   = '+qrySitPlanoOrigem.FieldByName('IDSITPLANOPREV').AsString+', '+
                     '                           DATACANCELAMENTO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', StrToDate(dtDataTRANSACAO.Text)- 1) + ''',''DD/MM/YYYY'') '+ 
                     '  WHERE   IDPESSJUR   = '+IntToStr(piIdPessJur)+
                     '  AND     IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+
                     '  AND     IDPESSOA    = '+IntToStr(piIdTitular)+
                     '  AND     SEQPROPOSTA = '+IntToStr(piSeqProposta) );

      try
         qryAux.ExecSQL;
      except
         Result := False;
         Exit;
      end;

      // Gerar Numero de Inscricao Automaticamente, caso o parametro diga que é automatico
      if qryPlanoDestino.FieldbyName('FLGAUTONUMINSC').AsInteger = 1
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT MAX(INSCRICAONUMERO)+1 AS PROXINSC FROM PARTPREVPLAN '+
                        ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoDestino));
         qryAux.Open;
         if Trim(qryAux.FieldByName('PROXINSC').AsString) <> ''
         then sNumInscDestino := qryAux.FieldByName('PROXINSC').AsString;
         qryAux.Close;
      end
      else begin
         try
         finally
         end;
      end;

      // Insere participante no plano destino
      sSQL := '  INSERT INTO PARTPREVPLAN( '+
              '         IDPESSJUR,         IDPLANOPREV,    IDPESSOA,          SEQPROPOSTA,        '+
              '         IDSITPART ,        IDSITPLANOPREV, INSCRICAONUMERO,   INSCRICAODATA,      '+
              '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
              '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
              '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
              '         DATAINICIOSITTEMP, DATAFIMSITTEMP, DATAINICIOMANUT,   REQUERIMENTODATA,   '+
              '         DTINICIOINSC                                                            ) '+
              ' SELECT                                                                            '+
              '         IDPESSJUR,         '+IntToStr(piIdPlanoDestino)+',    IDPESSOA,          SEQPROPOSTA,        '+
              '         IDSITPART ,        '+qrySitPlanoDestino.FieldbyName('IDSITPLANOPREV').AsString+','+sNumInscDestino+','+
              '         TO_DATE('''+dtDataTRANSACAO.Text+''',''DD/MM/YYYY''),                       '+
              '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
              '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
              '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
              '         DECODE(DATAINICIOSITTEMP, NULL, NULL, TO_DATE('''+dtDataTRANSACAO.Text+''',''DD/MM/YYYY'') ), '+
              '         DECODE(DATAFIMSITTEMP,    NULL, NULL, TO_DATE('''+dtDataTRANSACAO.Text+''',''DD/MM/YYYY'') ), '+
              '         DECODE(DATAINICIOMANUT,   NULL, NULL, TO_DATE('''+dtDataTRANSACAO.Text+''',''DD/MM/YYYY'') ), '+
              '         SYSDATE,                                                                                    '+
              '         TO_DATE('''+dtDataTRANSACAO.Text+''',''DD/MM/YYYY'')                        '+
              ' FROM    PARTPREVPLAN                                                              '+
              ' WHERE   IDPESSJUR   = '+IntToStr(piIdPessJur)+
              ' AND     IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+
              ' AND     IDPESSOA    = '+IntToStr(piIdPessoa)+
              ' AND     SEQPROPOSTA = '+IntToStr(piSeqProposta);
      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.add(sSQL);

      try
         qryGrava.ExecSQL;
      except
         Result := False;
         Exit;
      end;

      if not VerificaMigraPlanoEmprestimo ( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa )

      then begin
         MsgDlg('Erro na atualização do contrato de empréstimo. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;
      

      if not GravaEVENTOSPREV
      then begin
         MsgDlg('Erro na gravação no histórico de eventos. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;

      // Suspender a cobrança das contribuições atuais
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, DATAFINAL = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', StrToDate(dtDataTRANSACAO.Text)- 1) + ''',''DD/MM/YYYY'')' + 
                     ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur) +
                     ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    IDPESSOA    = '+IntToStr(piIdPessoa) +
                     ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta) );
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Erro ao suspender as contribuições no plano origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;

      // Associar novas contribuicoes
      if not AssociaNovasContribuicoes( IntToStr(piIdPessJur),
                                        IntToStr(piIdPlanoDestino),
                                        IntToStr(piIdTitular),
                                        IntToStr(piSeqProposta),
                                        sIdEventoGerador,
                                        dtDataTRANSACAO.Text,
                                        '',
                                        qryDadosNoPlanoOrigem.FieldByName('MATRICULA').AsString,
                                        qryDadosNoPlanoOrigem.FieldByName('IDSITPART').AsString,
                                        qryDadosNoPlanoOrigem.FieldByName('SALPARTICIPACAO').AsString,
                                        False,
                                        False,
                                        False,
                                        qryAux,
                                        qryGrava,
                                        sFlgInterno,
                                        iIdEventosPrev,
                                        '0000/00')
      then begin
         MsgDlg('Erro ao associar as contribuições do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;


      // Rodar padrao de movimentacao de reservas
      if not RODAPADRAOMOVRESERVA( piIdPessJur,
                                   piIdPlanoOrigem,
                                   piIdPessoa,
                                   piSeqProposta,
                                   -1,
                                   StrToInt(sIdEventoGerador),
                                   piIdPessJur,
                                   piIdPlanoDestino,
                                   sFlgInterno,
                                   dtDataTRANSACAO.Text,
                                   sMsgErro,
                                   -1,
                                   'O')
      then begin
         MsgDlg('Erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
         Exit;
      end;

      // Gerar Movimento de Reserva com Saída de 100% do que o padrao de movimentacao ainda
      // deixou na reserva
      qryAux.close;
      qryAux.sql.clear;
      qryAux.SQL.Add('INSERT INTO HISTMOVRESERVA ( '+
                     ' IDREGRACALCULO,      IDPLANOPREV,         IDTIPORESERVA,     IDPESSJUR,           IDPESSOA,    '+
                     ' SEQPROPOSTA,         IDEVENTOGERADOR,     IDCONTRIBUICAO,    IDBENEFICIO,         DATAMOV,     '+
                     ' VLRREAL,             VLRCOTAS,            SALDOREAL,         SALDOCOTAS,          FLGENTRADA,  '+
                     ' PERCENTUAL,          IDPARTICIPANTE,      SALDOREALCONT,     DATAALIMENTACAO,                  '+
                     ' VALORINDICE,         MESREFERENCIA,       FLGPROCEDENCIA,    IDHISTRESERVA)                    '+
                     ' SELECT NULL,         RP.IDPLANOPREV,      RP.IDTIPORESERVA,  RP.IDPESSJUR,        RP.IDPESSOA, '+
                     ' RP.SEQPROPOSTA,      '+sIdEventoGerador+',NULL,              NULL,                SYSDATE,     '+
                     ' RP.VALORRESERVA,     RP.VALORRESERVA,     0,                 0,                   0,           '+
                     ' NULL,                RP.IDPESSOA,         0,                 SYSDATE,                          '+
                     ' 1,                   '''+Copy(dtDataTRANSACAO.Text,7,4)+'/'+Copy(dtDataTRANSACAO.Text,4,2)+''', 0, SEQHISTMOVRESERVA.NEXTVAL '+
                     ' FROM RESERVAPART RP '+
                     ' WHERE  RP.IDPESSJUR   = '+IntToStr(piIdPessJur) +
                     ' AND    RP.IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    RP.IDPESSOA    = '+IntToStr(piIdPessoa) +
                     ' AND    RP.SEQPROPOSTA = '+IntToStr(piSeqProposta) );
      try
         qryAux.execsql;
      except
         MsgDlg('Erro ao zerar reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;


      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 0 , DATADESATIV = SYSDATE, VALORRESERVA = 0 '+
                     ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur) +
                     ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    IDPESSOA    = '+IntToStr(piIdPessoa) +
                     ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta) );
      try
         qryAux.execsql;
      except
         MsgDlg('Erro ao zerar reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;
   end;


   if (piIdTitular <> piIdPessoa) or (qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString = 'AS')
   then begin // transferir beneficiario
      // Fazer DE-PARA de beneficios na BFCIARIOTITPLAN
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add(' INSERT INTO BFCIARIOTITPLAN (                                             '+
                     ' IDTITULAR,          IDPESSJUR,       IDPLANOPREV,      IDPLANOORIGEM,     '+
                     ' IDPESSOA,           IDRESPONSAVEL,   IDBENEFICIO,      SEQPROPOSTA,       '+
                     ' IDDEPENRESPON,      PRIORIDADE,      PERCENTUAL,       IDNUCLEOFAMILIAR,  '+
                     ' CODTIPORECEBEDOR,   DATAFIMRECEB,    IDRESPONNAOREC )                     '+
                     ' SELECT                                                                    '+
                     ' B.IDTITULAR,        B.IDPESSJUR,     '+IntToStr(piIdPlanoDestino)+',      '+
                     ' DECODE(B.IDTITULAR,B.IDPESSOA, '+IntToStr(piIdPlanoDestino)+', B.IDPLANOPREV) ,'+
                     ' B.IDPESSOA,         B.IDRESPONSAVEL, BT.IDBENEFDEST,    B.SEQPROPOSTA,     '+
                     ' B.IDDEPENRESPON,    B.PRIORIDADE,    B.PERCENTUAL,     B.IDNUCLEOFAMILIAR,'+
                     ' B.CODTIPORECEBEDOR, B.DATAFIMRECEB,  B.IDRESPONNAOREC                     '+
                     ' FROM   BFCIARIOTITPLAN B, BENEFTRANSFPLANO BT                             '+
                     ' WHERE  B.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                     ' AND    B.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    B.IDTITULAR        = '+IntToStr(piIdTitular)     +
                     ' AND    B.IDPESSOA         = '+IntToStr(piIdPessoa)      +
                     ' AND    B.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                     ' AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador          +
                     ' AND    BT.IDPLANOORIGEM   = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    BT.IDBENEFORIGEM   = B.IDBENEFICIO ');

      try
         qryAux.execsql;
      except
         MsgDlg('Erro ao inserir benefícios do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;

      // Fazer DE-PARA de beneficios na BENEFBFCIARIO
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add(' INSERT INTO BENEFBFCIARIO (                                               '+
                     ' NUMEROPROCESSO,        IDPLANOPREV,          IDPLANOORIGEM,       IDTITULAR,           '+
                     ' IDPESSJUR,             IDBENEFICIO,          IDPESSOA,            PLANO,               '+
                     ' SEQPROPOSTA,           IDDEPENDENCIA,        IDSITBENEFICIO,      IDTPPAGTOBENEFIC,    '+
                     ' DATAFINAL,             VALORATUAL,           CODPORTFORMA,        DATAREQUERIMENTO,    '+
                     ' DATAINICIO,            TMPPAGTOBENEFICIO,    FLGFORMAPAGTO,       VALORCALCULADO,      '+
                     ' DATAULTREAJUSTE,       ULTMESPREPARO,        VLRCALCINSS,         VLRINFINSS,          '+
                     ' DATAINICIOINSS,        NUMPROCINSS,          DATAINICIOFUND,      FLGBENEFMIN,         '+
                     ' VALORCOTAS,            VALORTOTAL,           DATACONCESSAO,       DATAENCERRAMENTO,    '+
                     ' FLGPROVISORIO,         PERCPROVISORIO,       PRAZOPROVISORIO,     NUMCARTARECAD,       '+
                     ' DATAEMISSAORECAD,      DATALIMITERECAD,      DATARECEBRECAD,      FLGSTATUS,           '+
                     ' BANCOINSS,             MESRECIBOINSS,        ANORECIBOINSS,       FONTEPAGADORA,       '+
                     ' IDAGENCIARESGATE,      ULTMESREAJUSTE,       ULTVALORATUALREAJ,   ULTVALORBRUTO,       '+
                     ' VALORABONO13,          DIBBENEFANT,          FLGDATAPREVISTA,     DATAFINALPREVISTA,   '+
                     ' DFLOATPAGTO,           FLGTIPOINSS,          VALORBENEFANT,       FLGENCERRAPORFALE,   '+
                     ' DATAULTREVISAO,        FLGDESCIRMES,         PERCENTUAL,          VALORNADIB,          '+
                     ' FLGPOSSUIACOMPINSS,    VALORSRB,             IDBENEFREFEREN,      DATALIBERACAO,       '+
                     ' MESPAGLIBERACAO,       IDTITBENEF,           FLGACERTOCBP )                            '+
                     ' SELECT                                                                                 '+
                     ' B.NUMEROPROCESSO,      '+IntToStr(piIdPlanoDestino)+',                                 '+
                     ' DECODE(B.IDTITULAR,B.IDPESSOA, '+IntToStr(piIdPlanoDestino)+', B.IDPLANOPREV) ,        '+
                     ' B.IDTITULAR,                                                                           '+ 
                     ' B.IDPESSJUR,           BT.IDBENEFDEST,       B.IDPESSOA,          B.PLANO,             '+
                     ' B.SEQPROPOSTA,         B.IDDEPENDENCIA,      B.IDSITBENEFICIO,    B.IDTPPAGTOBENEFIC,  '+
                     ' NULL,                  B.VALORATUAL,         B.CODPORTFORMA,      B.DATAREQUERIMENTO,  '+
                     ' TO_DATE('''+dtDataTRANSACAO.Text+''',''DD/MM/YYYY'') ,                                 '+ 
                     ' B.TMPPAGTOBENEFICIO,  B.FLGFORMAPAGTO,       B.VALORCALCULADO,                         '+
                     ' B.DATAULTREAJUSTE,     B.ULTMESPREPARO,      B.VLRCALCINSS,       B.VLRINFINSS,        '+
                     ' B.DATAINICIOINSS,      B.NUMPROCINSS,        B.DATAINICIOFUND,    B.FLGBENEFMIN,       '+
                     ' B.VALORCOTAS,          B.VALORTOTAL,         SYSDATE,                                  '+ 
                     ' B.DATAENCERRAMENTO,                                                                    '+
                     ' B.FLGPROVISORIO,       B.PERCPROVISORIO,     B.PRAZOPROVISORIO,   B.NUMCARTARECAD,     '+
                     ' B.DATAEMISSAORECAD,    B.DATALIMITERECAD,    B.DATARECEBRECAD,    B.FLGSTATUS,         '+
                     ' B.BANCOINSS,           B.MESRECIBOINSS,      B.ANORECIBOINSS,     B.FONTEPAGADORA,     '+
                     ' B.IDAGENCIARESGATE,    B.ULTMESREAJUSTE,     B.ULTVALORATUALREAJ, B.ULTVALORBRUTO,     '+
                     ' B.VALORABONO13,        B.DIBBENEFANT,        B.FLGDATAPREVISTA,   B.DATAFINALPREVISTA, '+
                     ' B.DFLOATPAGTO,         B.FLGTIPOINSS,        B.VALORBENEFANT,     B.FLGENCERRAPORFALE, '+
                     ' B.DATAULTREVISAO,      B.FLGDESCIRMES,       B.PERCENTUAL,        B.VALORNADIB,        '+
                     ' B.FLGPOSSUIACOMPINSS,  B.VALORSRB,           B.IDBENEFREFEREN,    B.DATALIBERACAO,     '+
                     ' B.MESPAGLIBERACAO,     B.IDTITBENEF,         B.FLGACERTOCBP                            '+
                     ' FROM   BENEFBFCIARIO B, BENEFTRANSFPLANO BT                                            '+
                     ' WHERE  B.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                     ' AND    B.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    B.IDTITULAR        = '+IntToStr(piIdTitular)     +
                     ' AND    B.IDPESSOA         = '+IntToStr(piIdPessoa)      +
                     ' AND    B.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                     ' AND    B.IDSITBENEFICIO IN (1,2)                       '+
                     ' AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador          +
                     ' AND    BT.IDPLANOORIGEM   = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    BT.IDBENEFORIGEM   = B.IDBENEFICIO ');

      try
         qryAux.execsql;
      except
         MsgDlg('Erro ao inserir benefícios do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
         Exit;
      end;

      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add(' SELECT BF.NUMEROPROCESSO, BF.IDBENEFICIO, BF.VALORATUAL, BF.VALORTOTAL, '+
                     '        BF.IDSITBENEFICIO, BF.VALORCOTAS, BF.DATAINICIOFUND, BF.DATAFINAL,   '+
                     '        BF.FLGDATAPREVISTA, BT.IDBENEFDEST             '+
                     ' FROM BENEFBFCIARIO BF, BENEFTRANSFPLANO BT               '+
                     ' WHERE  BF.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                     ' AND    BF.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    BF.IDTITULAR        = '+IntToStr(piIdTitular)     +
                     ' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa)      +
                     ' AND    BF.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                     ' AND    BF.IDSITBENEFICIO IN (1,2)                       ' +
                     ' AND    BT.IDPLANOORIGEM     = BF.IDPLANOPREV              '+
                     ' AND    BT.IDBENEFORIGEM     = BF.IDBENEFICIO              ');

      qryAux.Open;
      while not qryAux.Eof do
      begin

         // Encerrar beneficio no plano anterior
         dtmAPrev.qry.Close;
         dtmAPrev.qry.SQL.Clear;
         dtmAPrev.qry.SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3, DATAFINAL = TO_DATE(''' + FormatDateTime('dd/mm/yyyy',StrToDate(dtDataTRANSACAO.Text)-1) + ''',''DD/MM/YYYY'') ' + 
                        ' WHERE  IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                        ' AND    IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                        ' AND    IDTITULAR        = '+IntToStr(piIdTitular)     +
                        ' AND    IDPESSOA         = '+IntToStr(piIdPessoa)      +
                        ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                        ' AND    IDBENEFICIO      = '+qryAux.FieldByName('IDBENEFICIO').AsString+
                        ' AND    NUMEROPROCESSO   = '+qryAux.FieldByName('NUMEROPROCESSO').AsString);

         try
            dtmAPrev.qry.ExecSQL;
         except
            MsgDlg('Erro ao encerrar benefícios do plano origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
            Exit;
         end;

         try
            CriaLogOcorrencia( IntToStr(piIdPlanoOrigem),
                               IntToStr(piIdPessJur),
                               IntToStr(piIdTitular),
                               qryAux.FieldByName('IDBENEFICIO').AsString,
                               qryAux.FieldByName('NUMEROPROCESSO').AsString,
                               IntToStr(piIdPessoa),
                               IntToStr(piSeqProposta),
                               '4', 
                               FormatDateTime('dd/mm/yyyy', Date), 
                               OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                               OraNumero(qryAux.FieldByName('VALORTOTAL').AsString),
                               OraNumero(qryAux.FieldByName('VALORCOTAS').AsString),
                               qryAux.FieldByName('DATAINICIOFUND').AsString,
                               FormatDateTime('dd/mm/yyyy', StrToDate(dtDataTRANSACAO.Text)-1), 
                               OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                               qryAux.FieldByName('DATAINICIOFUND').AsString,
                               qryAux.FieldByName('DATAFINAL').AsString,
                               qryAux.FieldByName('IDSITBENEFICIO').AsString,
                               qryAux.FieldByName('FLGDATAPREVISTA').AsInteger,
                               dtmAPrev.qry,
                               '7', // motivo = outros
                               qryLote.FieldByName('IDLOTE').AsInteger,
                               iIdCalculo
                               );
         except
            MsgDlg('Erro ao inserir movimento no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
            Exit;
         end;


         try
            CriaLogOcorrencia( IntToStr(piIdPlanoDestino),
                               IntToStr(piIdPessJur),
                               IntToStr(piIdTitular),
                               qryAux.FieldByName('IDBENEFDEST').AsString,
                               qryAux.FieldByName('NUMEROPROCESSO').AsString,
                               IntToStr(piIdPessoa),
                               IntToStr(piSeqProposta),
                               '7', 
                               FormatDateTime('dd/mm/yyyy', Date), 
                               OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                               OraNumero(qryAux.FieldByName('VALORTOTAL').AsString),
                               OraNumero(qryAux.FieldByName('VALORCOTAS').AsString),
                               dtDataTRANSACAO.Text,
                               '',
                               OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                               qryAux.FieldByName('DATAINICIOFUND').AsString,
                               qryAux.FieldByName('DATAFINAL').AsString,
                               qryAux.FieldByName('IDSITBENEFICIO').AsString,
                               qryAux.FieldByName('FLGDATAPREVISTA').AsInteger,
                               dtmAPrev.qry,
                               '7', 
                               qryLote.FieldByName('IDLOTE').AsInteger,
                               iIdCalculo
                               );
         except
            MsgDlg('Erro ao inserir movimento no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
            Exit;
         end;

         qryAux.Next;
      end;
   end;
   Result := True;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if rdgrpOpPart.itemindex = 0 then
  begin
     MontaSelectPart.Executar;

     if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
     then MontaInformacoesParticipante (StrToInt(MontaSelectPart.ValoresChave[1]),
                                        StrToInt(MontaSelectPart.ValoresChave[2]),
                                        StrToInt(MontaSelectPart.ValoresChave[0]),
                                        StrToInt(MontaSelectPart.ValoresChave[0]),
                                        1)
     else MontaInformacoesParticipante (-1, -1,-1, -1,-1);
  end
  else
  begin
     MontaSelectBenef.Executar;

     if (MontaSelectBenef.ValoresChave.Count > 0) and (MontaSelectBenef.ValoresChave[0] <> '')
     then MontaInformacoesParticipante (StrToInt(MontaSelectBenef.ValoresChave[1]),
                                        StrToInt(MontaSelectBenef.ValoresChave[2]),
                                        StrToInt(MontaSelectBenef.ValoresChave[0]),
                                        StrToInt(MontaSelectPart.ValoresChave[18]),
                                        1)
     else MontaInformacoesParticipante (-1, -1,-1, -1,-1);
  end;

end;

procedure TfrmEventoTransfPlanoNOVO.edCampoBuscaExit(Sender: TObject);
begin
   inherited;
   if edCampoBusca.Text = '' then Exit;

   if sUltimaMatricula <> Trim(edCampoBusca.Text)
   then begin
      with dtmAPrev.qryAux do
      begin
         if rdgrpOpPart.itemindex = 0 then
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA '+
                    ' FROM   ELEGPATRO EL, PARTPREVPLAN PP             '+
                    ' WHERE  EL.MATRICULA LIKE '''+Trim(edCampoBusca.Text)+'%'''+
                    ' AND    PP.IDPESSJUR = EL.IDPESSJUR '+
                    ' AND    PP.IDPESSOA = EL.IDPESSOA ');
            Open;
            if not IsEmpty
            then MontaInformacoesParticipante ( FieldByName('IDPESSJUR').AsInteger,
                                                FieldByName('IDPLANOPREV').AsInteger,
                                                FieldByName('IDPESSOA').AsInteger,
                                                FieldByName('IDPESSOA').AsInteger,
                                                1)
            else MontaInformacoesParticipante (-1, -1,-1, -1, -1);
         end
         else
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT BENEFBFCIARIO.IDPESSJUR, BENEFBFCIARIO.IDPLANOPREV, BENEFBFCIARIO.IDPESSOA, BENEFBFCIARIO.IDTITULAR '+
                    ' FROM   BENEFBFCIARIO, PESSOAFISICA,  DEPENTIT          '+
                    ' WHERE  (DEPENTIT.MATRICULA LIKE '''+Trim(edCampoBusca.Text)+'%'') AND '+
                    ' (  BENEFBFCIARIO.IDPESSOA <> BENEFBFCIARIO.IDTITULAR   ) AND '+
                    ' (  PESSOAFISICA.IDPESSOA = BENEFBFCIARIO.IDTITULAR   ) AND '+
                    ' (  TRUNC(NVL(PESSOAFISICA.DATAMORTE,SYSDATE)) < TRUNC(SYSDATE)  ) AND '+
                    ' (  DEPENTIT.IDPESSOA = BENEFBFCIARIO.IDPESSOA   ) AND '+
                    ' (  DEPENTIT.IDTITULAR = BENEFBFCIARIO.IDTITULAR   )  ');
            Open;
            if not IsEmpty
            then MontaInformacoesParticipante ( FieldByName('IDPESSJUR').AsInteger,
                                                FieldByName('IDPLANOPREV').AsInteger,
                                                FieldByName('IDPESSOA').AsInteger,
                                                FieldByName('IDTITULAR').AsInteger,
                                                1)
            else MontaInformacoesParticipante (-1, -1,-1, -1, -1);
         end;
      end;
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnAnteriorClick(Sender: TObject);
begin
  inherited;
  dec(iEtapaAtiva);
  
  if pgctrlEtapas.ActivePage      = tbsEtapa2
  then begin
     tbsEtapa1.TabVisible         := True;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa1;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa3
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := True;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa2;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa4
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := True;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa3;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa5
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := True;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa4;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa6
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := True;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa5;
  end;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbNovoPlano.Text) = ''
  then begin
     MsgDlg('Selecione o Plano Destino.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Etapa 1 : Procurar participante
  // Etapa 2 : Informacoes de Entrada ( do Tipo Banco ou Regra )
  // Etapa 3 : Opcoes
  // Etapa 4 : Informacoes de Entrada ( do Tipo Informado )
  // Etapa 5 : Estimativas
  // Etapa 6 : Relatorios
  // Etapa 7 : Migracao
  if pgctrlEtapas.ActivePage      = tbsEtapa1
  then begin
     frmAguarde.Apaga;
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := True;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa2;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa2
  then begin
     frmAguarde.Apaga;
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := True;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa3;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa3
  then begin
     frmAguarde.Apaga;
     if Trim(edOpcao.Text) = ''
     then begin
        MsgDlg('Selecione uma das opções.','Erro',mtError,[mbOk,mbHelp],0);
        edOpcao.SetFocus;
        Exit;
     end;

     if qryInputTransfPlano.IsEmpty
     then begin
        frmAguarde.Apaga;
        lblEstimativa.Caption        := 'Estimativas para a Opção '+Trim(edOpcao.Text)+'...';
        tbsEtapa1.TabVisible         := False;
        tbsEtapa2.TabVisible         := False;
        tbsEtapa3.TabVisible         := False;
        tbsEtapa4.TabVisible         := False;
        tbsEtapa5.TabVisible         := True;
        tbsEtapa6.TabVisible         := False;
        pgctrlEtapas.ActivePage      := tbsEtapa5;
     end
     else begin
        tbsEtapa1.TabVisible         := False;
        tbsEtapa2.TabVisible         := False;
        tbsEtapa3.TabVisible         := False;
        tbsEtapa4.TabVisible         := True;
        tbsEtapa5.TabVisible         := False;
        tbsEtapa6.TabVisible         := False;
        pgctrlEtapas.ActivePage      := tbsEtapa4;
     end;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa4
  then begin
     if dtmRelTransfPlano.qryInfDigitadas.UpdatesPending  then dtmRelTransfPlano.qryInfDigitadas.CancelUpdates;

     with qryInputTransfPlano do
     begin
        First;
        while not Eof do
        begin
           dtmRelTransfPlano.qryInfDigitadas.Append;
           dtmRelTransfPlano.qryInfDigitadas.FieldByName('NOMEINPUT').AsString  := FieldByName('DESCRICAO').AsString;
           dtmRelTransfPlano.qryInfDigitadas.FieldByName('VALORINPUT').AsString := FieldByName('VALOR').AsString;
           dtmRelTransfPlano.qryInfDigitadas.Post;
           Next;
        end;
     end;

     frmAguarde.Apaga;
     lblEstimativa.Caption        := 'Estimativas para a Opção '+Trim(edOpcao.Text)+'...';
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := True;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa5;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa5
  then begin
     frmAguarde.Apaga;
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := True;
     pgctrlEtapas.ActivePage      := tbsEtapa6;
  end;

  inc(iEtapaAtiva);

  if pgctrlEtapas.ActivePage = tbsEtapa2
  then ExecutaEtapa2 // informar dados de entrada
  else if pgctrlEtapas.ActivePage = tbsEtapa3
  then begin
     ExecutaEtapa3ou5('B'); // calcular bases de calculo
     ExecutaEtapa3ou5('O'); // calcular opcoes
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa4
  then ExecutaEtapa4
  else if pgctrlEtapas.ActivePage = tbsEtapa5
  then ExecutaEtapa3ou5('E');// calcular estimativas


end;

procedure TfrmEventoTransfPlanoNOVO.FormShow(Sender: TObject);
begin
  inherited;

  iIdCalculoGeral := -1;

  qryPlanoDestino.Close;
  qryPlanoDestino.ParamByName('IDPESSJUR').AsInteger := -1;
  qryPlanoDestino.Open;

  qrySitPlanoOrigem.Close;
  qrySitPlanoOrigem.ParamByName('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoOrigem.Open;

  qrySitPlanoDestino.Close;
  qrySitPlanoDestino.Open;

  qryLote.Close;
  qryLote.Open;

  lblTituloEtapa2.Caption      := '';
  lblTituloEtapa3.Caption      := '';
  lblTituloEtapa4.Caption      := '';
  lblTituloEtapa5.Caption      := '';

  tbsEtapa1.TabVisible         := True;
  tbsEtapa2.TabVisible         := False;
  tbsEtapa3.TabVisible         := False;
  tbsEtapa4.TabVisible         := False;
  tbsEtapa5.TabVisible         := False;
  tbsEtapa6.TabVisible         := False;
  pgctrlEtapas.ActivePage      := tbsEtapa1;

 with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT DATADADOS FROM EVENTOGERADOR WHERE IDEVENTOGERADOR = '+sIdEventoGerador);
     Open;
  end;

  if (qryAux.IsEmpty) or (qryAux.FieldByName('DATADADOS').AsString = '') Then
    dtDataREF.Text := FormatDateTime('dd/mm/yyyy', Date) 
  else
    dtDataREF.Text := qryAux.FieldByName('DATADADOS').AsString;

  if dtDataRef.Enabled
  then dtDataRef.Color := clWhite
  else dtDataRef.Color := clSilver;
  
  memOpcoes.Lines.Clear;
  MontaInformacoesParticipante (-1, -1,-1, -1, -1);
  dtDATATRANSACAO.Text := FormatDateTime('dd/mm/yyyy', Date); 

  sUltimaMatricula := '';

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryPlanoDestino.Close;
  qryPlanoDestino.ParamByName('IDPESSJUR').AsInteger := -1;
  qryPlanoDestino.Open;
  lblTituloEtapa2.Caption := '';
  lblTituloEtapa3.Caption := '';
  lblTituloEtapa4.Caption  := '';
  lblTituloEtapa5.Caption  := '';

  tbsEtapa1.TabVisible         := True;
  tbsEtapa2.TabVisible         := False;
  tbsEtapa3.TabVisible         := False;
  tbsEtapa4.TabVisible         := False;
  tbsEtapa5.TabVisible         := False;
  tbsEtapa6.TabVisible         := False;
  pgctrlEtapas.ActivePage      := tbsEtapa1;
  memOpcoes.Lines.Clear;
  MontaInformacoesParticipante (-1, -1,-1, -1, -1);

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnEfetuaMigracaoClick(
  Sender: TObject);
var sProximoAnoMes : string;
    dAux           : double;
begin
  inherited;
  tbsConfirmacao.TabVisible := True;
  pgctrlEtapas.ActivePage   := tbsConfirmacao;
  tbsEtapa6.TabVisible      := False;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnConfirmacaoFinalClick(
  Sender: TObject);
var sMsgErro : string;
begin
  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.FormActivate(Sender: TObject);
begin
  inherited;

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnPrintOpcoesClick(Sender: TObject);
begin
  inherited;
  with dtmRelTransfPlano do
  begin
    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;
    DsgnCM.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'Planus - Simulador de Migração de Plano');
  end;
end;

procedure TfrmEventoTransfPlanoNOVO.FormCreate(Sender: TObject);
begin
  inherited;
  iEtapaAtiva := -1;
end;

procedure TfrmEventoTransfPlanoNOVO.dbgrdInputTransfPlanoFieldChanged(
  Sender: TObject; Field: TField);
var sSQL,
    sResultRegra,
    sSQLInput,
    sValor       : string;
    bErro        : boolean;
begin

  if pgctrlEtapas.ActivePage <> tbsEtapa4
  then begin
     inherited;
     Exit;
  end;

  // Executar regra de validacao
  if qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString = '' then Exit;
  if qryInputTransfPlano.FieldByName('VALOR').AsString         = '' then Exit;
  if bMontandoDefault                                               then Exit;

  sValor := qryInputTransfPlano.FieldByName('VALOR').AsString;

  if qryInputTransfPlano.FieldByName('TIPODADO').AsString = 'N'
  then sValor := OraNumero(sValor);

  // Preencher query para executar regra de calculo
  with qryInfBanco do
  begin
     First;
     while not Eof do
     begin
        if (FieldByName('NOMEPARAREGRA').AsString <> '')
        then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);
        Next;
     end;
  end;

  sSQL := ' SELECT '''+sValor+''' AS VALOR,                                                           '+
          Trim(edOpcao.Text)+' AS OPCAO,                                                              '+
          '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
          '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
          '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
          '        EL.TEMPOSITESPECIAL                                                                '+
          sSQLInput+
          '       ,S.SALPARTICIPACAO     AS VALORPROVENTO,                      '+
          '        S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,     '+
          '        S.MATRICULA,          S.IDADEAPOS,                           '+
          '        DECODE(S.SITUACAO, ''FL'', DECODE(S.IDPESSOA, S.IDTITULAR, S.SITUACAO, ''AS''), ''AS'', S.SITUACAO) AS SITUACAO, '+
          '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
          '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
          '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
          '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA,                      '+
          '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
          '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
          '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
          '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,        '+
          '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
          '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
          '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
          '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+
          '        '''+qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString+''' AS DATAREF           '+
          ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
          ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
          ' AND    S.IDPESSJUR        = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString      +
          ' AND    S.IDPLANOPREV      = '+qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString    +
          ' AND    S.IDPESSOA         = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString       +
          ' AND    S.SEQPROPOSTA      = '+qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString    +
          ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
          ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
          ' AND    EL.IDPESSOA        = S.IDTITULAR                                                   ';

  sResultRegra := RodaRegraValida (qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString,
                                   sSQL,
                                   bErro,
                                   iIdCalculoGeral);

  if UpperCase(Trim(sResultRegra)) = 'FALSE'
  then begin
     MsgDlg('O valor digitado não é permitido. ','Erro', mtError, [mbOk], 0);
     dbgrdInputTransfPlano.DataSource.DataSet.Cancel;
     Abort;
  end;

  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.rpDemonstrativoBeforePrint(
  Sender: TObject);
begin
  if (qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString = 'AT') OR
     (qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString = 'MA')
  then dtmRelTransfPlano.ppSumarioObs1.NewPage := True
  else dtmRelTransfPlano.ppSumarioObs1.NewPage := False;

  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.dbgrdInputTransfPlanoColExit(
  Sender: TObject);
var sSQL,
    sResultRegra,
    sSQLInput,
    sValor       : string;
    bErro        : boolean;
begin

  if (dbgrdInputTransfPlano.SelectedField.FieldName = 'VALOR') and (not bMontandoDefault)
  then begin
      if pgctrlEtapas.ActivePage <> tbsEtapa4
      then begin
         inherited;
         Exit;
      end;

      // Executar regra de validacao
      if qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString = '' then Exit;
      if qryInputTransfPlano.FieldByName('VALOR').AsString         = '' then Exit;

      sValor := qryInputTransfPlano.FieldByName('VALOR').AsString;

      if qryInputTransfPlano.FieldByName('TIPODADO').AsString = 'N'
      then sValor := OraNumero(sValor);

      // Preencher query para executar regra de calculo
      with qryInfBanco do
      begin
         First;
         while not Eof do
         begin
            if (FieldByName('NOMEPARAREGRA').AsString <> '')
            then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);
            Next;
         end;
      end;

      sSQL := ' SELECT '''+sValor+''' AS VALOR,                                                           '+
              Trim(edOpcao.Text)+' AS OPCAO,                                                              '+
              '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
              '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
              '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
              '        EL.TEMPOSITESPECIAL                                                                '+
              sSQLInput+
              '       ,S.SALPARTICIPACAO     AS VALORPROVENTO,                      '+
              '        S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA,     '+
              '        S.MATRICULA,          S.IDADEAPOS,                           '+
              '        DECODE(S.SITUACAO, ''FL'', DECODE(S.IDPESSOA, S.IDTITULAR, S.SITUACAO, ''AS''), ''AS'', S.SITUACAO) AS SITUACAO, '+
              '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL,             '+
              '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO,                        '+
              '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO,                        '+
              '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA,                      '+
              '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL,                     '+
              '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB,                     '+
              '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT,                         '+
              '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT,        '+
              '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS,                          '+
              '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA,                       '+
              '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,                            '+
              '        S.CAMPOOP4,           S.CAMPOOP5,                                                  '+
              '        '''+qryDadosNoPlanoOrigem.FieldByName('DATAREF').AsString+''' AS DATAREF           '+
              ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG                                   '+
              ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
              ' AND    S.IDPESSJUR        = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsString      +
              ' AND    S.IDPLANOPREV      = '+qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsString    +
              ' AND    S.IDPESSOA         = '+qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsString       +
              ' AND    S.SEQPROPOSTA      = '+qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsString    +
              ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
              ' AND    EL.IDPESSJUR       = S.IDPESSJUR                                                   '+
              ' AND    EL.IDPESSOA        = S.IDTITULAR                                                   ';

      sResultRegra := RodaRegraValida (qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString,
                                       sSQL,
                                       bErro,
                                       iIdCalculoGeral);

      if UpperCase(Trim(sResultRegra)) = 'FALSE'
      then begin
         MsgDlg('O valor digitado não é permitido. ','Erro', mtError, [mbOk], 0);
         dbgrdInputTransfPlano.DataSource.DataSet.Cancel;
         Abort;
      end;

  end;

  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnPrintTermoClick(Sender: TObject);
begin
  inherited;

  if qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString = 'AT'
  then begin
      with dtmRelTransfPlano.qryTermoAtivo do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnATIVOS.Report.Template.SaveTo   := stFile;
        DsgnATIVOS.Report.Template.Format   := ftASCII;
        DsgnATIVOS.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnATIVOS.Report, 'Planus - Termo de Migração para Ativos');
      end;
  end
  else  if qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString = 'AS'
  then begin
      with dtmRelTransfPlano.qryTermoAssist do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnAssist.Report.Template.SaveTo   := stFile;
        DsgnAssist.Report.Template.Format   := ftASCII;
        DsgnAssist.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnAssist.Report, 'Planus - Termo de Migração para Assistidos');
      end;
  end
  else if qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString = 'MA'
  then begin
      with dtmRelTransfPlano.qryTermoMantido do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnMantido.Report.Template.SaveTo   := stFile;
        DsgnMantido.Report.Template.Format   := ftASCII;
        DsgnMantido.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnMantido.Report, 'Planus - Termo de Migração para Autopatrocinados');
      end;
  end
  else if qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger
  then begin
      with dtmRelTransfPlano.qryTermoPensao do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnPensao.Report.Template.SaveTo   := stFile;
        DsgnPensao.Report.Template.Format   := ftASCII;
        DsgnPensao.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnPensao.Report, 'Planus - Termo de Migração para Pensionistas');
      end;
  end;
end;

procedure TfrmEventoTransfPlanoNOVO.InserePreviaMigraPlano ( psCodCampoMigra, psValorItem, psDescricao : string ) ;
begin
   if qryPreviaMigra.Locate('CODCAMPOMIGRA', psCodCampoMigra,[])
   then begin
      qryPreviaMigra.Edit;
      if (psValorItem <> 'S')               and
         (psValorItem <> 'N')               and
         (psCodCampoMigra <> 'DATATRANSF')  and
         (psCodCampoMigra <> 'SITUACAO')    and
         (psCodCampoMigra <> 'IDBENEF')     and
         (psCodCampoMigra <> 'DATABASE')
      then qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat  := StrToFloat(ClienteNumero(psValorItem))
      else qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString := psValorItem;
      qryPreviaMigra.Post;
   end
   else begin
      qryPreviaMigra.Append;
      qryPreviaMigra.FieldByName('IDPESSJUR').AsInteger    := qryDadosNoPlanoOrigem.FieldByName('IDPESSJUR').AsInteger;
      qryPreviaMigra.FieldByName('IDPLANOPREV').AsInteger  := qryDadosNoPlanoOrigem.FieldByName('IDPLANOPREV').AsInteger;
      qryPreviaMigra.FieldByName('IDPESSOA').AsInteger     := qryDadosNoPlanoOrigem.FieldByName('IDPESSOA').AsInteger;
      qryPreviaMigra.FieldByName('SEQPROPOSTA').AsInteger  := qryDadosNoPlanoOrigem.FieldByName('SEQPROPOSTA').AsInteger;
      qryPreviaMigra.FieldByName('IDPLANODEST').AsInteger  := qryPlanoDestino.FieldByName('IDPLANOPREV').AsInteger;
      if (psValorItem <> 'S')              and
         (psValorItem <> 'N')              and
         (psCodCampoMigra <> 'DATATRANSF') and
         (psCodCampoMigra <> 'SITUACAO')   and
         (psCodCampoMigra <> 'IDBENEF')    and
         (psCodCampoMigra <> 'DATABASE')
      then qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat  := StrToFloat(ClienteNumero(psValorItem))
      else qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString := psValorItem;

      qryPreviaMigra.FieldByName('DESCRICAO').AsString     := psDescricao;
      qryPreviaMigra.FieldByName('CODCAMPOMIGRA').AsString := psCodCampoMigra;
      qryPreviaMigra.Post;
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.rdgrpOpPartClick(Sender: TObject);
begin
  inherited;
  if rdgrpOpPart.itemindex = 0 then
  begin
     lblValores.caption := 'Selecione o Participante Titular ';
     Label2.caption := 'Situação Atual do Participante';
     tbsEtapa2.caption := 'Dados do Participante';
  end
  else
  begin
     lblValores.caption := 'Selecione o Beneficiário ';
     Label2.caption := 'Situação Atual do Beneficiário';
     tbsEtapa2.caption := 'Dados do Beneficiário';     
  end;

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnEfetivaMigracaoClick(Sender: TObject);
var
sMsgErro : string;
begin
  inherited;

  if ( (qryDadosNoPlanoOrigem.FieldByName('SITUACAO').AsString  = 'AS') or
       (qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger <> qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger) ) and
     ( (dblkpcmbLote.Text = '') )
  then begin
     MsgDlg('Indique o Lote para Pagamento de Benefícios. ','Erro',mtError,[mbOK],0);
     Exit;
  end;

  dtmBasedados.dbBaseDados.StartTransaction;

  if not TransfPlano ( qryDadosNoPlanoOrigem.FieldbyName('IDPESSJUR').AsInteger,
                       qryDadosNoPlanoOrigem.FieldbyName('IDPLANOPREV').AsInteger,
                       qryPlanoDestino.FieldByName('IDPLANOPREV').AsInteger,
                       qryDadosNoPlanoOrigem.FieldbyName('IDTITULAR').AsInteger,
                       qryDadosNoPlanoOrigem.FieldbyName('IDPESSOA').AsInteger,
                       qryDadosNoPlanoOrigem.FieldbyName('SEQPROPOSTA').AsInteger )
  then begin
     dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Transferência de Plano não efetivada.','Erro',mtError,[mbOK],0);
     Exit;
  end;
   if not RODAPADRAOMOVRESERVA
        (  StrToInt(siPessJur)  ,
           StrToInt(sIdPlanoPrev) ,
           StrToInt(sidpessoa) ,
           1,
          -1,
          StrToint(sIdEventoGerador),
          StrToInt(sIPessJur)  ,
          strtoInt(sIdPlanoPrev) ,
          sFlgInterno,
          dtDataRef.Text,
          sMsgErro,
          -1  ,
           'O',
           ' ' )
        then begin
           MsgDlg('Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
           Exit;
    end;
  dtmBasedados.dbBaseDados.Commit;
  if rdgrpOpPart.ItemIndex = 0
  then MsgDlg('Transferência de Plano do Participante Efetuada com Sucesso.','Informação',mtInformation,[mbOK],0)
  else MsgDlg('Transferência de Plano do Beneficiário Efetuada com Sucesso.','Informação',mtInformation,[mbOK],0)
end;

procedure TfrmEventoTransfPlanoNOVO.dblkpcmbNovoPlanoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryAux do
  begin
     Close;
     SQL.Clear;

     if rdgrpOpPart.ItemIndex = 0
     then SQL.Add(' SELECT IDPESSOA FROM PARTPREVPLAN '+
                  ' WHERE  IDPESSOA = '+qryDadosNoPlanoOrigem.FIELDBYNAME('IDPESSOA').ASSTRING+
                  ' AND    IDPLANOPREV = '+qryPlanoDestino.FieldbyName('IDPLANOPREV').AsString)
     else SQL.Add(' SELECT IDPESSOA FROM BFCIARIOTITPLAN '+
                  ' WHERE  IDPESSOA = '+qryDadosNoPlanoOrigem.FIELDBYNAME('IDPESSOA').ASSTRING+
                  ' AND    IDPLANOPREV = '+qryPlanoDestino.FieldbyName('IDPLANOPREV').AsString);
     Open;
  end;

  if (not qryAux.IsEmpty)
  then begin
     if  MsgDlg('A pessoa selecionada já migrou de plano. Deseja rever sua simulação ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
     then begin
        lblTituloEtapa2.Caption  := '';
        lblTituloEtapa3.Caption  := lblTituloEtapa2.Caption;
        lblTituloEtapa4.Caption  := lblTituloEtapa2.Caption;
        lblTituloEtapa5.Caption  := lblTituloEtapa2.Caption;
        edCampoBusca.Text        := '';
        edNome.Text              := '';
        lblPlanoOrigem.Caption      := 'Plano Origem : < não encontrado >';
        lblInscricaoData.Caption    := 'Titular Inscrito desde : < não encontrado >';
        lblFalecido.Caption         := 'Titular Falecido : < não encontrado >';
        lblSitPart.Caption          := 'Situação do Titular na Fundação : < não encontrado >';
        lblBeneficio.Caption        := 'Pessoa Recebendo Benefício : < não encontrado >';
        edCampoBusca.SetFocus;
     end
     else begin
        bbtnEfetuaMigracao.Enabled := False;
     end;
  end;

end;

function TfrmEventoTransfPlanoNOVO.VerificaMigraPlanoEmprestimo ( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa : longint ) : boolean; 
var bMigraRecursoContabil : boolean;
begin
   Result := False;
   bMigraRecursoContabil := False;

   // Verificar se pessoa tem emprestimo aberto ou encerrado ( nao quitado )
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO     '+
                  ' WHERE  IDPATRO     = '+IntToStr(piIdPessJur)     +
                  ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                  ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)      +
                  ' AND    FLGSITUACAO IN (''A'',''E'')             ');
   qryAux.Open;
   if (qryAux.IsEmpty) or (qryAux.FieldByName('IDCONTRATOEMPTMO').AsInteger <= 0)
   then begin
      Result := True;
      Exit;
   end;

   if not MsgDlg('O participante possui Contrato de Empréstimo ainda não quitado.'+#13+
                 'Os recursos contábeis deste contrato também serão migrados ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
   then bMigraRecursoContabil := True;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE CONTRATOEMPTMO SET IDPLANOPREV = '+IntToStr(piIdPlanoDestino));
   if bMigraRecursoContabil
   then qryAux.SQL.Add(', IDPLANOORIGEM = '+IntToStr(piIdPlanoDestino));
   
   qryAux.SQL.Add(' WHERE  IDPATRO     = '+IntToStr(piIdPessJur)     +
                  ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                  ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)      );

   try
      qryAux.ExecSQL;
   except
      Exit;
   end;
   Result := True;
end;

end.




