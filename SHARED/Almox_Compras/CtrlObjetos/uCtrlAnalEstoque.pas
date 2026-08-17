unit uCtrlAnalEstoque;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uDbAnaliseEstoque,uDbItemAnaliseEstoq, uMidasUtil,uCMTypes;

Type
  TCtrlAnalEstoque = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize; Override;
  private
    _DbAnaliseEstoque   : TDbAnaliseEstoque;
    _DbItemAnaliseEstoq : TDbItemAnaliseEstoq;
    _Progresso          : Integer;
    _MaxProgresso       : Integer;
    FiAnaliseEstoque    : Double;
    FCdsAnalEstoque: TClientDataSet;
    FCdsItensAnalEstoque: TClientDataSet;

    procedure SetiAnaliseEstoque(const Value: Double);
    procedure SetCdsAnalEstoque(const Value: TClientDataSet);
    procedure SetCdsItensAnalEstoque(const Value: TClientDataSet);
    Function CalcConsMed( pCodArt  : String; DI,DF : TDateTime; iDias : Integer; rCodAlmoxarifado : Double) : Double ;
    Function CalcTRM( pCodArt  : String; DI,DF : TDateTime;idEmpresa : Double) : Integer ;
  public
    property CdsAnalEstoque      : TClientDataSet read FCdsAnalEstoque write SetCdsAnalEstoque;
    property CdsItensAnalEstoque : TClientDataSet read FCdsItensAnalEstoque write SetCdsItensAnalEstoque;
    property iAnaliseEstoque     : Double read FiAnaliseEstoque write SetiAnaliseEstoque;

    Constructor Create; Override;
    Destructor  Destroy;Override;
    function AplicaOperacaoAnalEstoque(sBilhete : String;Operacao : TOperacao;bUsaCalcTRM,bUsaCalcCM,bUsaCalcQM,bUsaCalcPR : Boolean): Boolean;
    function AplicaOperacaoAnalEstoqueEsp : Boolean;
    function ProcurarAnalEstoque(iIdAnaliseEstoque : Double): OleVariant;
    function ProcurarDetAnalEstoque(iIdAnaliseEstoque : Double): OleVariant;
    function ListaAnalEstoque(iIdEmpresa, iIdAlmox,iIdAnaliseEstoque: Double; bEmAberto : Boolean): OleVariant;
    function GerarAnalise(sBilhete : String;bUsaCalcTRM,bUsaCalcCM,bUsaCalcQM,bUsaCalcPR : Boolean): Boolean;
    Function CalcQtdeSug(rCM,rPR,rPeriodoCompra,rSaldo,rQtdePendEnt:Double) :Double;
    Function CalcPontoRep(rCM,rPerMin,rQtdeMin,rTRM:Double;bPerc:Boolean) :Double;
    Function CalcQtdeMin(rPerMin,rPtoRep:Double) :Double;
  end;

implementation


procedure TCtrlAnalEstoque.DoChangeDataBase;
begin
  inherited;
  _DbAnaliseEstoque.DatabaseName := DataBaseName;
  _DbItemAnaliseEstoq.DatabaseName := DataBaseName;
end;

constructor TCtrlAnalEstoque.Create;
begin
  inherited;
  _DbAnaliseEstoque := TDbAnaliseEstoque.Create(Self);
  _DbItemAnaliseEstoq := TDbItemAnaliseEstoq.Create(Self);
end;

destructor TCtrlAnalEstoque.Destroy;
begin
  if isAppServer then
     FreeCds([FCdsAnalEstoque,FCdsItensAnalEstoque]);

  _DbAnaliseEstoque.Free;
  _DbItemAnaliseEstoq.Free;

  inherited;
end;


procedure TCtrlAnalEstoque.SetCdsAnalEstoque(
  const Value: TClientDataSet);
begin
  FCdsAnalEstoque := Value;
end;


