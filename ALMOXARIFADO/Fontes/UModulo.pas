{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizarParametros
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criar mais um parâmetro, o iDiaUtilMensal
-------------------------------------------------------------------------------------------------- }
unit UModulo;

interface

uses SysUtils, grids, wwquery,uFuncaoGeral,uDataBase,DBaseDados, Forms,
     USistema,uIntegraBack, Dialogs, UMensErro, ppCtrls, DRptRelats, uString,
     stdctrls, Windows,graphics, uCMDialogs,uCmControlObject,uCtrlPadroes ;

type TModulo = class(TCmControlObject)
   private

   public
      iConfForneAuto,
      SisCodOrigem : String;
      UnidNegoc : Integer;
      bUsaCRespon : boolean;
      bUsaABC     : boolean;
      bVeioAnalise: boolean;
      iIdNota     : LongInt;
      sEstorna,ObrigaCrespon,ObrigaAbc,sComSemOC,sTipoArtigo,SisRecPag,sCodCResponPadrao : string;
      sDescCResponPadrao : string;
      iUnidadeNegocPadrao : integer;
      sDescUnidadeNegocPadrao : string;
      iIdPessoa : Integer;
      iIdMoedaCorrente : integer;
      bFlagSuperUsuario : Boolean;   //Falta preencher na Autorizacao!!!!
      sLancFinanc,sNomePessoaCompleto : String;
      iEmpresaProp,idAnalise,iPlano   : LongInt;
      iNumReqTransf,iNumEntTransf : LongInt;
      sCodCCusto,
      sDescCCusto   : String; { Centro de Custo fornecido pelo usuario ao entrar}
      sCCustoAlmoxa :String; {Centro de Custo do Almoxarifado fornecido pelo usuario}
      iCodCusteio   : Integer;
      iCodAlmoxa    : Integer; { Almoxarifado fornecido pelo usuario ao entrar}
      sAlmoxaUsuario,sPrincSec : String;
      iCodTipDocPadrao : integer ;
      sMascaraGrupoProd : String; { Mascara que preenche o grupo de produto }
      sExisteDV,
      sExisteCompra,               { Parametro que diz se Existe o Sistema de Compras }
      sExisteCPag       : String; { Parametro que diz se Existe o Sistema de Contas a Pagar}
      sRecebAutomatico,            { Parametro que diz se o Recebimento de Compras
                                     deve ser automatico ou não }
      sCodTabProdUtilizada,        { Tabela de Produto utilizada por Empresa (Opcional)
                                     é identificado pelo primeiro nível da máscara de
                                     Grupo de Produto - se está preenchido então há o controle}
      sTipoAtenPedido,              { Tipo de Atendimento do Pedido :
                                      'AN' - Atendimento normal
                                      'AI'- Atendimento por transf. de Inventário }
      sTipoBaixa,                   { Tipo de Baixa :
                                      'BM' - Baixa de Material
                                      'BI' - Baixa por Inventario }
      sTipoReceCompra     : String; { Tipo de Recebimento :
                                      'RC'- Recebimento de compra
                                      'CI'- Correção de Inventário }
      sTipoInventConsulta,          { Tipo de Consulta de Inventario :
                                      'C' - contagem
                                      'M' - movimento }
      sTipoListaCega,               { 'C'- Contagem
                                      'R'- Recontagem }
      sControle           : String; { 'R' = Contas a Receber; 'P' = Contas a Pagar}
      sCodArtigo          : String; { Codigo do Artigo selecionado pelo AchaArtigo}
      iPercReqMat         : Integer;
      iPercRecebComOC     : Integer;

      idInventarioCorrecao: integer; { Inventario que ira fazer Atendimento por Correcao}
      sSistema : String;
      sMascaraPlano,
      sMascaraDesemb,
      sMascDocFis,sMascDocJur,
      sIntegraContab: String;
      bTipoOper          : Boolean;
      sTrasObs           : String;
      sContabGrupo       : String;
      sContabTransf      : String;
      sCodTipoDoc        : String;
      sIntegraLivro      : String;
      iCodTipoDocDevol   : Integer;
      iIdPatro           : Integer;
      iIdPlanoPrev       : Integer;
      sFlgUsaGrupoReq    : String;
      sFlgInfoValorUN    : String;
      SFlgReqSemSaldo    : String;
      iFlgIntegraOrc     : Integer;
      iIdPrograma        : Integer;
      iCodAlteradorDevol : Integer;
      iDiaUtilMensal     : Integer;
            
      constructor Create; Override;
      procedure AtualizarParametros(IdEmpresa, idUsuario :Integer);
      procedure AtualizarParamIntegracao(idEmpresa:integer);
      Function  VerifCC( pCodArt, pCentCust : String; IdEmpresa : Integer ) : Boolean;
      Function  ConvertCustoMed( unidade:string; codAlmoxarifado :integer; codArtigo :string):single;
      Function  LeUltDataMov : TDateTime;
      Procedure LeContaContabil( sCodArt,sCodCentroCusto :String; Var sContaEnt,sContaSai : String; Var iUnidNegoc : Integer );
      Function  LeGrupoProd( sCodArt : String) : String;
      Function  ExistMov(sCodArt : String) : Boolean;
      Function  LeUnCusteio( iCodAlmox : LongInt ) : LongInt;
      Function  LeSaldo(sCodArt : String; iCodAlmox : LongInt) : Double;
      Function  LeCentCust( iCodAlmox : LongInt ) : String;
      Function  LeDataRepresa     : TDateTime;
      Function  LeDataImplantacao : TDateTime;
      Function  LeUnidade( SCodArt : String ) : String;
      Function  ProdVari( Var sDesc : String ) : LongInt;
      Procedure SetAssinatura;
      Function  LeCodTipRecDes( sGrupoProd : String ) : String;
      Procedure CalcImposto( sCODPRODUTO, sCODUF : String; iIDPAIS, iCODTIPOCUSTAGREG : LongInt; rValorItem : Double; var rBase : Double; var rPerc : Double; var rValorImp : Double);
      Function  ValidaOrcxArt(idReserva : LongInt; sCodArt :String) : Boolean;
      Function  LeCentCustContab(sCodArt : String ): String;
      Function  LeUltNumNotaDevol( idPessoa : Integer ) : LongInt;
      Function  GravaUltNumNotaDevol(idPessoa : Integer; UltNumNotaDevol : longInt ) : Boolean;
      Function  ListAlmox( CodCusteio : Integer ) : String;
      
