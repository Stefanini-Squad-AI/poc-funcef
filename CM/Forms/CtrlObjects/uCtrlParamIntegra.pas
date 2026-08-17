{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe de controle dos Parâmetros de Integração     }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}
{==============================================================================
Desenvolvedor: Antonio Marcos (amf)
Data         : 13.08.2007
Pendência    : 26045-26051
Método       : GetParams
Solução      : Criei os tipos tiCompras e tiAlmox para tratar de forma distinta os
               parâmetros de integração com os sistemas de compras e almoxarifado.
---------------------------------------------------------------------------------
Desenvolvedor: andre tavares
Data         : 18/10/2004
Pendência    : 16971
Método       : GetParams
Solução      : se o módulo for Cap ou Car, utilizar a parâmetro de integração com
               o orçamento que está gravado na tabela ParamCap.
===============================================================================}

{==============================================================================
Desenvolvedor: Alex Pereira
Data         : 06/09/04
Pendência    : 17193 - Segregação do Fluxo Financeiro
Método       : GetParams
Solução      : Criar a Propriedade SegregaFinanc

Data         : 14/10/04
Solução      : Retirada a propriedade SegregaFinanc
               Criadas as propriedades:
                 PlanoPrevAdm    ==> Plano Administrativo
                 SegregaOrComum  ==> Segrega o plano O.C. (PlanoPrevGlobal) na origem
                 SegregaOrAdm    ==> Segrega o plano Adm  (PlanoPrevAdm)    na origem
===============================================================================}
{==============================================================================
Desenvolvedor: Alex Pereira
Data         : 29/06/2004
Pendência    : 17101 - Cadastro parâmetros sistema CAP / CAR.
                       Com a tabela vazia sempre gravava CAP
Método       : GetParams
Solução      : Instanciar a propriedade antes da criação da exceção
===============================================================================}
{==============================================================================
Desenvolvedor: Alex Pereira
Data         : 28/06/2004
Pendência    : 15367 - DE/PARA Centro de Custo e Centro Responsabilidade
Método       : GetParams
Solução      : Criar as propriedades PLANOCENTROCUSTO / PLANOCENTRORESPON
===============================================================================}
{==============================================================================
Desenvolvedor: andré tavares
Data         : 13/05/2004
Pendência    : 16691
Método       : GetParams
Solução      : retirar a query que acessa a tabela PARAMFATHOTEL e a propriedade
que é preenchida com ela (TipoIntegraFront).
===============================================================================}
{==============================================================================
Desenvolvedor: Alex Pereira
Data         : 07/01/04
Pendência    : 14451 - Nova Segregação de Recursos
Método       : GetParams
Solução      : Criar a Propriedade SegregaVirtual
===============================================================================}

unit uCtrlParamIntegra;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, Masks;

