unit uCtrlPartass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbPartass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlPartass = Class(TCmControlObject)

    private
    FDbPartass: TDbPartass;
    FCdsPartass: TClientDataSet;
    procedure SetDbPartass(const Value: TDbPartass);
    procedure SetCdsPartass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsPartass: TClientDataSet read FCdsPartass write SetCdsPartass;
      property DbPartass: TDbPartass read FDbPartass write SetDbPartass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
      Function SelecionaPartPrev(sIdPessoa:String):OleVariant;
      Function SelecionaParticipante(sInscNumero:String): OleVariant;
    protected

    End;

implementation

{ TCtrlPartass }

function TCtrlPartass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsPartass,DbPartass);
        StartTransaction;
        Result := DbPartass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbPartass.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

constructor TCtrlPartass.Create;
begin
  inherited;
  FDbPartass := TDbPartass.Create;
  FCdsPartass := TClientDataSet.Create(nil);
end;

destructor TCtrlPartass.Destroy;
begin
  FDbPartass.Free;
  FCdsPartass.Free;

  inherited;
end;

procedure TCtrlPartass.DoChangeDataBase;
begin
  inherited;
  DbPartass.DataBaseName := DataBaseName;
end;

function TCtrlPartass.Excluir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Excluir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := DbPartass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbPartass.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

function TCtrlPartass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsPartass,DbPartass);
        StartTransaction;
        Result := DbPartass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbPartass.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

Function SelecionaParticipante(sInscNumero:String): OleVariant;
begin
  Result:= GetDataPacked(
  'SELECT '+
  ' PA.IDPESSOA,'+
  ' PA.IDPLANASS,'+
  ' PA.IDPLANOPREV,'+
  ' PA.IDPESSJUR,'+
  ' EL.IDESTAB,'+
  ' EL.MATRICULA,'+
  ' PV.INSCRICAONUMERO'+
  ' FROM'+
  ' PESSOA PE,'+
  ' PESSOA PJ,'+
  ' PLANASS PN,'+
  ' PARTASS PA,'+
  ' PLANPREV PN,'+
  ' PARTPREVPLAN PV,'+
  ' ELEGPATRO EL,'+
  ' PESSOA FI'+
  ' WHERE'+
  ' (PV.INSCRICAONUMERO = '+sInscNumero+') AND'+
  ' (PN.FLGATIVO = 1) AND'+
  ' (EL.IDPESSOA = PE.IDPESSOA) AND'+
  ' (EL.IDPESSJUR = PJ.IDPESSOA) AND'+
  ' (PA.IDPESSOA = EL.IDPESSOA) AND'+
  ' (PA.IDPESSJUR = EL.IDPESSJUR) AND'+
  ' (PA.IDPLANASS = PN.IDPLANASS) AND'+
  ' (PA.IDPLANOPREV = PN.IDPLANOPREV) AND'+
  ' (PV.IDPESSOA = PA.IDPESSOA) AND'+
  ' (PV.IDPESSJUR = PA.IDPESSJUR) AND'+
  ' (PV.IDPLANOPREV = PA.IDPLANOPREV) AND'+
  ' (FI.IDPESSOA(+) = EL.IDESTAB)');
end;

Function SelecionaPartPrev(sIdPessoa:String):OleVariant;
begin
  Result:= GetDataPacked(
   'SELECT'+
   ' EL.IDPESSOA,'+'
   ' EL.MATRICULA,'+
   ' PV.INSCRICAONUMERO,'+
   ' PV.IDPESSJUR,'+
   ' UPPER(SP.DESCRICAO) AS SITUACAO,'+
   ' PE.NOME,'+
   ' PF.DATANASC,'+
   ' TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'+
   ' PF.SEXO,'+
   ' NF.IDRESPONSAVEL,'+
   ' NF.IDNUCLEO,'+
   ' UPPER(PS.NOME) AS RESPONSAVEL,'+
   ' DECODE(PF.ESTCIVIL,''S'',''SOLTEIRO(A)'','+
                       '''C'',''CASADO(A)'','+
                       '''D'',''DIVORCIADO(A)'','+
                       '''V'',''VIÚVO(A)'','+
                       '''O'',''OUTROS'') AS ESTCIVIL,'+
   ' PJ.NOME AS PATROCINADORA,'+
   ' SD.DESCRICAO AS DEPENDENTE,'+
   ' UPPER(DP.DESCRICAO) AS DEPENDENCIA,'+
   ' DECODE(FLGDEPLEGAL, 0, ''NÃO'','+
                        '1, ''SIM'','+
                        'NULL, ''AGREGADO'') AS LEGAL,'+
   ' PL.IDPLANOPREV,
   ' PL.NOME PREVIDENCIARIO,'+
   ' PV.INSCRICAODATA,'+
   ' RTRIM(EP.LOGRADOURO) || ' '|| RTRIM(EP.NUMERO) || ' ' || RTRIM(EP.COMPLEMENTO) || ' ' || RTRIM(EP.BAIRRO) || ' ' || RTRIM(CD.NOME) || ' ' || RTRIM(UF.CODESTADO) || '' CEP: '' || RTRIM(EP.CEP) AS ENDERECO,'+
   ' AGÊNCIA '' || RTRIM(AB.NUMAGENCIA) || '' - C/C Nº ''|| CB.CONTACORRENTE AS CONTA,'+
   ' PB.NOME AS BANCO'+

   ' FROM'+

   ' PESSOA          PE,'+       (* PESSOA TITULAR     *)
   ' PESSOA          PB,'+       (* PESSOA BANCO       *)
   ' PESSOA          PJ,'+       (* PESSOA JURIDICA    *)
   ' PESSOA          PS,'+       (* PESSOA RESPONSAVEL *)
   ' PESSOAFISICA    PF,'+
   ' DEPENTIT        DT,'+
   ' DEPENDENTE      DE,'+
   ' ELEGPATRO       EL,'+
   ' ENDPESS         EP,'+
   ' PARTPREVPLAN    PV,'+
   ' CONTABANCARIA   CB,'+
   ' AGENCIABANCARIA AB,'+
   ' CIDADES         CD,'+
   ' BANCO           BC,'+
   ' ESTADO          UF,'+
   ' DEPEN           DP,'+
   ' SITDEPENDENTE   SD,'+
   ' SITPART         SP,'+
   ' PLANPREV        PL,'+
   ' NUCLEOFAMASS    NF

   ' WHERE'+

