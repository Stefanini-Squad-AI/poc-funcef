(*******************************************************************************
 30/12/1999 - 2.14.18
  Criação das propriedades
    IntegraBack.MascasraNoDocum     - String
    IntegraBack.AssociaComplTipoFat - Boolean

    São inicializadas pelo método IntegraBack.BuscaParamIntegra e cadastrada nos
    parâmetros do Contas a pagar e receber;
    A primeira equivale a mascara do número do documento e a segunda a
    associação do Código Reduzido da Classificação fiscal do Cliente/Fornecedor
    ao Complemento do Documento;

  Criação do Método
    IntegraBack.BuscaCodigoFiscalReduzido

    Busca o Código Reduzido da Classificação fiscal do Cliente/Fornecedor ao
    Complemento do Documento;
  24/01/2000 - 2.03.02
    Correção na inicialização das propriedades IntegraBack.MascaraReceb e
    IntegraBack.MascaraDesemb (i)
*******************************************************************************)

unit uIntegraBack;

interface

Uses CMwwQuery, Forms, SysUtils, uSistema, Windows, Classes, Dialogs,
     uMensErro;

Type
   TContInstance = Class
   private
       FNumInstance :Integer;
       Procedure IncInstance;
       function DecInstance:Boolean;       
   Public
       Constructor Create;
       Property NumInstance :Integer read FNumInstance;
   End;

   TIntegraBack = Class
   private
    FTipoOper, FIntegraDocum,FIntegraContab,FIntegraFinan:Boolean;
    FContabilidade, FRecPag, FMascaraPlano, FFinanceiro, FMascaraReceb, fTipoEmpresa,
    FMascaraCC, FMascaraCr, FMascaraUnidNegoc, FIntegraOrcamento, FIntegraFront,
    FMascaraRecDes, FEstornaContab, FObrigaCRespon, FObrigaAbc, FMascaraDesemb : String;
    FPlano, FuNidNegoc, fIdHotel : Integer;
    FPatroGlobal, FPlanoPrevGlobal  :LongInt;
    FEstornaDocumento: Boolean;
    fMascaraNoDocum :String;
    fAssociaComplTipoFat :Boolean;
    FObrigaCC: Boolean;
    FMascaraCliente: String;
   public
        Property IdHotel             :Integer read fIdHotel            Write fIdHotel;
        Property Plano               :Integer read FPlano              Write FPlano;
        Property uNidNegoc           :Integer read FuNidNegoc          Write FuNidNegoc;
        Property Contabilidade       :String  read FContabilidade      Write FContabilidade;
        Property RecPag              :String  read FRecPag             Write FRecPag;
        Property Financeiro          :String  read FFinanceiro         Write FFinanceiro;
        Property EstornaContab       :String  read FEstornaContab      Write FEstornaContab;
        Property ObrigaCRespon       :String  read FObrigaCRespon      Write FObrigaCRespon;
        Property ObrigaAbc           :String  read FObrigaAbc          Write FObrigaAbc;
        Property IntegraOrcamento    :String  read FIntegraOrcamento   Write FIntegraOrcamento;
        Property MascaraPlano        :String  read FMascaraPlano       Write FMascaraPlano;
        Property MascaraRecDes       :String  read FMascaraRecDes      Write FMascaraRecDes;
        Property MascaraDesemb       :String  read FMascaraDesemb      Write FMascaraDesemb;
        Property MascaraReceb        :String  read FMascaraReceb       Write FMascaraReceb;
        Property MascaraCC           :String  read FMascaraCC          Write FMascaraCC;
        Property MascaraCr           :String  read FMascaraCr          Write FMascaraCr;
        Property MascaraUnidNegoc    :String  read FMascaraUnidNegoc   Write FMascaraUnidNegoc;
        Property IntegraFront        :String  read FIntegraFront       Write FIntegraFront;
        Property TipoEmpresa         :String  read fTipoEmpresa        Write fTipoEmpresa;
        property MascaraNoDocum      :String  read fMascaraNoDocum     Write fMascaraNoDocum;
        Property EstornaDocumento    :Boolean read FEstornaDocumento   Write FEstornaDocumento;
        property AssociaComplTipoFat :Boolean read fAssociaComplTipoFat  write fAssociaComplTipoFat;
        Property TipoOper            :Boolean read fTipoOper           Write fTipoOper;
        Property MascaraCliente      :String  read FMascaraCliente     Write FMascaraCliente;
        Property ObrigaCC            :Boolean read FObrigaCC           Write FObrigaCC;

        Property PatroGlobal         :LongInt read fPatroGlobal;
        Property PlanoPrevGlobal     :LongInt read fPlanoPrevGlobal;

        Constructor Create(bUsaUDocumento,bUsaLancContab,bUsaLancFinac:Boolean);
        Destructor  Destroy; Override;
        procedure   BuscaParamIntegra(sNomeParam,sNomeVariavel,sRecPag:String);
        Function    BuscaCodigoFiscalReduzido(idForcli:LongInt):String;