function TCtrlAnalEstoque.ProcurarAnalEstoque(iIdAnaliseEstoque : Double): OleVariant;
begin
  _DbAnaliseEstoque.IdAnaliseEstoque.AsFloat := iIdAnaliseEstoque;
  Result := GetDataPacket(_DbAnaliseEstoque.SSqlSelect);
end;

function TCtrlAnalEstoque.ListaAnalEstoque(iIdEmpresa, iIdAlmox,iIdAnaliseEstoque: Double; bEmAberto : Boolean): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT                 '+
           '   ANALISEESTOQUE.*,   '+
           '   GRUPPROD.DESCGRUPOPROD,          '+
           '   ALMOX.DESCALMOX     '+
           'FROM                   '+
           '   ANALISEESTOQUE,     '+
           '   GRUPPROD,           '+
           '   ALMOX               '+
           'WHERE ( ANALISEESTOQUE.IDPESSOA = '+FloatToStr(iIdEmpresa)+') '+
           '  AND ( GRUPPROD.CODGRUPOPROD(+) = ANALISEESTOQUE.CODGRUPOPROD ) '+
           '  AND ( ALMOX.CODALMOXARIFADO(+) = ANALISEESTOQUE.CODALMOXARIFADO ) ';
   if (iIdAlmox <> 0) then begin
      sSql := sSql +'  AND (ANALISEESTOQUE.CODALMOXARIFADO = '+FloatToStr(iIdAlmox)+') ';
   end;
   if (iIdAnaliseEstoque <> 0) then begin
      sSql := sSql +'  AND (ANALISEESTOQUE.IDANALISEESTOQUE = '+FloatToStr(iIdAnaliseEstoque)+') ';
   end;
   if bEmAberto then begin
      sSql := sSql +'  AND (ANALISEESTOQUE.FLGACEITA = ''N'') ';
   end;
   sSql := sSql + 'ORDER BY DESCALMOX, IDANALISEESTOQUE ';
   Result := GetDataPacket(sSql);
end;