(*  FILTRA PESSOA  ( MONTASELECT TRAZ DA PESSOA ) *)
   ' (PE.IDPESSOA = '+sIdPessoa+') AND'+

(*  JOIN PESSOAFISICA COM PESSOA *)
   ' (PF.IDPESSOA = NVL(NF.IDRESPONSAVEL,PE.IDPESSOA)) AND'+

(*  JOIN DEPENTIT COM PESSOA *)
   ' (DT.IDPESSOA    = PE.IDPESSOA) AND'+
   ' (DT.IDTITULAR   = PE.IDPESSOA) AND'+
   ' (DT.IDDEPENDENCIA = DP.IDDEPENDENCIA) AND'+

(*  JOIN DEPENDENTE COM SITDEPENDENTE *)
   ' (DE.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+)) AND'+

(*  JOIN NUCLEOFAMILIAR COM PESSOA *)
   ' (PE.IDPESSOA = NF.IDTITULAR(+)) AND'+

(*  JOIN NUCLEOFAMILIAR COM PESSOA PENSIONISTA *)
   ' (NF.IDRESPONSAVEL = PS.IDPESSOA(+)) AND'+

(*  JOIN DEPENDENTE COM PESSOA *)
   ' (DE.IDPESSOA = PE.IDPESSOA) AND'+

(*  JOIN PARTPREVPLAN COM PESSOA (JURIDICA) *)
   ' (PV.IDPESSJUR = PJ.IDPESSOA) AND'+

(*  JOIN ELEGPATRO COM PARTPREVPLAN *)
   ' (EL.IDPESSOA = DT.IDTITULAR) AND'+
   ' (EL.IDPESSJUR = PV.IDPESSJUR) AND'+

(* JOIN ENDPESS COM PESSOA *)
   ' (PF.IDPESSOA = EP.IDPESSOA(+)) AND'+

(*  JOIN PARTPREVPLAN COM PLANPREV *)
   ' (PV.IDPLANOPREV = PL.IDPLANOPREV) AND'+

(*  JOIN PARTPREVPLAN COM PARTPREVPLAN *)
   ' (PV.IDSITPART = PV.IDSITPART) AND'+
   ' (PV.IDPESSOA  = DT.IDTITULAR) AND'+
   ' (PV.SEQPROPOSTA = PV.SEQPROPOSTA) AND'+

(*  FILTRO PARTPREVPLAN *)
   ' (PV.FLGDESATIVADO = 0) AND'+

(*  JOIN CONTABANCARIA COM PESSOA *)
   ' (CB.IDPESSOA(+) = PE.IDPESSOA) AND'+
   ' (CB.FLGCONTAPREF(+) = 1) AND'+

(*  JOIN AGENCIABANCARIA COM CONTABANCARIA *)
   ' (AB.IDPESSOA(+) = CB.IDAGENCIA) AND'+

(* JOIN CIDADES COM ENDEPESS *)
   ' (CD.IDCIDADES =  EP.IDCIDADES) AND'+
   ' (CD.IDESTADO = CD.IDESTADO) AND'+

(*  JOIN BANCO COM AGENCIABANCARIA *)
   ' (BC.IDPESSOA(+) = AB.IDBANCO) AND'+

(*  JOIN BANCO COM PESSOA (BANCO) *)
   ' (BC.IDPESSOA = PB.IDPESSOA(+)) AND'+

(* JOIN ESTADO COM CIDADES *)
   ' (UF.IDESTADO = CD.IDESTADO) AND'+

(* FILTRO UF *)
   ' (UF.IDPAIS = 1) AND'+

(*  JOIN PESSOA COM ELEGPATRO *)
   ' (PE.IDPESSOA = EL.IDPESSOA) AND'+

(*  JOIN DEPEN COM DEPENTIT *)
   ' (DP.IDDEPENDENCIA = DT.IDDEPENDENCIA) AND'+

(*  JOIN SITPART COM PARTPREVPLAN *)
   ' (SP.IDSITPART = PV.IDSITPART)');

end;




procedure TCtrlPartass.SetCdsPartass(const Value: TClientDataSet);
begin
  FCdsPartass := Value;
end;

procedure TCtrlPartass.SetDbPartass(const Value: TDbPartass);
begin
  FDbPartass := Value;
end;

end.
