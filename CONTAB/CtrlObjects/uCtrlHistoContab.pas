unit uCtrlHistoContab;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils, uMidasUtil,
     uDbHistoContab, Provider,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

Type
  { tohCodigo      => Ordenados Codigo
    tohDescricao   => Ordenados Descrição
  }
  TTipoOrdenaHist  = (tohCodigo, tohDescricao);

  TCtrlHistoContab = class(TCmControlObject)


  private
       FHist3: String;
       FHist4: String;
       FHist5: String;
       FHist2: String;
       FHist1: String;
       FHistorico :String;
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbHistoContab  : TDbHistoContab;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FcdsHistoContab : TClientDataSet;

      procedure SetCdsHistoContab(const Value: TClientDataSet);

      procedure SetHist1(const Value: String);
      procedure SetHist2(const Value: String);
      procedure SetHist3(const Value: String);
      procedure SetHist4(const Value: String);
      procedure SetHist5(const Value: String);
      procedure SetHistorico(const Value: String);
  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

  public
      Property Hist1 : String read FHist1 write SetHist1;
      Property Hist2 : String read FHist2 write SetHist2;
      Property Hist3 : String read FHist3 write SetHist3;
      Property Hist4 : String read FHist4 write SetHist4;
      Property Hist5 : String read FHist5 write SetHist5;
      Property Historico : String read FHistorico write SetHistorico;
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property cdsHistoContab: TClientDataSet Read FcdsHistoContab Write SetcdsHistoContab;

      {Esta função tem como objetivo retornar o historico arrumado para gravar em 5 linhas}
      Function ArrumaHistorico(sHistorico : String) : Boolean;

      {Esta função tem como objetivo verificar se um determinado historico tem lançamento}
      Function HistoTemLancamento(dIdEmpresa : Double;sHisto :String) : Boolean;

      {Esta funcao retorna os historicos contabeis }
      Function ListHistoContab(dIdEmpresa : Double; TipoOrdenaHist : TTipoOrdenaHist; sHistoPadrao: String) : OleVariant;

      {Esta função tem o objetivo de gravar históricos contabeis}
      Function Gravar :Boolean;

      {Esta função Valida Historico }
      Function ValidaHistorico : Boolean;

      {Esta procedure formata as linhas do historico}
      Procedure FormataLinhasHisto(Hist1,Hist2,Hist3,Hist4,Hist5 :String);

  end;

implementation


function TCtrlHistoContab.ArrumaHistorico(sHistorico : String) : Boolean;
var iFator,ia,i,iNumero:Integer;
    aHistorico:Array[1..5] of String;
begin
   Result := True;
   iFator:=0;
   aHistorico[1]:='';
   aHistorico[2]:='';
   aHistorico[3]:='';
   aHistorico[4]:='';
   aHistorico[5]:='';
   for ia := 1 to 5 do begin
      aHistorico[ia]:=copy(sHistorico,(iFator+1),40);
      if length(trim(copy(sHistorico,(iFator+1),200))) <= 40 then
         Break;
      iNumero:=40;
      for i := 1 to 40 do
      begin
        if copy(aHistorico[ia],iNumero,1) = ' ' then
        Begin
           aHistorico[ia]:=copy(sHistorico,(iFator+1),iNumero);
           Break;
        end;
        iNumero:=(iNumero-1);
      end;
      iFator:=iFator+iNumero;
   end;
   FHist1:=aHistorico[1];
   FHist2:=aHistorico[2];
   FHist3:=aHistorico[3];
   FHist4:=aHistorico[4];
   FHist5:=aHistorico[5];
end;

procedure TCtrlHistoContab.OnCreateAppServer;
begin
  inherited;
  FcdsHistoContab:= TClientDataSet.Create(nil);

end;

function TCtrlHistoContab.ValidaHistorico: Boolean;
begin
   Result := True;
   if FHistorico = '' Then
   begin
      Result := False;
      MessageInfo := 'O Histórico deve ser preenchido';
   end;
end;


constructor TCtrlHistoContab.Create;
begin
  inherited;
  _dbHistoContab := TDbHistoContab.Create(Self);
end;

destructor TCtrlHistoContab.Destroy;
begin
  inherited;
  _dbHistoContab.Free;

  if isAppServer then
     FreeCds([FcdsHistoContab]);
end;

function TCtrlHistoContab.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaHistoContab( FcdsHistoContab.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsHistoContab,_dbHistoContab,[],[] );
           Msg    := _dbHistoContab.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
           
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;