Type
  TTipoIntegracao = ( tiFront, tiCAP, tiCAR, tiSistema, tiCompras, tiAlmox);

  TCtrlParamIntegra = Class(TCmControlObject)
  private
    FIncluiAgencia: Boolean;
    FObrigaAbc: Boolean;
    fObrigaCrespon: Boolean;
    FIntegraOrcamento: Boolean;
    fIntegraContab: Boolean;
    FTipoOperOk: Boolean;
    fEstornaContab: Boolean;
    FObrigaCC: Boolean;
    fIntegraFinanceiro: Boolean;
    fAssociaComplTipoFat: Boolean;
    fLancFinancPag: Boolean;
    fAssociaComplTipoFatRec: Boolean;
    fAssociaComplTipoFatPag: Boolean;
    fLancFinancRec: Boolean;
    fIntegraContabPag: Boolean;
    fIntegraContabRec: Boolean;

    FPlanoPrevGlobal: Integer;
    FuNidNegoc: Integer;
    FPatroGlobal: Integer;
    fPlano: Integer;

    FMascaraAgencia: String;
    fMascaraCr: String;
    FMascaraCliente: String;
    FMascaraCC: String;
    FMascaraUnidNegoc: String;
    fMascaraPlano: String;
    fMascaraNoDocum: String;
    FMascaraDesemb: String;
    FMascaraReceb: String;
    fMascaraNoDocumPag: String;
    fMascaraNoDocumRec: String;

    fRecPag: Char;
    fPartidaDobrada: Boolean;
    FCriaSubContaClie: Boolean;
    FCriaSubContaForn: Boolean;
    FSegregaVirtual: Boolean;
    FPlanoCentroCusto: integer;
    FPlanoCentroRespon: integer;
    FSegregaOrComum: Boolean;
    FSegregaOrAdm: Boolean;
    FPlanoPrevAdm: integer;
    FFlgSegOrAdmFin: boolean;
    FFlgSegOrComFin: boolean;
    procedure SetCriaSubContaClie(const Value: Boolean);
    procedure SetCriaSubContaForn(const Value: Boolean);
    procedure SetPlanoPrevAdm(const Value: integer);
    procedure SetSegregaOrAdm(const Value: Boolean);
    procedure SetSegregaOrComum(const Value: Boolean);
    procedure SetFlgSegOrAdmFin(const Value: boolean);
    procedure SetFlgSegOrComFin(const Value: boolean);
  protected

  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    property IntegraContabPag: Boolean read fIntegraContabPag;
    property IntegraContabRec: Boolean read fIntegraContabRec;
    property AssociaComplTipoFatPag: Boolean read fAssociaComplTipoFatPag;
    property AssociaComplTipoFatRec: Boolean read fAssociaComplTipoFatRec;
    property LancFinancRec: Boolean read fLancFinancRec;
    property LancFinancPag: Boolean read fLancFinancPag;
    property MascaraNoDocumPag: String read fMascaraNoDocumPag;
    property MascaraNoDocumRec: String read fMascaraNoDocumRec;

    property IncluiAgencia: Boolean read FIncluiAgencia;
    property ObrigaCrespon: Boolean read fObrigaCrespon;
    property ObrigaAbc: Boolean read FObrigaAbc;
    property IntegraOrcamento: Boolean read FIntegraOrcamento;
    property IntegraContab: Boolean read fIntegraContab;
    property TipoOperOk: Boolean read FTipoOperOk;
    property EstornaContab: Boolean read fEstornaContab;
    property IntegraFinanceiro: Boolean read fIntegraFinanceiro;
    property AssociaComplTipoFat: Boolean read fAssociaComplTipoFat;

    property MascaraAgencia: String read FMascaraAgencia;
    property MascaraCC: String read FMascaraCC;
    property MascaraCr: String read fMascaraCr;
    property MascaraUnidNegoc: String read FMascaraUnidNegoc;
    property MascaraCliente: String read FMascaraCliente;
    property MascaraPlano: String read fMascaraPlano;
    property MascaraNoDocum: String read fMascaraNoDocum;
    property MascaraReceb: String read FMascaraReceb;
    property MascaraDesemb: String read FMascaraDesemb;

    property RecPag: Char read fRecPag;

    property uNidNegoc: Integer read FuNidNegoc;
    property PatroGlobal: Integer read FPatroGlobal;
    property PlanoPrevGlobal: Integer read FPlanoPrevGlobal;
    property ObrigaCC: Boolean read FObrigaCC;
    property Plano: Integer read fPlano;
    property PartidaDobrada: Boolean read fPartidaDobrada;

    property SegregaVirtual: Boolean read FSegregaVirtual;

    property PlanoCentroCusto: integer read FPlanoCentroCusto;
    property PlanoCentroRespon: integer read FPlanoCentroRespon;

    property PlanoPrevAdm  : integer read FPlanoPrevAdm write SetPlanoPrevAdm;
    property SegregaOrComum: Boolean read FSegregaOrComum write SetSegregaOrComum;
    property SegregaOrAdm  : Boolean read FSegregaOrAdm write SetSegregaOrAdm;

    property FlgSegOrComFin : boolean read FFlgSegOrComFin write SetFlgSegOrComFin;
    property FlgSegOrAdmFin : boolean read FFlgSegOrAdmFin write SetFlgSegOrAdmFin;

    property CriaSubContaForn: Boolean read FCriaSubContaForn write SetCriaSubContaForn;
    property CriaSubContaClie: Boolean read FCriaSubContaClie write SetCriaSubContaClie;

    function BuscaCodigoFiscalReduzido(rIdForcli: Double): String;
    function GetParams(rIdEmpresa, rIdHotel: Integer; sCampoIntegraContab,
      sTabelaParamSistema: String; TipoIntegracao: TTipoIntegracao): Boolean;
  end;

