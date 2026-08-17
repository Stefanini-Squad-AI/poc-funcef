unit uCtrlInserePart;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbPartass, uDbBenefass,
      UDbContass, uSistema, DB, uDataBase, DbClient;

  Type
    TCtrlInserePart = Class(TCmControlObject)

    private
    FDbPartass: TDbPartass;
    FDbBenefass: TDbBenefass;
    FDbContass: TDbContass;

    FCdsPartass: TClientDataSet;
    FCdsBenefass: TClientDataSet;
    FCdsContass: TClientDataSet;

    FCdsPartPrev: TClientDataSet;
    FCdsParticipante: TClientDataSet;
    FCdsRegraAdm: TClientDataSet;

    procedure SetDbPartass(const Value: TDbPartass);
    procedure SetDbBenefass(const Value: TDbBenefass);
    procedure SetDbContass(const Value: TDbContass);

    procedure SetCdsPartass(const Value: TClientDataSet);
    procedure SetCdsBenefass(const Value: TClientDataSet);
    procedure SetCdsContass(const Value: TClientDataSet);

    procedure SetCdsPartPrev(const Value: TClientDataSet);
    procedure SetCdsParticipante(const Value: TClientDataSet);
    procedure SetCdsRegraAdm(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property DbPartass: TDbPartass read FDbPartass write SetDbPartass;
      property DbBenefass: TDbBenefass read FDbBenefass write SetDbBenefass;
      property DbContass: TDbContass read FDbContass write SetDbContass;

      property CdsPartass: TClientDataSet read FCdsPartass write SetCdsPartass;
      property CdsBenefass: TClientDataSet read FCdsBenefass write SetCdsBenefass;
      property CdsContass: TClientDataSet read FCdsContass write SetCdsContass;

      property CdsPartPrev: TClientDataSet read FCdsPartPrev write SetCdsPartPrev;
      property CdsParticipante: TClientDataSet read FCdsParticipante write SetCdsParticipante;
      property CdsRegraAdm: TClientDataSet read FCdsRegraAdm write SetCdsRegraAdm;

      Function Inserir(Tb:Char): Boolean;

      Function SelParticipante(sInscNumero:String): OleVariant;
      Function SelPlanos(sIdPessoa:String):OleVariant;
      Function SelPlanosPart(sIdPessoa,sIdPlanass:String):OleVariant;
      Function SelContribuicao(sIdPlanass:String):OleVariant;
      Function SelIdRegra(sIdPlanass:String):OleVariant;
      Function SelAssocPlanPrev(sIdPessJur,sIdPlanass,
                sIdPlanoPrev:String):OleVariant;
      Function SelPartExiste(sIdPessoa:String):OleVariant;

    protected

    End;

implementation

{ TCtrlInserePart }

constructor TCtrlInserePart.Create;
begin
  inherited;
  FDbPartass := TDbPartass.Create;
  FDbBenefass:= TDbBenefass.Create;
  FDbContass := TDbContass.Create;

  FCdsPartass := TClientDataSet.Create(nil);
  FCdsBenefass:= TClientDataSet.Create(nil);
  FCdsContass := TClientDataSet.Create(nil);

  FCdsPartPrev := TClientDataSet.Create(nil);
  FCdsParticipante := TClientDataSet.Create(nil);
  FCdsRegraAdm := TClientDataSet.Create(nil);
end;

destructor TCtrlInserePart.Destroy;
begin
  FDbPartass.Free;
  FDbBenefass.Free;
  FDbContass.Free;

  FCdsPartass.Free;
  FCdsBenefass.Free;
  FCdsContass.Free;

  FCdsPartPrev.Free;
  FCdsParticipante.Free;
  FCdsRegraAdm.Free;
  inherited;
end;

procedure TCtrlInserePart.DoChangeDataBase;
begin
  inherited;
  DbPartass.DataBaseName := DataBaseName;
  DbBenefass.DataBaseName := DataBaseName;
  DbContass.DataBaseName := DataBaseName;
end;

function TCtrlInserePart.Inserir(Tb:Char): Boolean;
begin
  Result:=False;
  If Tb In ['P','B','C'] then
{ If Tb In ['P'] then }{teste}{}
  begin
    If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
    End
     Else
     Begin
       Try
        { Case Tb Of
           'P': CdsToDbObject(CdsPartass,DbPartass);
           'B': CdsToDbObject(CdsBenefass,DbBenefass);
           'C': CdsToDbObject(CdsContass,DbContass);
         end;}{Case}     
         StartTransaction;
         Case Tb Of
           'P': Result := DbPartass.Insert;
           'B': Result := DbBenefass.Insert;
           'C': Result := DbContass.Insert;
         end; {Case}
         If Not Result Then
         Begin
           Case Tb Of
             'P': MessageInfo := DbPartass.MessageInfo;
             'B': MessageInfo := DbBenefass.MessageInfo;
             'C': MessageInfo := DbContass.MessageInfo;
           end; {Case}
           Rollback;
         End else Commit;
       Except
         On E:Exception Do
         Begin
           Result := False;
           Rollback;

           MessageInfo := E.Message;
        End;
      end;
     End;
  end;
end;

Function TCtrlInserePart.SelParticipante(sInscNumero:String): OleVariant;
begin
  Result:= GetDataPacket(
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

Function TCtrlInserePart.SelPlanos(sIdPessoa:String):OleVariant;
begin
  Result:= GetDataPacket(
   'SELECT IDPLANASS,NOME,OPCAOAIDENT,OPCAOBDIF,CODPORTFORMA'+
   ' FROM PLANASS'+
   ' WHERE'+
   ' FLGATIVO = 1 AND'+
   ' IDPLANASS NOT IN (SELECT P.IDPLANASS'+
                       ' FROM PARTASS P, BENEFASS BA, PLANPREV PP,'+
                       ' PLANASS PA, SITPLANOASS S'+
                       ' WHERE'+
                       ' (P.IDPESSOA = '+sIdPessoa+') AND'+
                       ' (P.IDPESSOA = BA.IDTITULAR(+)) AND'+
                       ' (P.IDPESSJUR = BA.IDPESSJUR(+)) AND'+
                       ' (P.IDPLANOPREV = BA.IDPLANOPREV(+)) AND'+
                       ' (P.IDPLANASS = BA.IDPLANASS(+)) AND'+
                       ' (P.IDPESSOA = BA.IDDEPENDENTE(+)) AND'+
                       ' (P.SEQPROPOSTA = BA.SEQPROPOSTA(+)) AND'+
                       ' (P.IDPLANASS = PA.IDPLANASS) AND'+
                       ' (P.IDPLANOPREV = PP.IDPLANOPREV) AND'+
                       ' (P.IDSITPART= S.IDSITPLANOASS))');
end;

Function TCtrlInserePart.SelPlanosPart(sIdPessoa,sIdPlanass:String):OleVariant;
begin
  Result:= GetDataPacket(
   'SELECT IDPLANASS,NOME,OPCAOAIDENT,OPCAOBDIF,CODPORTFORMA'+
   ' FROM PLANASS'+
   ' WHERE'+
   ' (FLGATIVO = 1) AND'+
   ' (IDPLANASS = '+sIdPlanass+') AND'+
   ' (IDPLANASS IN (SELECT P.IDPLANASS'+
                    ' FROM  PARTASS P, BENEFASS BA, PLANPREV PP,'+
                    ' PLANASS PA, SITPLANOASS S'+
                    ' WHERE'+
                    ' (P.IDPESSOA = '+sIdPessoa+') AND'+
                    ' (P.IDPESSOA = BA.IDTITULAR(+)) AND'+
                    ' (P.IDPESSJUR = BA.IDPESSJUR(+)) AND'+
                    ' (P.IDPLANOPREV = BA.IDPLANOPREV(+)) AND'+
                    ' (P.IDPLANASS = BA.IDPLANASS(+)) AND'+
                    ' (P.IDPESSOA = BA.IDDEPENDENTE(+)) AND'+
                    ' (P.SEQPROPOSTA = BA.SEQPROPOSTA(+)) AND'+
                    ' (P.IDPLANASS = PA.IDPLANASS) AND'+
                    ' (P.IDPLANOPREV = PP.IDPLANOPREV) AND'+
                    ' (P.IDSITPART= S.IDSITPLANOASS)))');
end;

Function TCtrlInserePart.SelContribuicao(sIdPlanass:String):OleVariant;
begin
  Result:= GetDataPacket(
    'SELECT CT.IDCONTASS,CTO.NOME,CT.CODPORTFORMA,'+
    ' CT.FLGCOBCARNE,CT.PAGADOR'+
    ' FROM CONTRIBASS CT, CONTRIBUICAO CTO'+
    ' WHERE'+
    ' (CT.IDPLANASS = '+sIdPlanass+') AND'+
    ' (CTO.IDCONTRIBUICAO = CT.IDCONTASS)');
end;


Function TCtrlInserePart.SelIdRegra(sIdPlanass:String):OleVariant;
begin
  Result:= GetDataPacket(
    'SELECT IDREGRAADMISSAO'+
    ' FROM PLANASS'+
    ' WHERE IDPLANASS = '+sIDPlanass);
end;

Function TCtrlInserePart.SelAssocPlanPrev(sIdPessJur,sIdPlanass,
          sIdPlanoPrev:String):OleVariant;
begin
  Result:= GetDataPacket(
    'SELECT IDPESSJUR, IDPLANOPREV, IDPLANASS'+
    ' FROM PLANPREVASS'+
    ' WHERE (IDPESSJUR = '+sIdPessJur+') AND'+
    ' (IDPLANASS = '+sIdPlanass+') AND'+
    ' (IDPLANOPREV = '+sIdPlanoPrev+')');
end;

Function TCtrlInserePart.SelPartExiste(sIdPessoa:String):OleVariant;
begin
  Result:= GetDataPacket(
    'SELECT IDPESSOA FROM PARTASS WHERE IDPESSOA = '+sIdPessoa);
end;

procedure TCtrlInserePart.SetDbPartass(const Value: TDbPartass);
begin
  FDbPartass := Value;
end;

procedure TCtrlInserePart.SetDbBenefass(const Value: TDbBenefass);
begin
  FDbBenefass := Value;
end;

procedure TCtrlInserePart.SetDbContass(const Value: TDbContass);
begin
  FDbContass := Value;
end;

procedure TCtrlInserePart.SetCdsPartass(const Value: TClientDataSet);
begin
  FCdsPartass:= Value;
end;

procedure TCtrlInserePart.SetCdsBenefass(const Value: TClientDataSet);
begin
  FCdsBenefass:= Value;
end;

procedure TCtrlInserePart.SetCdsContass(const Value: TClientDataSet);
begin
  FCdsContass:= Value;
end;
 
procedure TCtrlInserePart.SetCdsPartPrev(const Value: TClientDataSet);
begin
  FCdsPartPrev:= Value;
end;

procedure TCtrlInserePart.SetCdsParticipante(const Value: TClientDataSet);
begin
  FCdsParticipante:= Value;
end;

procedure TCtrlInserePart.SetCdsRegraAdm(const Value: TClientDataSet);
begin
  FCdsRegraAdm:= Value;
end;

end.