end;

var Modulo : TModulo;

function LeftStringSubString(sNum : string; iTam : Integer; sSubStr : string) : string;
function RightStringSubString(sNum : string; iTam : Integer; sSubStr : string) : string;
procedure SGrdRemoverLinha(sgrd: TStringGrid; lin: Longint);

implementation

constructor TModulo.Create;
begin
   inherited;
   SisCodOrigem := 'A';
   UnidNegoc := -1;
   sTrasObs  := '';
   iCodTipoDocDevol := -1;   
end;

procedure TModulo.AtualizarParametros( IdEmpresa, idUsuario :Integer);
var sSql : String;
begin
      //Thaise Amaral - SOL 136124
      //Adicionar um parâmetro ao Módulo, que seria o novo campo DIAUTILMENSAL,
      //carregado na variável iDiaUtilMensal.
      sSql := ' SELECT IDPESSOA,CODALTDEVOLUCAO,CODTIPDOC,MASCGRUPOPROD,EXISTEDV, '+
              '        EXISTECOMPRA,RECEBAUTOMATICO,CODTABPRODUTIL,EXISTECONTASPAGAR, '+
              '        EXISTECONTABIL,FLGINFOVALORUN,FLGCONTABGRUPO,FLGCONTABTRANSF,PERCREQMAT, '+
              '        FLGINTEGRALIVRO, PERCRECEBCOMOC, CODTIPDOCDEVOL,IDPATRO,IDPLANOPREV,'+
              '        FLGUSAGRUPOREQ,FLGINTEGRAORC,FLGREQSEMSALDO,IDPROGRAMA,DIAUTILMENSAL '+
              ' FROM  PARALMOX WHERE (IDPESSOA = '+IntToStr(idEmpresa)+')';

      _Cds.Data := GetDataPacket(sSql);

      sMascaraGrupoProd         := _Cds.FieldByName('MASCGRUPOPROD').AsString;
      sExisteDV                 := _Cds.FieldByName('EXISTEDV').AsString;
      sExisteCompra             := _Cds.FieldByName('EXISTECOMPRA').AsString;
      sExisteCPag               := _Cds.FieldByName('EXISTECONTASPAGAR').AsString;
      sRecebAutomatico          := _Cds.FieldByName('RECEBAUTOMATICO').AsString;
      sCodTabProdUtilizada      := _Cds.FieldByName('CODTABPRODUTIL').AsString;
      sCodTipoDoc               := _Cds.FieldByName('CODTIPDOC').AsString;
      IntegraBack.Contabilidade := _Cds.FieldByName('EXISTECONTABIL').AsString;
      sIntegraContab            := _Cds.FieldByName('EXISTECONTABIL').AsString;
      iCodTipDocPadrao          := _Cds.FieldByName('CODTIPDOC').AsInteger;
      sContabGrupo              := _Cds.FieldByName('FLGCONTABGRUPO').AsString;
      sContabTransf             := _Cds.FieldByName('FLGCONTABTRANSF').AsString;
      iPercReqMat               := _Cds.FieldByName('PERCREQMAT').AsInteger;
      sIntegraLivro             := _Cds.FieldByName('FLGINTEGRALIVRO').AsString;
      iPercRecebComOC           := _Cds.FieldByName('PERCRECEBCOMOC').AsInteger;
      iCodTipoDocDevol          := _Cds.FieldByName('CODTIPDOCDEVOL').AsInteger;
      iIdPatro                  := _Cds.FieldByName('IDPATRO').AsInteger;
      iIdPlanoPrev              := _Cds.FieldByName('IDPLANOPREV').AsInteger;
      sFlgUsaGrupoReq           := _Cds.FieldByName('FLGUSAGRUPOREQ').AsString;
      sFlgInfoValorUN           := _Cds.FieldByName('FLGINFOVALORUN').AsString;
      SFlgReqSemSaldo           := _Cds.FieldByName('FLGREQSEMSALDO').AsString;
      iIdPrograma               := _Cds.FieldByName('IDPROGRAMA').AsInteger;
      iCodAlteradorDevol        := _Cds.FieldByName('CODALTDEVOLUCAO').AsInteger;
      iFlgIntegraOrc            := _Cds.FieldByName('FLGINTEGRAORC').AsInteger;
      iDiaUtilMensal            := _Cds.FieldByName('DIAUTILMENSAL').AsInteger;



      sSql := 'SELECT NOME FROM PESSOA WHERE (IDPESSOA = '+IntToStr(idUsuario)+')';

      _Cds.Data := GetDataPacket(sSql);

      sNomePessoaCompleto := _Cds.FieldByName('NOME').AsString;

      sSql := ' Select PL.MASCARA,PC.PLANO from ParamContab Pc, Plano Pl '+
              ' where (Pc.Plano = Pl.Plano) '+
              ' and (Pc.IdPessoa = '+IntToStr(idEmpresa)+')';

      _Cds.Data := GetDataPacket(sSql);

      IntegraBack.MascaraPlano := _Cds.FieldByName('MASCARA').AsString;
      IntegraBack.Plano        := _Cds.FieldByName('PLANO').AsInteger;
      //
      sMascaraPlano            := IntegraBack.MascaraPlano;
      iPlano                   := IntegraBack.Plano;