end;

Var
   IntegraBack: TIntegraBack;
   ContInstance :TContInstance;

implementation

Uses uDocumento, uDataBase, DCmBack, DCmBackImposto, DCmBackDocumento, DDadosBancarios;

{ TContInstance }

Constructor TContInstance.Create;
Begin
  FNumInstance := 0;
End;

Procedure TContInstance.IncInstance;
Begin
  Inc(FNumInstance);
End;

Function TContInstance.DecInstance:Boolean;
Begin
  Dec(FNumInstance);
  Result := (FNumInstance <= 0);
End;


{ TIntegraBack }
Constructor TIntegraBack.Create(bUsaUDocumento,bUsaLancContab,bUsaLancFinac:Boolean);
Begin
   Inherited Create;

   fIdHotel             := 0;
   FMascaraReceb        := '';
   FMascaraDesemb       := '';
   fAssociaComplTipoFat := false;
   fMascaraNoDocum      := '';
   FIntegraDocum        := bUsaUDocumento;
   FIntegraContab       := bUsaLancContab;
   FIntegraFinan        := bUsaLancFinac;
   FEstornaDocumento    := False;

   If ContInstance = nil Then
      ContInstance := TContInstance.Create;

   ContInstance.IncInstance;

   If ContInstance.NumInstance = 1 Then
   Begin
      DtmCmBack := TDtmCmBack.Create(nil);
      DtmCmBackDocumento := TDtmCmBackDocumento.Create(nil);
      DtmDadosBancarios := TDtmDadosBancarios.Create(nil);
   End;


   If FIntegraDocum And (Documento = nil) Then
      Documento := TDocumento.Create;


   fMascaraCliente := 'aaaaa-aa';
   fObrigaCC       := false;
End;

Destructor TIntegraBack.Destroy;
Begin
  If ContInstance.DecInstance Then
  Begin
     DtmCmBack.Free;
     DtmCmBackDocumento.Free;
     DtmDadosBancarios.Free;
     If FIntegraDocum  Then Documento.Free;
     ContInstance.Free;
  End;

  Inherited Destroy;
End;

procedure TIntegraBack.BuscaParamIntegra(sNomeParam,sNomeVariavel,sRecPag:String);
Var
  sSql, sNomeChave: String;