Var
  ParamIntegra: TCtrlParamIntegra;

implementation

{ TCtrlPessoa }

Uses Mask;

constructor TCtrlParamIntegra.Create;
begin
  inherited;
  fRecPag := 'P';

  FMascaraAgencia := '';
  FMascaraCC := '';
  FMascaraCr := '';
  FMascaraCliente   := 'aaaaa-aa';
  FMascaraUnidNegoc := '';
  fMascaraPlano := '';
  fMascaraNoDocum := '';
  FMascaraReceb := '';
  FMascaraDesemb := '';

  FIntegraOrcamento := false;
  FObrigaCrespon := false;
  FObrigaAbc := false;
  FIncluiAgencia := False;
  fIntegraContab := False;
  FTipoOperOk := False;
  fEstornaContab := False;
  FObrigaCC := false;
  fIntegraFinanceiro := False;
  fAssociaComplTipoFat := false;
  fLancFinancPag := false;
  fAssociaComplTipoFatRec := false;
  fAssociaComplTipoFatPag := false;
  fLancFinancRec := false;
  fIntegraContabPag := false;
  fIntegraContabRec := false;
  fPartidaDobrada := false;

  fMascaraNoDocumPag := '';
  fMascaraNoDocumRec := '';

  FuNidNegoc := 0;
  FPatroGlobal := 0;
  FPlanoPrevGlobal := 0;
  fPlano := 0;
end;

destructor TCtrlParamIntegra.Destroy;
begin

  inherited;
end;

function TCtrlParamIntegra.GetParams(rIdEmpresa, rIdHotel: Integer; sCampoIntegraContab,
  sTabelaParamSistema: String; TipoIntegracao: TTipoIntegracao): Boolean;
Var
  bExisteParamRec,  bExisteParamPag: Boolean;
  sCampoChave, sSqlParam: String;
  FIntegraOrcamentoCAP, FIntegraOrcamentoCAR : Boolean; 
