unit uModulo;

interface
Uses DB, uDataBase,uCmControlObject,Classes,Dialogs,
     dbclient, sysutils,uSistema, uMidasUtil, uCMTypes;

Type
  TCtrlModulo = class(TCmControlObject)
  Private

  Public
     iCodCusteio       : Integer;
     iCodAlmoxa        : Integer;
     sAlmoxaUsuario    : String;
     sCCustoAlmoxa     : String;
     sCodCCusto        : String;
     sDescCCusto       : String;
     bVeioAnalise      : Boolean; //(*)
     IdAnalise         : Integer; //(*)
     sIntegraContab    : String;
     sMascaraGrupoProd : String;
     sTrasObs          : String; //(*)
     sCodTipoDoc       : String;
     iPlano            : Integer;
     sMascaraPlano     : String;
     //
     procedure AtualizarParametros( IdEmpresa, IdUsuario : Integer);
     Function  VerifCC( pCodArt, pCentCust : String ) : Boolean;
     Function  LeGrupoProd( CodProduto : String) : String;
     Function  ProdVari( Var sDesc : String ) : LongInt; //(*)
     Function  LeCodTipRecDes( sGrupoProd : String ) : String;
     Function  LeDataRepresa  : TDateTime;    //(*)
     Function  LeUnCusteio( iCodAlmox : LongInt ) : LongInt;
     Function  ListAlmox( CodCusteio : Integer ) : String; //(*)
     Function  LeDataImplantacao : TDateTime;     
  End;

Var Modulo : TCtrlModulo;

implementation

{ TCtrlModulo }

Uses DBaseDados, uMensErro, uCMDialogs ;

procedure TCtrlModulo.AtualizarParametros(IdEmpresa, IdUsuario: Integer);
begin

end;

function TCtrlModulo.LeCodTipRecDes(sGrupoProd: String): String;
Var
   SQL : String;
begin
    sGrupoProd := Copy(sGrupoProd +'                          ',1,10);

    SQL := 'SELECT CODTIPRECDES FROM GRUPPROD WHERE '+
           ' (CODGRUPOPROD = '+QuotedStr(sGrupoProd)+')';

    _Cds.Data := GetDataPacket(SQL);

    Result := _Cds.FieldByName('CODTIPRECDES').asString;

end;

function TCtrlModulo.LeDataImplantacao: TDateTime;
Var
   SQL : String;
begin
     SQL := ' SELECT DATAIMPLANTA FROM PARALMOX '+
            ' WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';

     _Cds.Data := GetDataPacket(SQL);

     Result := _Cds.FieldByName('DATAIMPLANTA').asDateTime;
end;

function TCtrlModulo.LeDataRepresa: TDateTime;
begin
  Result := Date;
end;

function TCtrlModulo.LeGrupoProd( CodProduto : String ): String;
Var
   SQL : String;
Begin
   CodProduto :=  Copy(CodProduto + '             ',1,6);

   SQL := 'SELECT CODGRUPOPROD FROM PRODUTO WHERE '+
          '(CODPRODUTO = '+QuotedStr(CodProduto)+')';

   _Cds.Data := GetDataPacket(SQL);

   Result := _Cds.FieldByName('CODGRUPOPROD').asString;
end;

function TCtrlModulo.LeUnCusteio(iCodAlmox: Integer): LongInt;
begin
  _Cds.Data :=  GetDataPacket(' SELECT CODCUSTEIO  FROM  ALMOX A '+
                              ' WHERE  (A.CODALMOXARIFADO = '+IntToStr(iCodAlmox)+') ');
   Result :=  _Cds.FieldByName('CODCUSTEIO').AsInteger;
end;

function TCtrlModulo.ListAlmox(CodCusteio: Integer): String;
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

   _Cds.Data := GetDataPacket(SQL);
   If _Cds.IsEmpty Then
      Begin
          Result := '';
          _Cds.First;
          While Not _Cds.Eof Do
             Begin
                Result := Result + _Cds.FieldByName('CODALMOXARIFADO').AsString +',';
                _Cds.Next;
             End;
         Result := Copy(Result,1,length(Result)-1);
      End;
end;

function TCtrlModulo.ProdVari(var sDesc: String): LongInt;
Var
   ID    : Longint;
   bOk   : Boolean;
Begin
   Result := -1;
   sDesc := '';
   bOk   :=  True;
   While (Trim(sDesc) = '') And ( bOK ) Do
     Begin
        bOk := InputMemo('Produto de Descrição variável','Descrição',sDesc);
        If  Not bOk Then
           Result := -1
        Else
           Begin
               If( Trim(sDesc) <> '' ) Then
                 Begin
                     If FazQuery(dtmBasedados.qry, ' SELECT IDPRODVARI,DESCPRODVARI'+
                                                   ' FROM PRODVARI '+
                                                   ' WHERE (UPPER(DESCPRODVARI) = '''+Trim(UpperCase(sDesc))+''')')
                     Then
                       Begin
                          Result := dtmBasedados.qry.FieldByName('IDPRODVARI').asInteger;
                          sDesc  := dtmBasedados.qry.FieldByName('DESCPRODVARI').asString;
                       End
                     Else
                       Begin
                          ID := LeUltRegistro(nil,'PRODVARI');
                          if Not ExecutarQuery(dtmBasedados.qry, 'INSERT INTO PRODVARI VALUES('+intToStr(ID)+','''+sDesc+''')') Then
                             Result := -1
                          Else
                             Result := ID;
                       End;
                  End
               Else
                  ShowMessage('Descrição não preenchida');
           End;
     End;
end;

function TCtrlModulo.VerifCC(pCodArt, pCentCust: String): Boolean;
Var
  bOk : Boolean;
  sCodGrupoProd,sDescConta,sObrigaCC,sSubConta:String;
  sPlano, sPlaConta : String;
Begin
{   VerifCC := False;
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
                                    ' And (CodCentroCusto = '''+Espaco(pCentCust,10)+''')');
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
                                       '     (CodArtigo =  '''+Espaco(pCodArt,14) +''')' );
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
                                          ' And (CodCentroCusto = '''+Espaco(pCentCust,10)+''')');
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
                                             '     (CodGrupoProd =  '''+Espaco(sCodGrupoProd,10) +''') ');
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
                                              '  AND (IDEMPRESA = '+intToStr(Sistema.IdEmpresa)+')')
      Else
         VerifCC :=True;
   End; }
End;

end.