end;
procedure TModulo.AtualizarParamIntegracao(idEmpresa:integer);
var sSql :string;
begin
      sSql := ' SELECT '+
              '     P.USACRESPON, '+
              '     P.USAABC, '+
              '     P.CODCENTRORESPON, '+
              '     P.UNIDNEGOC, '+
              '     P.MOEDACORRENTE, '+
              '     P.FLGINTEGRAORC, '+
              '     C.nome as desccrespon,'+
              '     U.nome as descunid '+
              ' FROM '+
              '      Paramglobal P,'+
              '      centrespon C, '+
              '      Unidnegocio U '+
              ' WHERE '+
              '      (P.idPessoa ='+IntToStr(idEmpresa) +') '+
              '  AND (P.codcentroRespon = C.codcentroRespon) '+
              '  AND (P.idPessoa  = C.idPessoa)  '+
              '  AND (P.idPessoa  = U.idPessoa)  '+
              '  AND (P.unidnegoc = U.unidnegoc)';

      _Cds.Data := GetDataPacket(sSql);

      if _Cds.FieldByName('USACRESPON').AsString='S' then
         bUsaCRespon :=true
      else
          bUsaCRespon :=False;
      if _Cds.FieldByName('USAABC').AsString='S' then
         bUsaABC:=true
      else
          bUsaABC:=False;
      sCodCResponPadrao           := _Cds.FieldByName('CODCENTRORESPON').AsString ;
      iUnidadeNegocPadrao         := _Cds.FieldByName('UNIDNEGOC').Asinteger ;
      iIdMoedaCorrente            := _Cds.FieldByName('MOEDACORRENTE').Asinteger ;
      sDescCResponPadrao          := _Cds.FieldByName('desccrespon').AsString ;
      sDescUnidadeNegocPadrao     := _Cds.FieldByName('descunid').AsString;
      IntegraBack.IntegraOrcamento:= _Cds.FieldByName('FLGINTEGRAORC').AsString;