begin
    {**
      Verificado!
      Utilizar Sistemna.TipoEmpresa
    **}
    If FazQuery(DtmCmBack.Qry,'SELECT TIPOEMPRESA FROM EMPRESAPROP WHERE IDPESSOA = ' + inttostr(Sistema.idEmpresa)) Then
       fTipoEmpresa := DtmCmBack.Qry.FieldByName('TIPOEMPRESA').AsString
    Else
       fTipoEmpresa := 'H';
    {** Verificado! **}

    {** Verificado! **}
    sSql := 'SELECT MASCARADESEMB, MASCARANODOCUM, FLGCOMPLTIPOFAT FROM PARAMCAP WHERE IDPESSOA='+inttostr(Sistema.idEmpresa)+' AND RECPAG = ''' + sRecPag + '''';
    If FazQuery(DtmCmBack.Qry,sSql) Then
    Begin
       FMascaraRecDes :=  DtmCmBack.Qry.FieldByName('MascaraDesemb').AsString;
       fAssociaComplTipoFat := (DtmCmBack.Qry.FieldByName('FLGCOMPLTIPOFAT').AsString = 'S');
       fMascaraNoDocum      := DtmCmBack.Qry.FieldByName('MASCARANODOCUM').AsString;
    End;

    sSql := 'SELECT MASCARADESEMB FROM PARAMCAP WHERE IDPESSOA='+inttostr(Sistema.idEmpresa)+' AND RECPAG = ''R''';
    If FazQuery(DtmCmBack.Qry,sSql) Then
       FMascaraReceb := DtmCmBack.Qry.FieldByName('MASCARADESEMB').AsString;

    sSql := 'SELECT MASCARADESEMB FROM PARAMCAP WHERE IDPESSOA='+inttostr(Sistema.idEmpresa)+' AND RECPAG = ''P''';
    If FazQuery(DtmCmBack.Qry,sSql) Then
       FMascaraDesemb := DtmCmBack.Qry.FieldByName('MASCARADESEMB').AsString;
    DtmCmBack.Qry.Close;
    {** Verificado! **}

    if (uPpercase(sNomeParam) = 'PARAMHOTEL') Then
      sNomeChave := 'IDHOTEL'
    Else
      sNomeChave := 'IDPESSOA';

    if Trim(sRecPag) = '' then
       DtmCmBack.Qry.sql.text := 'SELECT '+sNomeVariavel+' FROM '+sNomeParam+' WHERE ' + sNomeChave + ' = '+inttostr(Sistema.idEmpresa)
    else
       If sRecPag = 'F' Then
          DtmCmBack.Qry.sql.text := 'SELECT '+sNomeVariavel+' FROM '+sNomeParam+' WHERE ' + sNomeChave + ' = ' + inttostr(fIdHotel)
       Else
          DtmCmBack.Qry.sql.text := 'SELECT '+sNomeVariavel+',MASCARADESEMB, LANCAFINANC FROM '+sNomeParam+' WHERE ' + sNomeChave + ' = '+inttostr(Sistema.idEmpresa)+' AND RECPAG = '''+sRecPag+'''';

    DtmCmBack.Qry.Open;

    if (Trim(sRecPag) <> '') And (sRecPag <> 'F') then
       FFinanceiro    :=  DtmCmBack.Qry.FieldByName('LancaFinanc').AsString;


    if (not DtmCmBack.Qry.IsEmpty) Then
       FContabilidade := DtmCmBack.Qry.FieldbyName(sNomeVariavel).AsString
    else
    Begin
       FContabilidade := 'N';
       MsgDlg('Favor Preencher a sua tela de Parâmetros.','Aviso',mtWarning,[mbOk],0);
    end;


    {** Verificado! **}
    FEstornaContab := 'N';
    if FContabilidade = 'S' Then
    Begin

      DtmCmBack.Qry.Close;
      DtmCmBack.Qry.sql.text     := 'SELECT P.MASCARA,C.PLANO,C.PACESTORNA FROM PLANO P,PARAMCONTAB C WHERE C.IDPESSOA='+IntToStr(Sistema.idEmpresa)+' AND P.PLANO=C.PLANO';
      DtmCmBack.Qry.Open;

      if (not DtmCmBack.Qry.IsEmpty) Then
      Begin
        FPlano        := DtmCmBack.Qry.FieldbyName('PLANO').AsInteger;
        FMascaraPlano := trim(DtmCmBack.Qry.FieldbyName('MASCARA').AsString);
        FEstornaContab:= DtmCmBack.Qry.FieldByName('PACESTORNA').AsString;
      end
      else
      Begin
        MsgDlg('Para ter este sistema integrado com a Contabilidade, preencha primeiro os dados básicos da mesma','Aviso',mtWarning,[mbOK],0);
        try
          {**
            Não vou alterar os parâmetros do sistema, apenas vou informar a flaha na integração
            e passar o parâmetro para false.
          **}
          with DtmCmBack.Qry do
          begin
            Close;
            if Trim(sRecPag) = '' then
               sSql := 'UPDATE '+sNomeParam+' set '+sNomeVariavel+' = ''N'' WHERE  ' + sNomeChave + ' = ' +
                       inttostr(Sistema.idempresa)
            else
               if Trim(sRecPag) = 'F' then
                  sSql := 'UPDATE '+sNomeParam+' set '+sNomeVariavel+' = ''N'' WHERE  ' + sNomeChave + ' = ' +
                          inttostr(fIdHotel)
               else
                  sSql := 'UPDATE '+sNomeParam+' set '+sNomeVariavel+' = ''N'' WHERE  ' + sNomeChave + ' = ' +
                          inttostr(Sistema.idempresa)+' AND RECPAG = '''+sRecPag+'''';
            Sql.Text := sSql;
          end;
          DtmCmBack.Qry.ExecSQL;
          DtmCmBack.Qry.Close;
        except
           Raise;
        end;
        FContabilidade := 'N';
      end;
    end;
    {** Verificado! **}

    {** Verificado! **}
    if FContabilidade = 'S' then
    Begin
       DtmCmBack.Qry.Close;
       DtmCmBack.Qry.Sql.Text := 'SELECT TIPCODIGO FROM ' + Sistema.PrefixoServidor   +'TIPOPER WHERE TIPCODIGO = ''03''';
       DtmCmBack.Qry.Open;

       FTipoOper := Not DtmCmBack.Qry.ISEmpty;

       if not FTipoOper then
          MsgDlg('Para ter este sistema integrado com a Contabilidade é necessário cadastrar o Tipo de Operação 03 no GlobalCM. Caso este código não seja cadastrado, este sistema não aceitará nenhum lançamento.','Aviso',mtWarning,[mbOK],0);
    end;
    {** Verificado! **}

    {** Verificado! **}
    sSql := 'SELECT USACRESPON, USAABC, MASCARACC, MASCCENTRORESPON, MASCUNIDNEGOC, FLGINTEGRAORC, UNIDNEGOC, IDPLANOPREV, IDPATRO, FLGOBRIGACC, MASCARACLIENTE  FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

    If FazQuery(DtmCmBack.Qry,sSql) Then
    Begin
      FObrigaCrespon    := DtmCmBack.Qry.FieldByname('USACRESPON').AsString;
      FObrigaAbc        := DtmCmBack.Qry.FieldByname('USAABC').AsString;
      FMascaraCC        := DtmCmBack.Qry.FieldByname('MASCARACC').AsString;
      FMascaraCr        := DtmCmBack.Qry.FieldByname('MASCCENTRORESPON').AsString;
      FMascaraUnidNegoc := DtmCmBack.Qry.FieldByname('MASCUNIDNEGOC').AsString;
      FIntegraOrcamento := DtmCmBack.Qry.FieldByname('FLGINTEGRAORC').AsString;
      FuNidNegoc        := DtmCmBack.Qry.FieldByname('UNIDNEGOC').AsInteger;
      FPatroGlobal      := DtmCmBack.Qry.FieldByname('IDPATRO').AsInteger;
      FPlanoPrevGlobal  := DtmCmBack.Qry.FieldByname('IDPLANOPREV').AsInteger;
      FObrigaCC         := (DtmCmBack.Qry.FieldByname('FLGOBRIGACC').AsString = 'S');
      FMascaraCliente   := DtmCmBack.Qry.FieldByname('MASCARACLIENTE').AsString;
    End
    Else
    Begin
      FObrigaCrespon    := '';
      FObrigaAbc        := '';
      FMascaraCC        := '';
      FMascaraCr        := '';
      FMascaraUnidNegoc := '';
      FIntegraOrcamento := '';
      FuNidNegoc        := -1;
      FPatroGlobal      := -1;
      FPlanoPrevGlobal  := -1;
      FMascaraCliente   := 'aaaaa-aa';
      FObrigaCC := False;
      MsgDlg('Não foi possível acessar os Parâmetros Globais do Sistema. Verifique','Aviso',mtWarning,[mbOk],0);
    End;

    DtmCmBack.Qry.Close;
    {** Verificado! **}

    {** Verificado! **}
    sSql := 'SELECT FLGINTEGRAVHL FROM PARAMFATHOTEL WHERE IDPESSOA =  ' + IntToStr(Sistema.IdEmpresa);
    If FazQuery(DtmCmBack.Qry,sSql) Then
       FIntegraFront     := DtmCmBack.Qry.FieldByname('FLGINTEGRAVHL').AsString
    Else
       FIntegraFront     := '';
    {** Verificado! **}