begin
  Result := True;

  Try
     {**
       Busca parâmetros de integração com contas a pagar e receber
     **}
     fIntegraContabRec := false;
     fIntegraContabPag := false;
     fAssociaComplTipoFatPag := false;
     fAssociaComplTipoFatRec := false;
     fLancFinancRec := false;
     fLancFinancPag := false;
     bExisteParamRec := false;
     bExisteParamPag := false;
     fMascaraNoDocumPag := '';
     fMascaraNoDocumRec := '';

     _Cds.Data := GetDataPacket('SELECT RECPAG, MASCARADESEMB, MASCARANODOCUM, FLGCOMPLTIPOFAT, INTEGRACONTAB, LANCAFINANC, FLGINTEGRAORC  FROM PARAMCAP WHERE IDPESSOA = ' + FloatToStr(rIdEmpresa));
     If _Cds.IsEmpty Then
     Begin
        fAssociaComplTipoFat := false;
        fMascaraNoDocum := '';
        FMascaraReceb := '';
        FMascaraDesemb := '';
     End
     Else
     Begin
        _Cds.First;

        While Not _Cds.Eof Do
        Begin
          If _Cds.FieldByName('RECPAG').AsString = 'R' Then
          Begin
            FMascaraReceb := _Cds.FieldByName('MASCARADESEMB').AsString;
            fIntegraContabRec := (_Cds.FieldByName('INTEGRACONTAB').AsString = 'S');
            fAssociaComplTipoFatRec := (_Cds.FieldByName('FLGCOMPLTIPOFAT').AsString = 'S');
            fMascaraNoDocumRec := _Cds.FieldByName('MASCARANODOCUM').AsString;
            fLancFinancREC := (_Cds.FieldByName('LANCAFINANC').AsString = 'S');
            bExisteParamRec := True;
            FIntegraOrcamentoCAR := (_Cds.FieldByname('FLGINTEGRAORC').AsString = 'S');
          End
          Else
          Begin
            FMascaraDesemb := _Cds.FieldByName('MASCARADESEMB').AsString;
            fIntegraContabPag := (_Cds.FieldByName('INTEGRACONTAB').AsString = 'S');
            fAssociaComplTipoFatPag := (_Cds.FieldByName('FLGCOMPLTIPOFAT').AsString = 'S');
            fMascaraNoDocumPag := _Cds.FieldByName('MASCARANODOCUM').AsString;
            fLancFinancPag := (_Cds.FieldByName('LANCAFINANC').AsString = 'S');
            bExisteParamPag := True;
            FIntegraOrcamentoCAP := (_Cds.FieldByname('FLGINTEGRAORC').AsString = 'S');
          End;

          _Cds.Next;
        End;
     End;

     Case TipoIntegracao of
       tiCAP:
       Begin
         // com a tabela vazia sempre registrava o parâmetro como CAP
         fRecPag := 'P';
         If Not bExisteParamPag Then
            Raise Exception.Create('Não foram cadastrados os parâmetros de integração com o Contas a Pagar');

         fAssociaComplTipoFat := fAssociaComplTipoFatPag;
         fMascaraNoDocum := fMascaraNoDocumPag;
         fIntegraContab := fIntegraContabPag;
         fIntegraFinanceiro := fLancFinancPag;
         FIntegraOrcamento := FIntegraOrcamentoCAP;
       End;

       tiCAR:
       Begin
         // com a tabela vazia sempre registrava o parâmetro como CAP
         fRecPag := 'R';
         If Not bExisteParamRec Then
            Raise Exception.Create('Não foram cadastrados os parâmetros de integração com o Contas a Receber');

         fAssociaComplTipoFat := fAssociaComplTipoFatRec;
         fMascaraNoDocum := fMascaraNoDocumRec;
         fIntegraContab := fIntegraContabRec;
         fIntegraFinanceiro := fLancFinancRec;
         FIntegraOrcamento := FIntegraOrcamentoCAR;
       End;

       tiCompras:
         begin
           _Cds.Data := GetDataPacket('SELECT * FROM PARAMCOMPRAS WHERE IDPESSOA = ' + FloatToStr(rIdEmpresa));
            FIntegraOrcamento := (_cds.FieldByName('FLGORCAMENTO').AsString = 'S');
         end;

       tiAlmox:
         begin
           _Cds.Data := GetDataPacket('SELECT * FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr(rIdEmpresa));
            FIntegraOrcamento := (_cds.FieldByName('FLGINTEGRAORC').AsInteger = 1);
         end;
     Else
       begin
          fAssociaComplTipoFat := false;
          fIntegraContab := false;
          fIntegraFinanceiro := false;
          fRecPag := 'P';
          fMascaraNoDocum := '';
       end;
     End;

     {**
       Busca parâmetros de integração com contabilidade para tabelas passadas nos parâmetros
       da função.
     **}
     If (Trim(sTabelaParamSistema) <> '') And
        (Trim(sCampoIntegraContab) <> '') Then
     Begin
        if (uPpercase(sTabelaParamSistema) = 'PARAMHOTEL') Then
          sCampoChave := 'IDHOTEL'
        Else
          sCampoChave := 'IDPESSOA';

        Case TipoIntegracao of
          tiFront:
             sSqlParam := 'SELECT ' + sCampoIntegraContab + ' FROM ' + sTabelaParamSistema + ' WHERE ' + sCampoChave + ' = ' + inttostr(rIdHotel);
          Else
             sSqlParam := 'SELECT ' + sCampoIntegraContab + ' FROM ' + sTabelaParamSistema + ' WHERE ' + sCampoChave + ' = ' + FloatToStr(rIdEmpresa);
        End;

        _Cds.Data := GetDataPacket(sSqlParam);

        If _Cds.IsEmpty Then
           Raise Exception.Create('Favor Preencher a sua tela de parâmetros')
        Else
           fIntegraContab := (_Cds.FieldbyName(sCampoIntegraContab).AsString = 'S');
     End;

     {**
       .1 Verifica se existem parâmetros do sistema contábil cadastrados;
       .2 Verifica o cadastro de tipo de operação caso o sistema esteja integrado com
          a contabilidade;
     **}
     if fIntegraContab Or fIntegraContabPag Or fIntegraContabRec then
     Begin
        _Cds.Data := GetDataPacket('SELECT P.MASCARA, C.PLANO, C.PACESTORNA, C.PACDOBRADA FROM PLANO P,PARAMCONTAB C WHERE C.IDPESSOA = '+ FloatToStr(ridEmpresa) +' AND P.PLANO = C.PLANO');

        if (not _Cds.IsEmpty) Then
        Begin
           fPlano := _Cds.FieldbyName('PLANO').AsInteger;
           fMascaraPlano := Trim(_Cds.FieldbyName('MASCARA').AsString);
           fEstornaContab := (_Cds.FieldByName('PACESTORNA').AsString = 'S');
           fPartidaDobrada := (_Cds.FieldByName('PACDOBRADA').AsString = 'S');
        end
        else
        Begin
           fIntegraContab := false;
           fIntegraContabPag := false;
           fIntegraContabRec := false;
           fPartidaDobrada := false;
           Raise Exception.Create('Para ter este sistema integrado com a Contabilidade, preencha primeiro os dados básicos da mesma');
        End;

        _Cds.Data := GetDataPacket('SELECT TIPCODIGO FROM TIPOPER WHERE TIPCODIGO = ''03''');

        FTipoOperOk := Not _Cds.ISEmpty;

        If not FTipoOperOk then
        Begin
           fIntegraContab := false;
           fIntegraContabPag := false;
           fIntegraContabRec := false;
           Raise Exception.Create('Para ter este sistema integrado com a Contabilidade é necessário cadastrar o Tipo de Operação 03 no GlobalCM. Caso este código não seja cadastrado, este sistema não aceitará nenhum lançamento.');
        End;
     end;

     {**
       Seleciona parâmetros globais de integração
     **}
     // estava dando erro no projetc builde por ter excedido 255 elementos _Cds.Data := GetDataPacket('SELECT FLGSEGREGAVIRTUAL,FLGCRIAAGENCIA,MASCARANUMAGENCIA,USACRESPON,USAABC,MASCARACC,MASCCENTRORESPON,MASCUNIDNEGOC,FLGINTEGRAORC,UNIDNEGOC,IDPLANOPREV,IDPATRO,FLGOBRIGACC,MASCARACLIENTE,FLGSUBCONTAFORN,FLGSUBCONTACLIE, IDPLANCENTCUST, IDPLANCRESPON FROM PARAMGLOBAL WHERE IDPESSOA = ' + FloatToStr(rIdEmpresa));
     _Cds.Data := GetDataPacket('SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = ' + FloatToStr(rIdEmpresa));

     If _Cds.IsEmpty Then
     Begin
       FSegregaVirtual := False;

       FPlanoPrevAdm   := 0;
       FSegregaOrAdm   := False;
       FSegregaOrComum := False;

       FFlgSegOrComFin := False;
       FFlgSegOrAdmFin := False;

       FPlanoCentroCusto := -1;
       FPlanoCentroRespon := -1;

       FIncluiAgencia := False;
       FMascaraAgencia := '';
       FObrigaCrespon := false;
       FObrigaAbc := false;
       FMascaraCC := '';
       FMascaraCr := '';
       FMascaraUnidNegoc := '';
       FIntegraOrcamento := false;
       FuNidNegoc := 0;
       FPatroGlobal := 0;
       FPlanoPrevGlobal := 0;
       FObrigaCC := false;
       FMascaraCliente   := 'aaaaa-aa';
       fCriaSubContaForn := false;
       fCriaSubContaClie := false;
     End
     Else
     Begin
       FSegregaVirtual := (_Cds.FieldByName('FLGSEGREGAVIRTUAL').AsString = 'S');

       if not _Cds.FieldByName('IDPLANOPREVADM').IsNull then
         FPlanoPrevAdm  := _Cds.FieldByName('IDPLANOPREVADM').AsInteger;

       FSegregaOrAdm   := (_Cds.FieldByName('FLGSEGREGAORADM').AsString = 'S');
       FSegregaOrComum := (_Cds.FieldByName('FLGSEGREGAORCOMUM').AsString = 'S');

       FFlgSegOrComFin := (_Cds.FieldByName('FLGSEGORCOMFIN').AsString = 'S');
       FFlgSegOrAdmFin := (_Cds.FieldByName('FLGSEGORADMFIN').AsString = 'S');

       FPlanoCentroCusto := _Cds.FieldByName('IDPLANCENTCUST').AsInteger;
       FPlanoCentroRespon := _Cds.FieldByName('IDPLANCRESPON').AsInteger;

       If _Cds.FieldByName('MASCARANUMAGENCIA').IsNull THen
         FMascaraAgencia := ''
       Else
         FMascaraAgencia := _Cds.FieldByName('MASCARANUMAGENCIA').AsString +  ';' + MaskNoSave + '; ';

       FIncluiAgencia := (_Cds.FieldByName('FLGCRIAAGENCIA').AsString = 'S');
       FObrigaCrespon := (_Cds.FieldByname('USACRESPON').AsString = 'S');
       FObrigaAbc := (_Cds.FieldByname('USAABC').AsString = 'S');
       FMascaraCC := (_Cds.FieldByname('MASCARACC').AsString);
       FMascaraCr := (_Cds.FieldByname('MASCCENTRORESPON').AsString);
       FMascaraUnidNegoc := (_Cds.FieldByname('MASCUNIDNEGOC').AsString);

       FuNidNegoc := (_Cds.FieldByname('UNIDNEGOC').AsInteger);
       FPatroGlobal := (_Cds.FieldByname('IDPATRO').AsInteger);
       FPlanoPrevGlobal := (_Cds.FieldByname('IDPLANOPREV').AsInteger);
       FObrigaCC := (_Cds.FieldByname('FLGOBRIGACC').AsString = 'S');
       FMascaraCliente := (_Cds.FieldByname('MASCARACLIENTE').AsString);
       fCriaSubContaForn := (_Cds.FieldByname('FLGSUBCONTAFORN').AsString = 'S');
       fCriaSubContaClie := (_Cds.FieldByname('FLGSUBCONTACLIE').AsString = 'S');
     End;

     _Cds.Close;

  except
     On E:Exception Do
     Begin
        If _Cds.Active Then _Cds.Close;
        Result := false;
        MessageInfo := E.Message;
     End;
  end;
end;

Function TCtrlParamIntegra.BuscaCodigoFiscalReduzido( rIdForcli: Double ):String;
Begin
    Case fRecPag of
    'P':
      Begin
       _Cds.Data := GetDataPacket('SELECT CF.CODREDUZIDO FROM CLASFISCLIFOR CF, FORNSERV F WHERE CF.IDCLASFISCLIFOR = F.IDCLASFISCLIFOR AND F.IDPESSOA = ' + FloatToStr(rIdForcli) );

       If _Cds.IsEmpty Then
          Result := ''
       Else
          Result := _Cds.FieldByName('CODREDUZIDO').AsString;

       _Cds.Close;
      End;
    'R':
      Begin
       _Cds.Data := GetDataPacket('SELECT CF.CODREDUZIDO FROM CLASFISCLIFOR CF, CLIENTEPESS C WHERE CF.IDCLASFISCLIFOR = C.IDCLASFISCLIFOR AND C.IDPESSOA = ' + FloatToStr(rIdForcli) );

       If _Cds.IsEmpty Then
          Result := ''
       Else
          Result := _Cds.FieldByName('CODREDUZIDO').AsString;

       _Cds.Close;
      End
    Else
      Result := '';
    End;
End;


procedure TCtrlParamIntegra.SetCriaSubContaClie(const Value: Boolean);
begin
  FCriaSubContaClie := Value;
end;

procedure TCtrlParamIntegra.SetCriaSubContaForn(const Value: Boolean);
begin
  FCriaSubContaForn := Value;
end;

procedure TCtrlParamIntegra.SetPlanoPrevAdm(const Value: integer);
begin
  FPlanoPrevAdm := Value;
end;

procedure TCtrlParamIntegra.SetSegregaOrAdm(const Value: Boolean);
begin
  FSegregaOrAdm := Value;
end;

procedure TCtrlParamIntegra.SetSegregaOrComum(const Value: Boolean);
begin
  FSegregaOrComum := Value;
end;

procedure TCtrlParamIntegra.SetFlgSegOrAdmFin(const Value: boolean);
begin
  FFlgSegOrAdmFin := Value;
end;

procedure TCtrlParamIntegra.SetFlgSegOrComFin(const Value: boolean);
begin
  FFlgSegOrComFin := Value;
end;

end.