procedure TCtrlHistoContab.DoChangeDataBase;
begin
  inherited;
  _dbHistoContab.DataBaseName  := DataBaseName;
end;


function TCtrlHistoContab.ListHistoContab(dIdEmpresa : Double; TipoOrdenaHist : TTipoOrdenaHist; sHistoPadrao: String) : OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin
       sSql := 'SELECT  ' +
               '  HITCODHIST,        ' +
               '  IDPESSOA,          ' +
               '  IDUSUARIOINCLUSAO, ' +
               '  HITDESCR1          ' +
               'FROM ' +
               '  HISTOPADRAO ';

      //----------------------------------------------------
      sFiltro := '';
      If (dIdEmpresa <> 0) Then
         sFiltro :=  'WHERE (IDPESSOA = ' + FloatToStr(dIdEmpresa) + ')' ;
      //----------------------------------------------------
      if sHistoPadrao <> '' Then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (HITCODHIST = '''+sHistoPadrao+''') '
         else
            sFiltro := sFiltro +  'AND (HITCODHIST = '''+sHistoPadrao+''') ';
      End;
      //----------------------------------------------------
      Case TipoOrdenaHist of
         tohCodigo     : sOrdena := 'ORDER BY HITCODHIST ';
         tohDescricao  : sOrdena := 'ORDER BY HITDESCR1 ';
      End;
      //----------------------------------------------------

      sSql := sSql + sFiltro + sOrdena;

      Result := GetDataPacket(sSql);
end;
procedure TCtrlHistoContab.SetHist1(const Value: String);
begin
  FHist1 := Value;
end;

procedure TCtrlHistoContab.SetHist2(const Value: String);
begin
  FHist2 := Value;
end;

procedure TCtrlHistoContab.SetHist3(const Value: String);
begin
  FHist3 := Value;
end;

procedure TCtrlHistoContab.SetHist4(const Value: String);
begin
  FHist4 := Value;
end;

procedure TCtrlHistoContab.SetHist5(const Value: String);
begin
  FHist5 := Value;
end;
procedure TCtrlHistoContab.SetCdsHistoContab(const Value: TClientDataSet);
begin
  FCdsHistoContab := Value;
end;



function TCtrlHistoContab.HistoTemLancamento(dIdEmpresa:Double;sHisto: String) : Boolean;
begin
    sHisto := Copy(sHisto + '         ',1,4);

    _cds.Data := GetDataPacket('SELECT HITCODHIST  ' +
                              'FROM  LANCAMENTO ' +
                              'WHERE (IDPESSOA = ' + FloatToStr(dIdEmpresa) + ') AND ' +
                              '      (HITCODHIST = '''+ (sHisto) + ''')');

     If _cds.isEmpty Then
        Result := False
     Else
        Result := True;
        
end;
procedure TCtrlHistoContab.SetHistorico(const Value: String);
begin
  FHistorico := Value;
end;

procedure TCtrlHistoContab.FormataLinhasHisto(Hist1, Hist2, Hist3, Hist4,Hist5: string);
 var
   Hist : Array[1..5] of String;
   i, iMax, iLoop : Integer;
   sComp : String;

begin
      Hist[1] := Hist1;
      Hist[2] := Hist2;
      Hist[3] := Hist3;
      Hist[4] := Hist4;
      Hist[5] := Hist5;

      For iLoop := 1 to 5 do
      Begin
         i := 1;
         iMax := length(trim(Hist[iLoop])) + 1;
         sComp := StringOfChar ('c',40 - Length(Trim(Hist[iLoop])));

         While  i < iMax do
         Begin
            If copy(Hist[iLoop],i,1) = '#' Then
            Begin
               Hist[iLoop] := copy(Hist[iLoop], 1, i-1) + 'c' + copy(Hist[iLoop], i+1, iMax-i);
            End Else
            Begin
               Hist[iLoop] := copy(Hist[iLoop], 1, i-1) + '\' + copy(Hist[iLoop], i, iMax-i);
               inc(i);
               inc(iMax);
            End;
            inc(i);
         End;
         Case iLoop of
            1 : FHist1 := Trim(Hist[iLoop]) + sComp + ';1;_';
            2 : FHist2 := Trim(Hist[iLoop]) + sComp + ';1;_';
            3 : FHist3 := Trim(Hist[iLoop]) + sComp + ';1;_';
            4 : FHist4 := Trim(Hist[iLoop]) + sComp + ';1;_';
            5 : FHist5 := Trim(Hist[iLoop]) + sComp + ';1;_';
         End;
      End;

end;

end.