end;

Function TIntegraBack.BuscaCodigoFiscalReduzido(idForcli:LongInt):String;
Begin
    Result := '';
    If (fRecPag = 'P') Then
    Begin
      If (FazQuery(DtmCmBack.Qry,'SELECT CF.CODREDUZIDO FROM CLASFISCLIFOR CF, FORNSERV F WHERE CF.IDCLASFISCLIFOR = F.IDCLASFISCLIFOR AND F.IDPESSOA = ' + IntToStr(idForcli))) And
         (Not DtmCmBack.Qry.FieldByName('CODREDUZIDO').IsNull) Then
              Result := DtmCmBack.Qry.FieldByName('CODREDUZIDO').AsString;
    End
    Else
    Begin
      If (FazQuery(DtmCmBack.Qry,'SELECT CF.CODREDUZIDO FROM CLASFISCLIFOR CF, CLIENTEPESS C WHERE CF.IDCLASFISCLIFOR = C.IDCLASFISCLIFOR AND C.IDPESSOA = ' + IntToStr(idForcli))) And
         (Not DtmCmBack.Qry.FieldByName('CODREDUZIDO').IsNull) Then
            Result := DtmCmBack.Qry.FieldByName('CODREDUZIDO').AsString;
    End;
    If DtmCmBack.Qry.Active Then DtmCmBack.Qry.Close;
End;



end.