end;

function LeftStringSubString(sNum : string; iTam : Integer; sSubStr : string) : string;
var  aux : String;
begin
   aux    := '%' + IntToStr(iTam) + '.' + IntToStr(iTam) + 'd';
   result := format (aux,[StrToInt(sNum)]);
end;

function RightStringSubString(sNum : string; iTam : Integer; sSubStr : string) : string;
begin
   while Length(snum) < itam do
      Begin
         snum := snum + sSubStr;
         result := snum;
      End;
end;

procedure SGrdRemoverLinha(sgrd: TStringGrid; lin: Longint);
var
   i, j: Longint;

begin
   with sgrd do begin
      for i := lin to RowCount-2 do
         for j := 0 to ColCount-1 do
            Cells[j, i] := Cells[j, i+1]
   end; { with }
end;


Function TModulo.VerifCC( pCodArt, pCentCust : String; IdEmpresa : Integer ) : Boolean;
Var
  bOk : Boolean;
  sCodGrupoProd,sDescConta,sObrigaCC,sSubConta:String;
  sPlano, sPlaConta : String;
Begin
   VerifCC := False;
   bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                    '    Plano,          '+
                                    '    ContaEntrada,   '+
                                    '    SubContaEntrada,'+
                                    '    ContaSaida,     '+
                                    '    SubContaSaida,  '+
                                    '    CodCentroCusto  '+
                                    ' From               '+
                                    '    ArtxContaxCC    '+
                                    ' Where              '+
                                    '     (CodArtigo =  '''+Espaco(pCodArt,14) +''') '+
                                    ' And (CodCentroCusto = '''+Espaco(pCentCust,10)+''')'+
                                    ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
   if Not BOk Then
   Begin
      bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                       '    Plano,          '+
                                       '    ContaEntrada,   '+
                                       '    SubContaEntrada,'+
                                       '    ContaSaida,     '+
                                       '    SubContaSaida,  '+
                                       '    CodCentroCusto  '+
                                       ' From               '+
                                       '    ArtxContaxCC    '+
                                       ' Where              '+
                                       '     (CodArtigo =  '''+Espaco(pCodArt,14) +''')' +
                                       ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
      If Not BOk Then
      Begin
         FazQuery(dtmBasedados.qry,' Select               '+
                                   '    CodGrupoProd      '+
                                   ' From                 '+
                                   '     Produto          '+
                                   ' Where                '+
                                   '      ( Rtrim(CodProduto) = Rtrim(SubStr('''+pCodArt+''',1,6)))');
         sCodGrupoProd := dtmBasedados.qry.FieldByName('CodGrupoProd').asString;
         bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                          '    Plano,          '+
                                          '    ContaEntrada,   '+
                                          '    SubContaEntrada,'+
                                          '    ContaSaida,     '+
                                          '    SubContaSaida,  '+
                                          '    CodCentroCusto  '+
                                          ' From               '+
                                          '    ArtxContaxCC    '+
                                          ' Where              '+
                                          '     (CodGrupoProd =  '''+Espaco(sCodGrupoProd,10) +''') '+
                                          ' And (CodCentroCusto = '''+Espaco(pCentCust,10)+''')'+
                                          ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
         If Not BOk Then
         Begin
            bOk := FazQuery(dtmBasedados.qry,' Select             '+
                                             '    Plano,          '+
                                             '    ContaEntrada,   '+
                                             '    SubContaEntrada,'+
                                             '    ContaSaida,     '+
                                             '    SubContaSaida,  '+
                                             '    CodCentroCusto  '+
                                             ' From               '+
                                             '    ArtxContaxCC    '+
                                             ' Where              '+
                                             '     (CodGrupoProd =  '''+Espaco(sCodGrupoProd,10) +''') '+
                                             ' And (IDPESSOA = '+IntToStr(IdEmpresa)+' )');
         End;
      End;
   End;
   If bOk Then
   Begin
      sDescConta:='';
      sObrigaCC :='';
      sSubConta :='';
      FuncaoGeral.TestaContaCC(False,dtmBasedados.qry.FieldByName('PLANO').asInteger,dtmBasedados.qry.FieldByName('ContaSaida').asString,sObrigaCC,sDescConta,sSubConta);
      sPlano          := dtmBasedados.qry.FieldByName('PLANO').asString;
      sPlaConta       := dtmBasedados.qry.FieldByName('ContaSaida').asString;
      if sObrigaCC = 'S' then
         VerifCC := FazQuery(dtmBasedados.qry,' Select               '+
                                              '     CodCentroCusto   '+
                                              ' From                 '+
                                              '     ContasxCC        '+
                                              ' Where                '+
                                              '      (Plano = '+ sPlano + ')'+
                                              '  AND (PlaCONTA = '''+Espaco(sPlaConta,18)+ ''')'+
                                              '  AND (CodCentroCusto = '''+Espaco(pCentCust,10)+''')'+
                                              '  AND (IDEMPRESA = '+intToStr(IdEmpresa)+')')
      Else
         VerifCC :=True;
   End;
End;

Function  TModulo.ConvertCustoMed( unidade:string;codAlmoxarifado :integer;codArtigo :string):single;
Var
   QryCM : TwwQuery;
begin
    QryCM := TwwQuery.Create(Application);
    QryCM.DatabaseName  := 'BASEDADOS';
 try
    QryCM.Close;
    QryCM.Sql.Clear;
    QryCM.Sql.Text:= ' Select (C.CustoMedio*V2.FATOR)/V.FATOR AS CUSTOMEDIO '+
                ' From CustoMed C, Almox AL,ARTIGO A,PRODUTO P,CONVER V,CONVER V2 '+
                ' where (C.CodArtigo = '''+Espaco(codartigo,14)+''') AND '+
                ' (AL.CodAlmoxarifado = '+IntToStr(codalmoxarifado)+') AND '+
                ' (V2.CODMEDIDA='''+unidade+''') AND '+
                ' (C.CODARTIGO=A.CODARTIGO) AND '+
                ' (A.CODPRODUTO=P.CODPRODUTO) AND '+
                ' (C.CodCusteio = AL.CodCusteio) AND '+
                ' (P.CODPRODUTO=V.CODPRODUTO) AND '+
                ' (P.CODMEDCUSTO=V.CODMEDIDA) AND '+
                ' (P.CODPRODUTO=V2.CODPRODUTO) ';
       QryCM.Open;
       Result:=QryCM.fieldByName('CUSTOMEDIO').AsFloat;
   Finally
      qryCM.Free;
   End;
ENd;

Function  TModulo.LeUltDataMov : TDateTime;
Begin
     FazQuery(dtmBasedados.qry,' SELECT '+
                               '     M.DATAMOV '+
                               ' FROM '+
                               '     MOVIMENT M, '+
                               '     (SELECT MAX(IDMOV) AS IDMOV '+
                               '      FROM MOVIMENT '+
                               '      WHERE (CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa)+') ) AUX '+
                               ' WHERE '+
                               '     (M.IDMOV = AUX.IDMOV) ');
    LeUltDataMov := dtmBasedados.qry.FieldByName('DATAMOV').asDateTime;
End;

Function TModulo.LeGrupoProd( sCodArt : String) : String;
Begin
    If FazQuery(dtmBaseDados.qry,'SELECT CODGRUPOPROD FROM PRODUTO WHERE '+
                                 '(CODPRODUTO = '''+Espaco(Trim(copy(sCodArt,1,6)),6)+''')')
    Then
       Begin
           LeGrupoProd := dtmBaseDados.qry.FieldByName('CODGRUPOPROD').asString;
       End
    Else
       LeGrupoProd := '';
End;

Procedure TModulo.LeContaContabil( sCodArt,sCodCentroCusto :String; Var sContaEnt,sContaSai : String; Var iUnidNegoc : Integer );
Var
   sGrupoProd  : String;
Begin
       If FazQuery(dtmBaseDados.qry,' SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                    '(CODARTIGO = '''+Espaco(sCodArt,14)+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
       Then
          Begin
              sContaEnt  := dtmBaseDados.qry.FieldByName('CONTAENTRADA').asString;
              sContaSai  := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
              iUnidNEgoc := dtmBaseDados.qry.FieldByName('UNIDNEGOC').asInteger;
          End
       Else
          Begin
                 sGrupoProd := LeGrupoProd(sCodArt);
                 If FazQuery(dtmBaseDados.qry,'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                              '(CODGRUPOPROD = '''+Espaco(sGrupoProd,10)+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') '+
                                              ' AND (CODCENTROCUSTO = '''+Espaco(sCodCentroCusto,10)+''')' )
                 Then
                    Begin
                        sContaEnt  := dtmBaseDados.qry.FieldByName('CONTAENTRADA').asString;
                        sContaSai  := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
                        iUnidNEgoc := dtmBaseDados.qry.FieldByName('UNIDNEGOC').asInteger;
                    End
                 Else
                 If FazQuery(dtmBaseDados.qry,'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                              '(CODGRUPOPROD = '''+Espaco(sGrupoProd,10)+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
                 Then
                    Begin
                       sContaEnt := dtmBaseDados.qry.FieldByName('CONTAENTRADA').asString;
                       sContaSai := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
                       iUnidNEgoc := dtmBaseDados.qry.FieldByName('UNIDNEGOC').asInteger;
                    End
                 Else
                    Begin
                       sContaEnt  := '';
                       sContaSai  := '';
                       iUnidNEgoc := 0;
                    End;
          End;
End;

Function TModulo.ExistMov(sCodArt : String) : Boolean;
Begin
  Result := Fazquery(DtmBaseDados.qry,' SELECT DISTINCT M.CODARTIGO '+
                                      ' FROM MOVIMENT M'+
                                      ' WHERE (M.CODARTIGO = '''+Espaco(sCodArt,14)+''')');
End;

Function  TModulo.leUnCusteio( iCodAlmox : LongInt ) : LongInt;
Begin
  If Fazquery(DtmBaseDados.qry,' SELECT CODCUSTEIO '+
                               ' FROM  ALMOX A '+
                               ' WHERE '+
                               '       (A.CODALMOXARIFADO = '+IntToStr(iCodAlmox)+') ')
  Then
     Result :=  DtmBaseDados.qry.FieldByName('CODCUSTEIO').asInteger
  Else
     Result  := -1;
End;

Function TModulo.LeSaldo(sCodArt : String; iCodAlmox : LongInt) : Double;
Begin
  If Fazquery(DtmBaseDados.qry,' SELECT SALDOQTDE '+
                               ' FROM  SALDO S '+
                               ' WHERE '+
                               '       (S.CODALMOXARIFADO = '+IntToStr(iCodAlmox)+') '+
                               '   AND (S.CODARTIGO = '''+Espaco(sCodArt,14)+''') ')
  Then
     Result := DtmBaseDados.qry.FieldByName('SALDOQTDE').asFloat
  Else
     Result := 0;
End;

Function TModulo.LeCentCust( iCodAlmox : LongInt ) : String;
Begin
  If Fazquery(DtmBaseDados.qry,' SELECT CODCENTROCUSTO '+
                               ' FROM  ALMOX  '+
                               ' WHERE '+
                               '       (CODALMOXARIFADO = '+IntToStr(iCodAlmox)+') '+
                               '   AND (IDPESSOA =  '+ IntToStr( Sistema.IdEmpresa )+ ')')
  Then
     Result := DtmBaseDados.qry.FieldByName('CODCENTROCUSTO').AsString
  Else
     Result := '';
End;

Function  TModulo.LeDataRepresa : TDateTime;
Begin
    If FazQuery(dtmBasedados.qry, ' SELECT DATAREPRESA '+
                                  ' FROM PARALMOX '+
                                  ' WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
    Then
       Result := dtmBasedados.qry.FieldByName('DATAREPRESA').asDateTime
    Else
       Result := 0;
End;

Function  TModulo.LeDataImplantacao : TDateTime;
Begin
    If FazQuery(dtmBasedados.qry, ' SELECT DATAIMPLANTA '+
                                  ' FROM PARALMOX '+
                                  ' WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
    Then
       Result := dtmBasedados.qry.FieldByName('DATAIMPLANTA').asDateTime
    Else
       Result := 0;
End;
Function  TModulo.LeUnidade( SCodArt : String ) : String;
Begin
 If FazQuery(dtmBasedados.qry, ' SELECT CODMEDCUSTO '+
                               ' FROM PRODUTO '+
                               ' WHERE (RTRIM(CODPRODUTO) = '''+Trim(Copy(SCodArt,1,6))+''')')
    Then
       Result := dtmBasedados.qry.FieldByName('CODMEDCUSTO').asString
    Else
       Result := '';
End;

Function TModulo.ProdVari( Var sDesc : String ) : LongInt;
Var
   ID    : Longint;
   bOk   : Boolean;
   SQL   : String;
Begin
   Result := -1;
   sDesc  := '';
   bOk    :=  True;
   While (Trim(sDesc) = '') And ( bOK ) Do
     Begin
        bOk := InputMemo('Produto de Descrição variável','Descrição',sDesc);
        If  Not bOk Then
           Result := -1
        Else
           Begin
               If( Trim(sDesc) <> '' ) Then
                 Begin
                     SQL := ' SELECT IDPRODVARI,DESCPRODVARI'+
                            ' FROM PRODVARI '+
                            ' WHERE (UPPER(DESCPRODVARI) = '+QuotedStr(Trim(UpperCase(sDesc)))+')';

                     _Cds.Data := GetDataPacket(SQL);
                     IF Not _Cds.IsEmpty Then
                       Begin
                          Result := _Cds.FieldByName('IDPRODVARI').asInteger;
                          sDesc  := _Cds.FieldByName('DESCPRODVARI').asString;
                       End
                     Else
                       Begin
                          ID  := GetSequence('PRODVARI');
                          SQL := 'INSERT INTO PRODVARI (IDPRODVARI,DESCPRODVARI) VALUES('+intToStr(ID)+','+QuotedStr(sDesc)+')';
                          If Not Padroes.ExecSqlAndCommit(SQL) Then
                             Result := -1
                          Else
                             Result := ID;
                       End;
                  End
               Else
                  MessageInfo := 'Descrição não preenchida';
           End;
     End;
End;

Procedure TModulo.SetAssinatura;
Var
  LblRelats: TppLabel;
Begin
    If FazQuery(DtmBaseDados.Qry,' SELECT NOMECOMPO,VALOR '+
                                 ' FROM PARAMRELATS '+
                                 ' WHERE (IDMODULO = 5 ) '+
                                 '   AND (IDPESSOA = '+ IntToStr(Sistema.IdEmpresa)  +') ')
    Then
       Begin
          DtmBaseDados.Qry.First;
          While Not DtmBaseDados.Qry.Eof Do
            Begin
                Try
                  LblRelats := (DtmRptRelats.FindComponent(DtmBaseDados.Qry.FieldByName('NOMECOMPO').AsString) As TppLabel);
                  If LblRelats <> nil Then
                     LblRelats.Caption := DtmBaseDados.Qry.FieldByName('VALOR').AsString;
                 Finally
                  DtmBaseDados.Qry.Next;
                 End;
            End;
       End;
End;

Function  TModulo.LeCodTipRecDes( sGrupoProd : String ) : String;
Begin
    If FazQuery(dtmBaseDados.qry,'SELECT CODTIPRECDES FROM GRUPPROD WHERE '+
                                 '(CODGRUPOPROD = '''+Espaco(sGrupoProd,10)+''')')
    Then
       Begin
           Result := dtmBaseDados.qry.FieldByName('CODTIPRECDES').asString;
       End
    Else
       Result := '';
End;

Procedure TModulo.CalcImposto(sCODPRODUTO, sCODUF : String; iIDPAIS, iCODTIPOCUSTAGREG : LongInt; rValorItem : Double; var rBase : Double; var rPerc : Double; var rValorImp : Double);
Begin
   With DtmBaseDados.qry Do
     Begin
         Close;
         Sql.Text := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
                     ' FROM IMPOSTOSXPRODUTOS '+
                     ' WHERE '+
                     '      (RTRIM(CODPRODUTO) = '''+ sCODPRODUTO +''') '+
                     '  AND (CODTIPOCUSTAGREG = '+ IntToStr(iCODTIPOCUSTAGREG) +') '+
                     '  AND (CODESTADO  = '''+ sCODUF +''') '+
                     '  AND (IDPAIS     = '''+ IntToStr(iIDPAIS) +''') ';
         Open;
     End;
  If Not DtmBaseDados.qry.IsEmpty Then
     Begin
        rBase := DtmBaseDados.qry.FieldByName('PERCBASEIMP').asFloat;
        rPerc := DtmBaseDados.qry.FieldByName('PERCIMPOSTO').asFloat;
        //
        rBase     := rValorItem*(rBase/100);
        rValorImp := rBase*(rPerc/100);
     End
  Else
     Begin
        rBase     := 0;
        rPerc     := 0;
        rValorImp := 0;
     End;
end;

Function TModulo.ValidaOrcxArt(idReserva : LongInt; sCodArt :String) : Boolean;
var
  sSql : String;
Begin
   Result:= False;
   sSql:=' SELECT C.CODTIPRECDES, C.RECPAG '+
         ' FROM COMPCONTASORCAMEN C, RESERVAORCAMEN R, GRUPPROD G, PRODUTO P '+
         ' WHERE (R.IDRESERVAORCAMEN = '+IntToStr(idReserva)+') AND '+
         '       (R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND '+
         '       (R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND '+
         '       (C.CODTIPRECDES   = G.CODTIPRECDES)   AND '+
         '       (C.RECPAG         = G.RECPAG)         AND '+
         '       (C.IDPESSOA       = G.IDPESSOA)       AND '+
         '       (G.CODGRUPOPROD   = P.CODGRUPOPROD)   AND '+
         '       (P.CODPRODUTO = '''+Espaco(Trim(Copy(sCodArt,1,6)),6)+''')';
   If FazQuery(DtmBaseDados.qry,sSql) then
      Result := True;
End;

Function TModulo.LeCentCustContab(sCodArt : String ): String;
Begin
   Result :='';
   If FazQuery(dtmBaseDados.qry,' SELECT CODCENTROCUSTO FROM ARTXCONTAXCC WHERE '+
                                '(CODARTIGO = '''+Espaco(sCodArt,14)+''') ')
   Then
      Result  := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;
End;


function TModulo.LeUltNumNotaDevol(idPessoa: Integer): LongInt;
begin
   Result := 0;
   If FazQuery(dtmBaseDados.qry,' SELECT NUMNOTANFDEVOL FROM PARALMOX WHERE '+
                                '(IDPESSOA = '+IntToStr(idPessoa)+')')
   Then
      Result := dtmBaseDados.qry.FieldByName('NUMNOTANFDEVOL').asInteger;
end;

Function TModulo.GravaUltNumNotaDevol(idPessoa, UltNumNotaDevol: Integer) : Boolean;
Var
   SQL : String;
begin
   SQL := ' UPDATE PARALMOX SET NUMNOTANFDEVOL = '+IntToStr(UltNumNotaDevol)+
          ' WHERE (IDPESSOA = '+IntToStr(idPessoa)+')';
   Result := Not ExecutarQuery(DtmBaseDados.qry,SQL);
end;

function TModulo.ListAlmox(CodCusteio: Integer): String;
Var
   SQL : String;
begin
   Result := '0';
   if CodCusteio = 0 then
      begin
         SQL := ' SELECT CODALMOXARIFADO FROM ALMOX '+
                ' WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
      end
   else
      begin
         SQL := ' SELECT CODALMOXARIFADO FROM ALMOX '+
                ' WHERE (CODCUSTEIO = '+IntToStr(CodCusteio)+')';
      end;
   If FazQuery(DtmBaseDados.qry,SQL) Then
      Begin
          Result := '';
          DtmBaseDados.qry.First;
          While Not DtmBaseDados.qry.Eof Do
             Begin
                Result := Result + DtmBaseDados.qry.FieldByName('CODALMOXARIFADO').AsString +',';
                DtmBaseDados.qry.Next;
             End;
         Result := Copy(Result,1,length(Result)-1);
      End;
end;


end.