function TCtrlAnalEstoque.AplicaOperacaoAnalEstoque(sBilhete : String;Operacao : TOperacao;bUsaCalcTRM,bUsaCalcCM,bUsaCalcQM,bUsaCalcPR : Boolean): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoAnalEstoque(sBilhete,Integer(Operacao),bUsaCalcTRM,bUsaCalcCM,bUsaCalcQM,bUsaCalcPR,CdsAnalEstoque.Data,CdsItensAnalEstoque.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then
            Begin
               FiAnaliseEstoque := FCdsAnalEstoque.FieldByName('IDANALISEESTOQUE').AsFloat;
               FCdsItensAnalEstoque.First;
               while not FCdsItensAnalEstoque.Eof do
                  FCdsItensAnalEstoque.delete;
               Result := ApplyCDS(FCdsItensAnalEstoque,_DbItemAnaliseEstoq,[],[]);
               If Not Result Then
                  Raise Exception.Create( _DbItemAnaliseEstoq.MessageInfo );
               //
               Result := ApplyCDS(FCdsAnalEstoque,_DbAnaliseEstoque,[],[]);
               If Not Result Then
                  Raise Exception.Create( _DbAnaliseEstoque.MessageInfo );
            end
         Else
            Begin
               Result := ApplyCDS(FCdsAnalEstoque,_DbAnaliseEstoque,[],[]);
               If Not Result Then
                  Raise Exception.Create( _DbAnaliseEstoque.MessageInfo );
               //
               FiAnaliseEstoque := _DbAnaliseEstoque.Idanaliseestoque.AsFloat;
               if FCdsItensAnalEstoque.IsEmpty then
                  Begin
                     if not GerarAnalise(sBilhete,bUsaCalcTRM,bUsaCalcCM,bUsaCalcQM,bUsaCalcPR) then
                        Raise Exception.Create( MessageInfo );
                  end;
               Result := ApplyCDS(FCdsItensAnalEstoque,_DbItemAnaliseEstoq,[_DbAnaliseEstoque.Idanaliseestoque],[_DbItemAnaliseEstoq.Idanaliseestoque],True);
               If Not Result Then
                  Raise Exception.Create( _DbItemAnaliseEstoq.MessageInfo );
            end;
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

procedure TCtrlAnalEstoque.OnCreateAppServer;
begin
  inherited;
  FCdsAnalEstoque      := TClientDataSet.Create(nil);
  FCdsItensAnalEstoque := TClientDataSet.Create(nil);
end;


function TCtrlAnalEstoque.GerarAnalise(sBilhete : String;bUsaCalcTRM,bUsaCalcCM,bUsaCalcQM,bUsaCalcPR : Boolean): Boolean;
var
   sCodArtigo   : String;
   //
   iTempRessup  : Integer;
   iDias        : Integer;
   rConsMed     : Double;
   rPtoRep      : Double;
   rQtdeMin     : Double;
   rQtdeSug     : Double;
   //
   iTempRessup2 : Integer;
   rConsMed2    : Double;
   rPtoRep2     : Double;
   rQtdeMin2    : Double;
   rQtdeSug2    : Double;
   //
   iTempRessupV : Integer;
   rConsMedV    : Double;
   rPtoRepV     : Double;
   //
   bPerc        : Boolean;
   sSql         : String;
begin
   Try
      MessageInfo := '';
      Result      := True;
      //
      iDias:=Trunc((FCdsAnalEstoque.FieldByName('DATAFIMCONSMED').AsDateTime - FCdsAnalEstoque.FieldByName('DATAINICONSMED').AsDateTime)+1);
      sSql := ' Select   '+
              '     S.CODARTIGO,    '+
              '     S.ESTMINUSADO,  '+
              '     S.PTORESUSADO,  '+
              '     S.TEMRESUSADO,  '+
              '     S.CONMEDUSADO,  '+
              '     S.PERIODOCOMPRA,'+
              '     S.SALDOQTDE,    '+
              '    ( P.DescProd || '' '' || A.CodTamanho || '' '' || A.CodCor ) as Descricao '+
              ' From                '+
              '     Saldo S,        '+
              '     Produto P,      '+
              '     Artigo A        '+
              ' Where               '+
              '       (S.CodAlmoxarifado = '+FloatToStr(FCdsAnalEstoque.FieldByName('CODALMOXARIFADO').AsFloat)+')  '+
              '   And (S.idPessoa = '+FloatToStr(FCdsAnalEstoque.FieldByName('IDPESSOA').AsFloat)+')         ';
      If not FCdsAnalEstoque.FieldByName('CODGRUPOPROD').isNull Then
         sSql := sSql + ' And (RTRIM(P.CODGRUPOPROD) = '''+Trim(FCdsAnalEstoque.FieldByName('CODGRUPOPROD').AsString)+''')';
      sSql := sSql +'   And ( P.ITEMESTOCAVEL = ''S'')      '+
                    '   AND (A.FLGATIVO = ''S'')            '+
                    '   And ( A.CodProduto = P.CodProduto)  '+
                    '   And ( A.CodArtigo = S.CodArtigo )   ';
      _Cds.Data := GetDataPacket(sSql);
      //
      If _Cds.IsEmpty Then
         Raise Exception.Create('Não foi encontrado nenhum artigo para Análise');
      //
      With _Cds do
         Begin
            _MaxProgresso := RecordCount;
            _Progresso    := 0;
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso)]);
            First;
            While Not EOF Do
               Begin
                  inc(_Progresso);
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso)]);
                  //
                  sCodArtigo  := Copy(trim(FieldByName('CODARTIGO').asString)+'                    ',1,14);
                  iTempRessup := CalcTRM(sCodArtigo,FCdsAnalEstoque.FieldByName('DATAINITRMED').AsDateTime,
                                         FCdsAnalEstoque.FieldByName('DATAFIMTRMED').AsDateTime,FCdsAnalEstoque.FieldByName('IDPESSOA').AsFloat);
                  rConsMed    := CalcConsMed(sCodArtigo, FCdsAnalEstoque.FieldByName('DATAINICONSMED').AsDateTime,FCdsAnalEstoque.FieldByName('DATAFIMCONSMED').AsDateTime,iDias,FCdsAnalEstoque.FieldByName('CODALMOXARIFADO').AsFloat);
                  //
                  rQtdeMin2    := FieldByName('ESTMINUSADO').asFloat;
                  rPtoRep2     := FieldByName('PTORESUSADO').asFloat;
                  iTempRessup2 := FieldByName('TEMRESUSADO').asInteger;
                  rConsMed2    := FieldByName('CONMEDUSADO').asFloat;
                  //
                  If bUsaCalcTRM Then
                     iTempRessupV := iTempRessup
                  Else
                     iTempRessupV := iTempRessup2;
                  //
                  If bUsaCalcCM Then
                     rConsMedV := rConsMed
                  Else
                     rConsMedV := rConsMed2;
                  //
                  if bUsaCalcQM then
                     bPerc:=True
                  else
                     bPerc:=False;
                  rPtoRep   := CalcPontoRep(rConsMedV,FCdsAnalEstoque.FieldByName('PERCMINIMO').AsFloat,rQtdeMin2,iTempRessupV,bPerc);
                  //
                  If bUsaCalcPR Then
                     rPtoRepV := rPtoRep
                  Else
                     rPtoRepV := rPtoRep2;
                  //
                  rQtdeMin    := CalcQtdeMin(FCdsAnalEstoque.FieldByName('PERCMINIMO').AsFloat,rPtoRepV);
                  //
                  //
                  // Calculo da Quantidade Sugerida
                  //
                  rQtdeSug2:=CalcQtdeSug(rConsMedV,rPtoRepV,FieldByName('PERIODOCOMPRA').asFloat,FieldByName('SALDOQTDE').asFloat,0);
                  rQtdeSug :=CalcQtdeSug(rConsMed,rPtoRep,FieldByName('PERIODOCOMPRA').asFloat,FieldByName('SALDOQTDE').asFloat,0);
                  //
                  FCdsItensAnalEstoque.Append;
                  FCdsItensAnalEstoque.FieldByName('CodArtigo').asString         := sCodArtigo;
                  FCdsItensAnalEstoque.FieldByName('Descricao').asString         := FieldByName('Descricao').asString;
                  //
                  FCdsItensAnalEstoque.FieldByName('CONSMEDCALCULADO').asFloat   := rConsMed;
                  FCdsItensAnalEstoque.FieldByName('TRMEDCALCULADO').asInteger   := iTempRessup;
                  FCdsItensAnalEstoque.FieldByName('PONTOREPCALCULADO').asFloat  := rPtoRep;
                  FCdsItensAnalEstoque.FieldByName('QTDEMINCALCULADA').asFloat   := rQtdeMin;
                  FCdsItensAnalEstoque.FieldByName('QTDESUGAUTO').asFloat        := rQtdeSug;
                  //
                  FCdsItensAnalEstoque.FieldByName('CONSMEDINFORMADO').asFloat   := rConsMed2;
                  FCdsItensAnalEstoque.FieldByName('TRMEDINFORMADO').asInteger   := iTempRessup2;
                  FCdsItensAnalEstoque.FieldByName('PONTOREPINFORMADO').asFloat  := rPtoRep2;
                  FCdsItensAnalEstoque.FieldByName('QTDEMININFORMADA').asFloat   := rQtdeMin2;
                  FCdsItensAnalEstoque.FieldByName('QTDESUGCALCULADA').asFloat   := rQtdeSug2;
                  FCdsItensAnalEstoque.FieldByName('QTDECOMPRAR').asFloat        := rQtdeSug2;
                  //
                  If bUsaCalcCM Then
                     FCdsItensAnalEstoque.FieldByName('FLGCONSMEDCALC').asString := 'S'
                  Else
                     FCdsItensAnalEstoque.FieldByName('FLGCONSMEDCALC').asString := 'N';

                  If bUsaCalcTRM Then
                     FCdsItensAnalEstoque.FieldByName('FLGTEMPMEDCALC').asString := 'S'
                  Else
                     FCdsItensAnalEstoque.FieldByName('FLGTEMPMEDCALC').asString := 'N';

                  If bUsaCalcPR Then
                     FCdsItensAnalEstoque.FieldByName('FLGPONTOREPCALC').asString := 'S'
                  Else
                     FCdsItensAnalEstoque.FieldByName('FLGPONTOREPCALC').asString := 'N';

                  If bUsaCalcQM Then
                     FCdsItensAnalEstoque.FieldByName('FLGQTDEMINCALC').asString  := 'S'
                  Else
                     FCdsItensAnalEstoque.FieldByName('FLGQTDEMINCALC').asString  := 'N';

                  FCdsItensAnalEstoque.FieldByName('SALDOESTOQUE').asFloat  := FieldByName('SALDOQTDE').asFloat;
                  FCdsItensAnalEstoque.FieldByName('PERIDOCOMPRA').asFloat  := FieldByName('PERIODOCOMPRA').asFloat;
                  FCdsItensAnalEstoque.Post;
                  //
                  Next;
               End;
         End;
   Except
      On E:Exception Do Begin
         Result := False;
         MessageInfo := E.Message;
      End;
   end;
end;

procedure TCtrlAnalEstoque.AfterInitialize;
begin
  inherited;
end;

procedure TCtrlAnalEstoque.SetiAnaliseEstoque(const Value: Double);
begin
  FiAnaliseEstoque := Value;
end;

procedure TCtrlAnalEstoque.SetCdsItensAnalEstoque(
  const Value: TClientDataSet);
begin
  FCdsItensAnalEstoque := Value;
end;

function TCtrlAnalEstoque.CalcConsMed( pCodArt  : String; DI,DF : TDateTime; iDias : Integer; rCodAlmoxarifado : Double) : Double ;
var sSql : String;
begin
   sSql := ' SELECT '+
           '      (SUM(QTDEMOV)* -1) AS CM '+
           ' FROM '+
           '      MOVIMENT  '+
           ' WHERE '+
           '      (CODARTIGO = '''+pCodArt+''')'+
           '  AND (DATAMOV >= TO_DATE('''+DateToStr(DI)+''',''dd/mm/yyyy'')) '+
           '  AND (DATAMOV <= TO_DATE('''+DateToStr(DF)+''',''dd/mm/yyyy'')) '+
           '  AND (CODALMOXARIFADO ='+ FloatToStr(rCodAlmoxarifado)+')'+
           '  AND (CODTIPOMOV <> ''A'') '+
           '  AND (CODTIPOMOV <> ''K'') '+
           '  AND (CODTIPOMOV <> ''Z'') ';
   OpenDataSet(sSql);
   If _lDataSet.IsEmpty Then
      Result := 0
   Else
      Result := (_lDataSet.FieldByName('CM').AsFloat/iDias);
end;

function TCtrlAnalEstoque.CalcPontoRep(rCM, rPerMin, rQtdeMin,
  rTRM: Double; bPerc: Boolean): Double;
begin
    if bPerc then
       result := (rCM*rTRM)/(1 - (rPerMin/100))
    else
       result := (rCM*rTRM)+rQtdeMin;
end;

function TCtrlAnalEstoque.CalcQtdeMin(rPerMin, rPtoRep: Double): Double;
begin
    result :=(rPtoRep*(rPerMin/100));
end;

function TCtrlAnalEstoque.CalcQtdeSug(rCM, rPR, rPeriodoCompra,
  rSaldo,rQtdePendEnt: Double): Double;
begin
   Result := (rCM * rPeriodoCompra)+ rPR - rSaldo - rQtdePendEnt;
   If Result < 0 Then
      Result := 0;
end;

function TCtrlAnalEstoque.CalcTRM(pCodArt: String; DI,
  DF: TDateTime;idEmpresa : Double): Integer;
var sSql : String;
begin
   sSql := ' SELECT '+
           '      ((Sum(Numdias)/Count(*)) ) as TRM '+
           ' From SoliBaixadas '+
           ' Where '+
           '      (DataEmisSoli >= To_Date('''+DateToStr(DI)+''',''dd/mm/yyyy'') )'+
           '  And (DataReceb <= To_Date('''+DateToStr(DF)+''',''dd/mm/yyyy'') )'+
           '  And (idPessoa = '+ FloatToStr(idEmpresa)+')'+
           '  And (IDITEMSOLI IN (SELECT IDITEMSOLI FROM ITEMSOLI WHERE (CodArtigo = '''+pCodArt+''')) ) ';
   OpenDataSet(sSql);
   If _lDataSet.IsEmpty Then
      Result := 0
   Else
      Result := _lDataSet.FieldByName('TRM').asInteger;
end;

function TCtrlAnalEstoque.ProcurarDetAnalEstoque(
  iIdAnaliseEstoque: Double): OleVariant;
var sSql : String;
begin
   sSql := ' SELECT '+
           '     I.IDANALISEESTOQUE, '+
           '     I.CODARTIGO,        '+
           '     I.FLGQTDEMINCALC,   '+
           '     I.TRMEDCALCULADO,   '+
           '     I.TRMEDINFORMADO,   '+
           '     I.CONSMEDCALCULADO, '+
           '     I.FLGTEMPMEDCALC,   '+
           '     I.CONSMEDINFORMADO, '+
           '     I.FLGCONSMEDCALC,   '+
           '     I.PONTOREPCALCULADO,'+
           '     I.FLGPONTOREPCALC,  '+
           '     I.PONTOREPINFORMADO,'+
           '     I.QTDEMINCALCULADA, '+
           '     I.QTDEMININFORMADA, '+
           '     I.QTDESUGAUTO,      '+
           '     I.QTDESUGCALCULADA, '+
           '     I.QTDECOMPRAR,      '+
           '     I.SALDOESTOQUE,     '+
           '     I.PERIDOCOMPRA,     '+
           '     P.CODMEDCUSTO,     '+
           '     ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO '+
           'FROM                                                                       '+
           '         ITEMANALISEESTOQ I,                                               '+
           '         ARTIGO A,                                                         '+
           '         PRODUTO P                                                         '+
           'WHERE                                                                      '+
           '           ( I.IDANALISEESTOQUE  = '+FloatToStr(iIdAnaliseEstoque)+')      '+
           '  AND ( A.CODARTIGO = I.CODARTIGO)                                         '+
           '  AND ( A.CODPRODUTO = P.CODPRODUTO)                                       ';
   Result := GetDataPacket(sSql);
end;

function TCtrlAnalEstoque.AplicaOperacaoAnalEstoqueEsp: Boolean;
Begin
   If ConnectionSide = cnsClient then
      begin
         Result := Connection.AppServer.AplicaOperacaoAnalEstoqueEsp;
         If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         MessageInfo := '';
         Try
            StartTransaction;
            Result := ApplyCDS(FCdsAnalEstoque,_DbAnaliseEstoque,[],[]);
            If Not Result Then
               Raise Exception.Create( _DbAnaliseEstoque.MessageInfo );
            //
            FiAnaliseEstoque := _DbAnaliseEstoque.Idanaliseestoque.AsFloat;
            Result := ApplyCDS(FCdsItensAnalEstoque,_DbItemAnaliseEstoq,[_DbAnaliseEstoque.Idanaliseestoque],[_DbItemAnaliseEstoq.Idanaliseestoque],True);
            If Not Result Then
               Raise Exception.Create( _DbItemAnaliseEstoq.MessageInfo );
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


end.





