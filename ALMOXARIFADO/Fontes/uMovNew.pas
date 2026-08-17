unit uMovNew;
{
   Unit com a função de :
  .Gerar movimentos no Almoxarifado Tanto de  Entrada/Saída.
  .Verificação da Data de Represamentos.
  .Atualização de Saldo (lançamento retroativo)
  .Atualização de Custo e Valores (lançamento retroativo)

  Rio 27/04/1999 - Igor M. L. Maia./Rosane Barboza.
}
interface

Uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
      ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
      Wwdatsrc, DBCtrls;
 Type TCustoMed = Record
                      iCodCusteio  : LongInt;
                      sCodArt      : String;
                      rSaldoQtdeUC : Double;
                      rCustoMedio  : Double;
                  End;
 Type TMoviment = Record
                      IDMOV            : Double;
                      CODTIPOMOV       : String;
                      CODARTIGO        : String;
                      CODALMOXARIFADO  : LongInt;
                      DATAMOV          : TDateTime;
                      QTDEMOV          : Double;
                      VALORMOV         : Double;
                      CUSTOMEDIOMOV    : Double;
                      SALDOQTDEMOV     : Double;
                      CODALMOXTRANSF   : LongInt;
                      FLGENTRADACUSTO  : String;
                  End;
 Type TMovNew = Class
   Private
       Function CalcSaldo( rQtdeMov : Double; sCodArt,sDataMov : String; iCodAlmox : LongInt; Var bInsert : Boolean ) : Double;

       Function CalcCustoMedio ( sTipoMov : Char; iCodCusteio : LongInt; sCodArt,sDataMov : String; rQtdeMov,rValorMov : Double ) : Double;

       Function VerifDtIntegraContab( Dt : TDateTime; Var D : String ) : Boolean;

       Function VerifDtInvent( iCodCusteio : LongInt; Dt : TDateTime; Var D : String ) : Boolean;

       Function VerifDtRepresa ( Dt : TDateTime ) : Boolean;

       Function ConvNum( n : Double ) : Double;

   Public
       Function EntraLoteVali( iCodAlmox : longint;sCodArt,sDataVali : String; rQtdeMov : Double ) : boolean;

       Function SaiLoteVali( iCodAlmox : LongInt; sCodArt, sDataVali : String; rQtdeMov : Double; iCodAlmoxTransf : LongInt ) : Boolean;

       Function InfoSaldoValidade(iCodAlmox : LongInt; sCodArt, sDataVali : String) : Double;


       Function  GeraMov( sTipoMov         : Char;       // Indica se o Movimento é Entrada /Saída
                          rValorMov        : Double;     // Valor Movido
                          rQtdeMov         : Double;     // Quantidade Movida
                          iCodCusteio      : LongInt;    // Unidade de Custeio do Almoxarifado de Origem
                          iCodAlmox        : longint;    // Almoxarifado de Origem
                          sCodArtigo       : String;     // Artigo Movimentado
                          sLote            : String;     // Lote do Artigo
                          sCodTipoMov      : String;     // Tipo da Movimentacao
                          sCodMedida       : String;     // Unidade de Media Utilizada
                          sDataValidade    : String;     // Data de Validade do Artigo (só Entrada)
                          sDataMov         : String;     // Data da Movimentação
                          sNumDoc          : String;     // Número do documento
                          sCentroCusto     : String;     // Centro de Custo
                          idEmpresa        : LongInt;    // IdPessoa do Centro de Custo
                          iCodAlmoxTransf  : longint;    // Almoxarifado de Destino ( caso seja Transferência )
                          iUnidNegoc       : longint) : LongInt; // Indica a Atividade e Projeto.

      Procedure  GeraRetroativo ( dData        : TDateTime;
                                  SCodArt      : String );

      Function   AtualizaSaldo  ( dData      : TDateTime;
                                  sCodArt    : String;
                                  iCodAlmox  : LongInt ) : Double;

      Function  LeUltDataMovRep( sCodArt : String ) : TDateTime;

      Procedure UpdMov( n ,val,pln : LongInt );

      Function InfoSaldo ( sArt : String; icodAlmoxa : LongInt; Dt : TDateTime ) : Double;

      Function TestaValidade( sCodProd : String ) : Boolean;

      Procedure AtualizaSaldoRet ( dData      : TDateTime;
                                   sCodArt    : String;
                                   iCodAlmox  : LongInt );

      Procedure AtualizaPrecoSug(sCodArt :String ; IdModChefBuffet : LongInt);

   End;

Var
   MovNew : TMovNew;

implementation

Uses uDataBase,UMensErro,uModulo, DBaseDados, DMoviment,
     uSistema,uString;

Function TMovNew.TestaValidade( sCodProd : String ) : Boolean;
Begin
  sCodProd := Espaco(Trim( sCodProd ),6);
  //
  Result := False;
  With DtmMoviment.qryTestaValdiade Do
     Begin
        Close;
        ParamByName('pCODPROD').asString := sCodProd;
        Open;
        If Not IsEmpty Then
            Result := FieldByName('LOTEVALIDADE').AsString = 'T';
        Close;
     End;
End;

Function TMovNew.VerifDtIntegraContab( Dt : TDateTime; Var D : String ) : Boolean;
Begin
   With DtmMoviment.qryVerifIntContab Do
      Begin
          Close;
          ParamByName('pIDPESSOA').asInteger := Sistema.IdEmpresa;
          Open;
          If (Not IsEmpty) And ( Not FieldByName('DATAULTINTEGRA').IsNull ) Then
             Begin
                 Result :=  Dt > FieldByName('DATAULTINTEGRA').asDateTime;
                 D      := FieldByName('DATAULTINTEGRA').asString;
             End
          Else
             Result := True;
          Close;
      End;
End;

Function TMovNew.VerifDtInvent( iCodCusteio : LongInt; Dt : TDateTime; Var D : String ) : Boolean;
Begin
   With DtmMoviment.qryVerifDtInvent Do
      Begin
          Close;
          ParamByName('pIDPESSOA').AsInteger   := Sistema.IdEmpresa;
          ParamByName('pCODCUSTEIO').AsInteger := iCodCusteio;
          Open;
          If (Not IsEmpty) And ( Not FieldByName('DATAULTINVENTARIO').IsNull ) Then
             Begin
                 Result :=  Dt >= FieldByName('DATAULTINVENTARIO').asDateTime;
                 D      := FieldByName('DATAULTINVENTARIO').asString;
             End
          Else
             Result := True;
          Close;
      End;
End;

Function TMovNew.VerifDtRepresa ( Dt : TDateTime ) : Boolean;
Begin
   With DtmMoviment.qryVerifDtRepresa Do
      Begin
          Close;
          ParamByName('pIDPESSOA').AsInteger   := Sistema.IdEmpresa;
          Open;
          If (Not IsEmpty) And ( Not FieldByName('DATAREPRESA').IsNull ) Then
             Result :=  Dt > FieldByName('DATAREPRESA').asDateTime
          Else
             Result := False;
          Close;
      End;
End;

Function  TMovNew.CalcSaldo( rQtdeMov : Double; sCodArt,sDataMov : String; iCodAlmox : LongInt; Var bInsert : Boolean ) : Double;
Var
 rSaldoQtdeNew : Double;   // Saldo de Quantidade em estoque do Almoxarifado depois da movimentação
Begin
{ Esta Função irá gerar o novo Saldo de Quantida do Artigo no Almoxarifado
  Caso o Arigo não tenha saldo ( não exista na tabela) ele insere o Artigo
}
   bInsert := False;
   sCodArt := Espaco( Trim(sCodArt), 14);
   Try
      If VerifDtRepresa( StrToDate(sDataMov) ) Then
           rQtdeMov := 0;
      With DtmMoviment.qryCalcSaldo Do
         Begin
            Close;
            ParamByName('pCODARTIGO').asString  := sCodArt;
            ParamByName('pCODALMOX').AsInteger  := iCodAlmox;
            Open;
            If Not isEmpty Then
               Begin
                  rSaldoQtdeNew    := FieldByName('SaldoQtde').AsFloat + rQtdeMov;
                  DtmMoviment.qryUpdSaldo.Close;
                  DtmMoviment.qryUpdSaldo.ParamByName('pSALDOQTDE').AsFloat  := rSaldoQtdeNew;
                  DtmMoviment.qryUpdSaldo.ParamByName('pCODARTIGO').asString := sCodArt;
                  DtmMoviment.qryUpdSaldo.ParamByName('pCODALMOX').AsInteger := iCodAlmox;
                  DtmMoviment.qryUpdSaldo.ExecSQL;
               End
            Else
               Begin
                  bInsert          := True;
                  rSaldoQtdeNew    := rQtdeMov;
                  DtmMoviment.qryInsertSaldo.Close;
                  DtmMoviment.qryInsertSaldo.ParamByName('pSALDOQTDE').AsFloat         := rSaldoQtdeNew;
                  DtmMoviment.qryInsertSaldo.ParamByName('pCODARTIGO').asString        := sCodArt;
                  DtmMoviment.qryInsertSaldo.ParamByName('pCODALMOXARIFADO').AsInteger := iCodAlmox;
                  DtmMoviment.qryInsertSaldo.ParamByName('pDATAULTLANC').AsDateTime    := StrToDate( sDataMov );
                  DtmMoviment.qryInsertSaldo.ParamByName('pIDPESSOA').AsInteger        := Sistema.IdEmpresa;
                  DtmMoviment.qryInsertSaldo.ExecSQL;
               End;
            Result := rSaldoQtdeNew;
            Close;
         End;
    Except
       Raise;
    End;
End;

Function TMovNew.CalcCustoMedio ( sTipoMov : Char; iCodCusteio : LongInt; sCodArt,sDataMov : String; rQtdeMov,rValorMov : Double ) : Double;
Var
   rNovoCustoMedio : Double;   // É o novo custo medio da Unidade de Custeio
   rNovoSaldoQtde  : Double;   // É o novo Saldo de Quantidade da Unidade de Custeio
Begin
  {
    Esta função irá Calcular o novo custo medio e Atualizar a tabela de custo médio
    caso o artigo não exista, ele incluído.
  }
   sCodArt := Espaco( Trim(sCodArt), 14);
   Try
      If VerifDtRepresa( StrToDate(sDataMov) ) Then
          Begin
             rQtdeMov  := 0;
             rValorMov := 0;
          End;
      With DtmMoviment.qryCalcCustoMed Do
         Begin
            Close;
            ParamByName('pCODARTIGO').asString   := sCodArt ;
            ParamByName('pCODCUSTEIO').AsInteger := iCodCusteio;
            Open;
            If Not isEmpty Then
               Begin
                  rNovoCustoMedio := FieldByName('CustoMedio').AsFloat;
                  rNovoSaldoQtde  := FieldByName('SaldoQtdeUC').AsFloat + rQtdeMov;
                  if (StrToFloat(FormatFloat('#0.00000',rNovoSaldoQtde)) <> 0) Then
                     Case sTipoMov Of
                          'E' : rNovoCustoMedio := ( ( FieldByName('CustoMedio').AsFloat * FieldByName('SaldoQtdeUC').AsFloat ) + rValorMov ) / rNovoSaldoQtde;
                          'S' : rNovoCustoMedio :=  FieldByName('CustoMedio').AsFloat;
                     End;
                  DtmMoviment.qryUpdCustoMed.Close;
                  DtmMoviment.qryUpdCustoMed.ParamByName('pCUSTOMEDIO').AsFloat   := StrToFloat( FormatFloat('#0.00000',rNovoCustoMedio ) );
                  DtmMoviment.qryUpdCustoMed.ParamByName('pSALDOQTDEUC').AsFloat  := StrToFloat( FormatFloat('#0.00000',rNovoSaldoQtde ) );
                  DtmMoviment.qryUpdCustoMed.ParamByName('pCODARTIGO').asString   := sCodArt;
                  DtmMoviment.qryUpdCustoMed.ParamByName('pCODCUSTEIO').AsInteger := iCodCusteio;
                  DtmMoviment.qryUpdCustoMed.ExecSQL;
                  DtmMoviment.qryUpdCustoMed.Close;
               End
            Else
               Begin
                   If rQtdeMov = 0 Then { Teste para Ver se há alteração de Custo Médio}
                       rNovoCustoMedio := rValorMov
                   Else
                       rNovoCustoMedio := rValorMov /rQtdeMov;
                   rNovoSaldoQtde := rQtdeMov;
                   DtmMoviment.qryInsertCustoMed.Close;
                   DtmMoviment.qryInsertCustoMed.ParamByName('pCUSTOMEDIO').AsFloat   := StrToFloat( FormatFloat('#0.00000',rNovoCustoMedio ) );
                   DtmMoviment.qryInsertCustoMed.ParamByName('pSALDOQTDEUC').AsFloat  := StrToFloat( FormatFloat('#0.00000',rNovoSaldoQtde ) );
                   DtmMoviment.qryInsertCustoMed.ParamByName('pCODARTIGO').asString   := sCodArt;
                   DtmMoviment.qryInsertCustoMed.ParamByName('pCODCUSTEIO').AsInteger := iCodCusteio;
                   DtmMoviment.qryInsertCustoMed.ExecSQL;
                   DtmMoviment.qryInsertCustoMed.Close;
               End;
            Result := rNovoCustoMedio;
            Close;
         End;
   Except
       Raise;
   End;
End;

Function TMovNew.EntraLoteVali( iCodAlmox : longint; sCodArt,sDataVali : String; rQtdeMov : Double ) : Boolean;
Begin
     sCodArt := Espaco( Trim(sCodArt), 14);
     sDataVali := FormatDateTime('DD/MM/YYYY',StrtoDateTime(sDataVali));
     //
     Result := False;
     Try
        With DtmMoviment.qryEntraLoteVali Do
           Begin
              Close;
              ParamByName('pCODALMOXARIFADO').asInteger   := iCodAlmox;
              ParamByName('pCODARTIGO').asString          := sCodArt;
              ParamByName('pDATAVALIDADE').asDateTime     := StrToDate( sDataVali );
              Open;
               If Not IsEmpty Then
                 Begin
                     Result := True;
                     Edit;
                     FieldByName('SALDOLOTE').asFloat := FieldByName('SALDOLOTE').asFloat + rQtdeMov;
                     Post;
                     DtmMoviment.qryEntraLoteVali.ApplyUpdates;
                 End
              Else
                 Begin
                     Append;
                     FieldByName('SALDOLOTE').asFloat         := rQtdeMov;
                     FieldByName('CODALMOXARIFADO').asInteger := iCodAlmox;
                     FieldByName('CODARTIGO').asString        := sCodArt;
                     FieldByName('DATAVALIDADE').asDateTime   := StrToDate( sDataVali );
                     Post;
                     DtmMoviment.qryEntraLoteVali.ApplyUpdates;
                 End;
              Close;
           End;
     Except
        Raise;
        Exit;
     End;
End;

Function TMovNew.SaiLoteVali( iCodAlmox : LongInt; sCodArt, sDataVali: String; rQtdeMov : Double; iCodAlmoxTransf : LongInt ) : Boolean;
Var
   rQtdeBaixada  : Double; // Saldo baixado até a determinada data
   rQtdePositivo : Double;
Begin
    sCodArt := Espaco( Trim(sCodArt), 14);
    //
    Result        := False;
    rQtdeBaixada  := 0;
    rQtdePositivo := Abs(rQtdeMov);
    Try
    With DtmMoviment.qrySaiLoteVali Do
       Begin
           Close;
           SQL.Delete(10);
           if trim(sDataVali) = '' then
              SQL.Insert(10, ' AND (1 = 1)')
           else
              Begin
                 sDataVali := FormatDateTime('DD/MM/YYYY',StrtoDateTime(sDataVali));
                 SQL.Insert(10, ' AND (L.DATAVALIDADE = TO_DATE('''+sDataVali+''',''DD/MM/YYYY''))');
              end;
           ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmox;
           ParamByName('pCODARTIGO').asString        := sCodArt;
           Open;
           if Not IsEmpty Then
              Begin
                   First;
                   While (Not EOF) And (rQtdeBaixada < rQtdePositivo) Do
                      Begin
                          If ((rQtdeMov *(-1))-rQtdeBaixada ) >= FieldByName('SALDOLOTE').asFloat Then
                             Begin
                                 If iCodAlmoxTransf > 0 Then
                                   Begin
                                      EntraLoteVali(iCodAlmoxTransf,sCodArt,FieldByName('DATAVALIDADE').AsString,FieldByName('SALDOLOTE').asFloat);
                                   End;
                                 rQtdeBaixada := rQtdeBaixada + FieldByName('SALDOLOTE').asFloat;
                                 Delete;
                             End
                          Else
                             Begin
                                 if iCodAlmoxTransf > 0 then begin
                                    EntraLoteVali(iCodAlmoxTransf,sCodArt,FieldByName('DATAVALIDADE').AsString,((rQtdeMov *(-1))-rQtdeBaixada ));
                                 end;
                                 Edit;
                                 FieldByName('SALDOLOTE').asFloat := StrToFloat(FormatFloat('#0.00000',(FieldByName('SALDOLOTE').asFloat - ((rQtdeMov *(-1))-rQtdeBaixada ))));
                                 Post;
                                 rQtdeBaixada := rQtdeBaixada + (rQtdePositivo - rQtdeBaixada );
                                 Next;
                             End;
                      End;
              End
           Else
              Begin
                 If rQtdeMov > 0 Then
                    Begin
                       EntraLoteVali(iCodAlmox,sCodArt,DateToStr(Date),rQtdeMov);
                    End;
              End;
           DtmMoviment.qrySaiLoteVali.ApplyUpdates;
           Close;
       End;
    Except
        Raise;
        Exit;
    End;
End;

Function TMovNew.GeraMov ( sTipoMov         : Char;       // Indica se o Movimento é Entrada /Saída
                           rValorMov        : Double;     // Valor Movido
                           rQtdeMov         : Double;     // Quantidade Movida
                           iCodCusteio      : LongInt;    // Unidade de Custeio do Almoxarifado de Origem
                           iCodAlmox        : longint;    // Almoxarifado de Origem
                           sCodArtigo       : String;     // Artigo Movimentado
                           sLote            : String;     // Lote do Artigo
                           sCodTipoMov      : String;     // Tipo da Movimentacao
                           sCodMedida       : String;     // Unidade de Media Utilizada
                           sDataValidade    : String;     // Data de Validade do Artigo (só Entrada)
                           sDataMov         : String;     // Data da Movimentação
                           sNumDoc          : String;     // Número do documento
                           sCentroCusto     : String;     // Centro de Custo
                           idEmpresa        : LongInt;    // IdPessoa do Centro de Custo
                           iCodAlmoxTransf  : longint;    // Almoxarifado de Destino ( caso seja Transferência )
                           iUnidNegoc       : longint) : LongInt; // Indica a Atividade e Projeto.
Var
    rQtdeSalUn      : Double;
    rFatorCusto     : Double;   // fator de conversão da Un. de Medida para Calculo do Custo Médio
    rFatorCM        : Double;   // fator de conversão da Un. de Medida da Ficha Técnica
    sCodMedCusto    : String;   // Unidadede de meida do Custo Médio
    sLoteValidade   : String;   // Indica se o produto tem controle de validade
    rNovoCustoMedio : Double;   // Novo custo médio após uma movimentação de Entrada
    rSaldoQtdeMov   : Double;   // Novo Saldo de Quantidade do Artigo no Almoxarifado origem
    rNumReg         : LongInt;  // Sequênce da Tabela Moviment
    sDt             : String;   // Varial auxiliar usada para mostra datas
    bInsert         : Boolean;  // Indica se Está Inserindo Saldo e Custo Médio
    rZero           : Double;
    sEntradaCusto   : String;
Begin
    Result        := -1;
    sCodTipoMov   := Trim(sCodTipoMov);
    sCodArtigo    := Espaco( Trim(sCodArtigo), 14);
    sEntradaCusto := 'N';
    if sTipoMov = 'C' then
       Begin
          sEntradaCusto := 'S';
          sTipoMov      := 'E';
       end;
    //
    if sTipoMov = 'S' Then
       Begin
           rQtdeMov  := rQtdeMov * (-1);
           rValorMov := rValorMov * (-1);
       End;
    Try
       If (sCodTipoMov <> 'Z') Then
          Begin
              DtmMoviment.qryDataTrava.Close;
              DtmMoviment.qryDataTrava.ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmox;
              DtmMoviment.qryDataTrava.ParamByName('pCODARTIGO').asString        := sCodArtigo;
              DtmMoviment.qryDataTrava.Open;
           {   If ( Not DtmMoviment.qryDataTrava.IsEmpty ) And ( sDataMov > DtmMoviment.qryDataTrava.FieldByName('DATATRAVA').AsString ) Then
                 Begin
                    MsgDlg('Proibido movimentação deste item nesta data neste Almoxarifado. Existe uma contagem aberta no dia '+DtmMoviment.qryDataTrava.FieldByName('DATATRAVA').AsString,'Erro', mtError, [mbOk], 0);
                    Exit;
                 End; }
              If ( Not DtmMoviment.qryDataTrava.IsEmpty ) And ( sCodTipoMov <> 'D' ) and ( sCodTipoMov <> 'H' )  and ( sCodTipoMov <> 'X' ) Then
                 Begin
                    If VerifDtRepresa(StrToDate(FormatDateTime('dd/mm/yyy',StrToDateTime(sDataMov)))) Then
                       MsgDlg('Este lançamento está depois da data de represamento. NÃO influenciará na contagem física.','Informação', mtInformation, [mbOk], 0)
                    Else
                       MsgDlg('Existe uma contagem aberta no dia '+DtmMoviment.qryDataTrava.FieldByName('DATATRAVA').AsString+' para este item. Este lançamento influenciará na analise das diferenças de contagem.','Aviso', mtWarning, [mbOk], 0);

                    If (MsgDlg('Confirma o Lançamento','Confirmação',mtConfirmation,[mbOk,mbCancel],0)) = mrCancel then
                      Exit;
                 End;
              If Not VerifDtIntegraContab( StrToDate(sDataMov), sDt ) Then
                Begin
                    MsgDlg('Proibido movimentação. Pois a integração da contabalidade já foi efetuada na data '+sDt,'Erro', mtError, [mbOk], 0);
                    Exit;
                End;
              If Not VerifDtInvent( iCodCusteio, StrToDate(sDataMov), sDt ) Then
                Begin
                    MsgDlg('Proibido movimentação. Pois o último inventário nesta unidade de Custeio foi feito em '+sDt,'Erro', mtError, [mbOk], 0);
                    Exit;
                End;
          End;
          DtmMoviment.qryDataTrava.Close;
  //==========================================================================================================================================================================================================================
  // Ler fatores de conversao de unidades
  //==========================================================================================================================================================================================================================
             DtmMoviment.qryFatorCusto.Close;
             DtmMoviment.qryFatorCusto.ParamByName('pCODARTIGO').AsString := sCodArtigo;
             DtmMoviment.qryFatorCusto.Open;
             If Not DtmMoviment.qryFatorCusto.isEmpty then
                 rFatorCusto := DtmMoviment.qryFatorCusto.FieldByName('FATOR').asFloat
             Else
                 rFatorCusto := 0;
             sLoteValidade := DtmMoviment.qryFatorCusto.FieldByName('LOTEVALIDADE').AsString;
             sCodMedCusto  := DtmMoviment.qryFatorCusto.FieldByName('CODMEDCUSTO').AsString;
             DtmMoviment.qryFatorCusto.Close;
             //
             DtmMoviment.qryFatorCM.Close;
             DtmMoviment.qryFatorCM.ParamByName('pCODARTIGO').AsString  := sCodArtigo;
             DtmMoviment.qryFatorCM.ParamByName('pCODMEDIDA').AsString  := Espaco( Trim(sCodMedida),4) ;
             DtmMoviment.qryFatorCM.Open;
             //
             If Not DtmMoviment.qryFatorCM.isEmpty Then
                rFatorCM := DtmMoviment.qryFatorCM.FieldByName('FATOR').AsFloat
             Else
                rFatorCM := 0;
             DtmMoviment.qryFatorCM.Close;
  //==========================================================================================================================================================================================================================
  // Converter SaldoQtde e ValorMov para Unidade do Custo Medio
  //==========================================================================================================================================================================================================================
             If (rFatorCusto <> 0) And (rFatorCM <> 0) Then
                Begin
                   rQtdeMov  := rQtdeMov * rFatorCM / rFatorCusto;
                End;
  //==========================================================================================================================================================================================================================
  // Verifica o Saldo do Artigo na Tabela. Se não tiver inclui na tabela
  //==========================================================================================================================================================================================================================
           rSaldoQtdeMov   := CalcSaldo( rQtdeMov,sCodArtigo,sDataMov,iCodAlmox, bInsert );
  //==========================================================================================================================================================================================================================
  // Calcula o novo Custo Médio e Saldo Em Quantidade da Unidade de Custeio
  //==========================================================================================================================================================================================================================
           rNovoCustoMedio := CalcCustoMedio( sTipoMov,iCodCusteio,sCodArtigo,sDataMov,rQtdeMov,rValorMov );
           if sTipoMov = 'S' Then
              Begin
                 rValorMov := (rQtdeMov*rNovoCustoMedio);
              End;
  //==========================================================================================================================================================================================================================
  // Gera um movimento de Implantação de Saldo 'Z'. Caso haja movimentação sem implantação de Saldo prévia
  //==========================================================================================================================================================================================================================
           If ( bInsert ) and ( sCodtipoMov <> 'Z') Then
              Begin
                  If GeraMov('E',
                              0,
                              0,
                              iCodCusteio,
                              iCodAlmox,
                              sCodArtigo,
                              sLote,
                              'Z',
                              sCodMedida,
                              DateToStr(Modulo.LeDataImplantacao),
                              DateToStr(Modulo.LeDataImplantacao),
                              '',
                              sCentroCusto,
                              idEmpresa,
                              -1,iUnidNegoc ) <= 0
                  Then
                     Exit;
              End;
  //==========================================================================================================================================================================================================================
  // Insersão na Tabela Moviment
  //==========================================================================================================================================================================================================================
           // Geração do IDMOV
           rNumReg := LeUltRegistro(nil,'MOVIMENT');
           If rNumReg <= -1 Then
              Exit;
           With DtmMoviment.qryInsertMov Do
              Begin
                 ParamByName('pIDMOV').asFloat             := rNumReg;
                 ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmox;
                 ParamByName('pIDPESSOA').asInteger        := Sistema.IdEmpresa;
                 ParamByName('pCODARTIGO').asString        := sCodArtigo;
                 ParamByName('pCODTIPOMOV').asString       := sCodTipoMov;
                 ParamByName('pCUSTOMEDIOMOV').asFloat     := StrToFloat( FormatFloat('#0.00000',rNovoCustoMedio ) );
                 ParamByName('pVALORMOV').asFloat          := StrToFloat( FormatFloat('#0.00000',rValorMov ) );
                 ParamByName('pQTDEMOV').asFloat           := StrToFloat( FormatFloat('#0.00000',rQtdeMov ) );
                 ParamByName('pSALDOQTDEMOV').asFloat      := StrToFloat( FormatFloat('#0.00000',rSaldoQtdeMov ) );
                 ParamByName('pDATALANCMOV').asDateTime    := Date;
                 ParamByName('pDATAMOV').asDateTime        := StrToDate( sDataMov );
                 ParamByName('pNUMDOCUMENTO').asString     := sNumDoc;
                 ParamByName('pFLGENTRADACUSTO').asString  := sEntradaCusto;
                 ParamByName('pUNIDNEGOC').asInteger       := iUnidNegoc;
                 If iUnidNegoc <> 0 Then
                    ParamByName('pUNIDNEGOC').asInteger := iUnidNegoc
                 Else
                    ParamByName('pUNIDNEGOC').Clear;
                    
                 If Trim( sCentroCusto ) <> '' Then
                    Begin
                       ParamByName('pCODCENTROCUSTO').asString  := sCentroCusto;
                       ParamByName('pIDEMPRESA').asInteger      := idEmpresa;
                    End
                 Else
                    Begin
                       ParamByName('pCODCENTROCUSTO').Clear;
                       ParamByName('pIDEMPRESA').Clear;
                    End;
                 If iCodAlmoxTransf > 0 Then
                    ParamByName('pCODALMOXTRANSF').asInteger  := iCodAlmoxTransf
                 Else
                    ParamByName('pCODALMOXTRANSF').Clear;

                 DtmMoviment.qryInsertMov.ExecSQL;
              End;
  //==========================================================================================================================================================================================================================
  // Controle de Lote de validade
  //==========================================================================================================================================================================================================================
     if (sLoteValidade = 'T') And ( sTipoMov = 'E') And ( Trim(sDataValidade) = '' ) And
        ((sCodTipoMov = 'A') or (sCodTipoMov = 'K') or (sCodTipoMov = 'Z')) then
       Exit;
     if (sLoteValidade = 'T') And ( sTipoMov = 'E') And
        ((sCodTipoMov = 'A') or (sCodTipoMov = 'K') or (sCodTipoMov = 'Z')) then
         EntraLoteVali(iCodAlmox,sCodArtigo,sDataValidade,rQtdeMov )
     Else
     if (sLoteValidade = 'T') And ( sTipoMov = 'S') Then
        SaiLoteVali(iCodAlmox,sCodArtigo,'',rQtdeMov,iCodAlmoxTransf );

  //==========================================================================================================================================================================================================================
  // Atualziação em Massa na Tabela de Saldo
  //==========================================================================================================================================================================================================================
             rSaldoQtdeMov :=  AtualizaSaldo(StrToDate(sDataMov),sCodArtigo,iCodAlmox );

  //==========================================================================================================================================================================================================================
  // Atualziação em Massa do Custo Médio e Valor, se for retroativo
  //==========================================================================================================================================================================================================================
            If (StrToDate(sDataMov) < LeUltDataMovRep( sCodArtigo )) and ( sCodtipoMov <> 'Z') Then
                GeraRetroativo(StrToDate(sDataMov),sCodArtigo );
  //==========================================================================================================================================================================================================================
  // Geração do Movimento X
  //==========================================================================================================================================================================================================================
   rZero := 0;
          If StrToFloat(Format('%15.5f',[rSaldoQtdeMov])) < StrToFloat(Format('%15.5f',[rZero])) Then
              Begin
                  If Trim(sCentroCusto) = '' Then
                    Begin
                       sCentroCusto := Modulo.sCodCCusto;
                       idEmpresa    := Sistema.IdEmpresa;
                    End;
                    rQtdeSalUn := rSaldoQtdeMov;
                    If (rFatorCusto <> 0) And (rFatorCM <> 0) Then
                    Begin
                      rQtdeSalUn  := rSaldoQtdeMov / rFatorCM * rFatorCusto;
                    End;
                  //
                  if GeraMov('E',
                             (rNovoCustoMedio * rSaldoQtdeMov )*(-1),
                             rQtdeSalUn*(-1),
                             iCodCusteio,
                             iCodAlmox,
                             sCodArtigo,
                             '',
                             'X',
                             sCodMedida,
                             sDataValidade,
                             sDataMov,
                             sNumDoc,
                             sCentroCusto,
                             idEmpresa,
                             0,iUnidNegoc ) <= 0
                  then
                     Exit;
              End;
       Result  := rNumReg;
    Except
        Raise;
    End;
End;

Procedure  TMovNew.GeraRetroativo ( dData   : TDateTime;
                                    SCodArt : String );
Var
    CustoMed       : Array[1..100] of TCustoMed; // Vetor que Emula a TaBela CUSTOMED
    Moviment       : Array[1..10000] of TMoviment; // Vetor que Emula a TaBela MOVIMENT
    x,i            : Integer; // varialvel para indice do Vetor
    iMaxCM         : Integer; // varialvel para indicar o ultimo registro do Vetor CustoMed
    iMax           : Integer; // varialvel para indicar o ultimo registro do Vetor MOVIMENT
    rSaldoQtde     : Double;  // É o antigo Saldo da unidade de Custeio Antes da Movimentação
    rCustoMed      : Double;  // É o antigo Custo Médio da unidade de Custeio Antes da Movimentação
    rValorEst      : Double;  // É o Valor em estoque por unidade de Custeio.
    rNovoCustoMed  : Double;  // É o Custo Médio da unidade de Custeio Antes da Movimentação após movimentação
    rNovoSaldoQtde : Double;  // É o Saldo da unidade de Custeio Antes da Movimentação após a movimentação
    rNovoValor     : Double;  // É o Novo Valor em estoque por Unidade de Custeio
    rValorMov      : Double;  // É o valor movimentado
    iUnCusteio     : Longint; // Código da unidade de custeio do Almoxarifado de origem da movimentação
    bAchou         : Boolean; // Variável de Flag
    cTipoMov       : Array [0..1] of Char; // Código do tipo de Movimentação.

Begin
     SCodArt    := Espaco( Trim( sCodArt ),14);
     //
     rSaldoQtde := 0;
     rCustoMed  := 0;
     rValorEst  := 0;
 Try
  {
      Busca os ultimos movimentos dos almoxarifado na sua
  unidade de custeito. Através da ultima movimentação antes da
  data determinada. Após posicionamos a table de CUSTOMED. Na
  na ultima movimentação antes da data deteriminada. Para poder
  recalcular os preços médios.
  }
     x := 0;
     With DtmMoviment Do
       Begin
           qryCustoMed.Close;
           qryCustoMed.ParamByName('pCODARTIGO').asString := sCodArt;
           qryCustoMed.ParamByName('pDATAMOV').asDateTime := dData;
           qryCustoMed.ParamByName('pIDPESSOA').asInteger := Sistema.idEmpresa;
           qryCustoMed.Open;
           qryCustoMed.First;
           While Not qryCustoMed.EOF Do
             Begin
                  qrySaldo.Close;
                  qrySaldo.ParamByName('pCODARTIGO').asString   := sCodArt;
                  qrySaldo.ParamByName('pDATAMOV').asDateTime   := dData;
                  qrySaldo.ParamByName('pCODCUSTEIO').asInteger := qryCustoMed.FieldByName('CODCUSTEIO').asInteger;
                  qrySaldo.ParamByName('pIDPESSOA').asInteger   := Sistema.idEmpresa;
                  qrySaldo.Open;
                  If Not qrySaldo.IsEmpty Then
                     Begin
                        Inc( x );
                        CustoMed[x].iCodCusteio  := qryCustoMed.FieldByName('CODCUSTEIO').asInteger;
                        CustoMed[x].sCodArt      := sCodArt;
                        CustoMed[x].rSaldoQtdeUC := ConvNum(qrySaldo.FieldByName('SALDO').asFloat);
                        CustoMed[x].rCustoMedio  := ConvNum(qryCustoMed.FieldByName('CUSTOMEDIOMOV').asFloat);
                     End;
                 qryCustoMed.Next;
             End;
           qryCustoMed.Close;
           iMaxCM := x;
           qryMoviment.Close;
           qryMoviment.ParamByName('pDATA').asDateTime        := dData;
           qryMoviment.ParamByName('pDATAREPRESA').asDateTime := Modulo.LeDataRepresa;
           qryMoviment.ParamByName('pCODARTIGO').asString     := sCodArt;
           qryMoviment.ParamByName('pIDPESSOA').asInteger     := Sistema.idEmpresa;
           qryMoviment.Open;
           //
           x := 0;
           If Not qryMoviment.IsEmpty Then
              Begin
                  qryMoviment.First;
                  While Not qryMoviment.Eof Do
                     Begin
                         Inc( x );
                         Moviment[x].IDMOV           := qryMoviment.FieldByName('IDMOV').asFloat;
                         Moviment[x].CODTIPOMOV      := qryMoviment.FieldByName('CODTIPOMOV').asString;
                         Moviment[x].CODARTIGO       := qryMoviment.FieldByName('CODARTIGO').asString;
                         Moviment[x].CODALMOXARIFADO := qryMoviment.FieldByName('CODALMOXARIFADO').asInteger;
                         Moviment[x].DATAMOV         := qryMoviment.FieldByName('DATAMOV').asFloat;
                         Moviment[x].QTDEMOV         := qryMoviment.FieldByName('QTDEMOV').asFloat;
                         Moviment[x].VALORMOV        := qryMoviment.FieldByName('VALORMOV').asFloat;
                         Moviment[x].CUSTOMEDIOMOV   := qryMoviment.FieldByName('CUSTOMEDIOMOV').asFloat;
                         Moviment[x].SALDOQTDEMOV    := qryMoviment.FieldByName('SALDOQTDEMOV').asFloat;
                         Moviment[x].FLGENTRADACUSTO := qryMoviment.FieldByName('FLGENTRADACUSTO').asString;
                         If qryMoviment.FieldByName('CODALMOXTRANSF').IsNull Then
                             Moviment[x].CODALMOXTRANSF  := -1
                         else
                             Moviment[x].CODALMOXTRANSF  := qryMoviment.FieldByName('CODALMOXTRANSF').asInteger;
                         qryMoviment.Next;
                     End;
                     qryMoviment.Close;
                     iMax := x;
                     x    := 0;
                     While x < iMax Do
                        Begin
                            Inc( x );
                            iUnCusteio := Modulo.LeUnCusteio(Moviment[x].CODALMOXARIFADO);
                            bAchou     := False;
                            i := 1;
                            While ( i <= iMaxCM ) And ( Not bAchou ) Do
                               Begin
                                  bAchou := iUnCusteio = CustoMed[i].iCodCusteio;
                                  Inc( i );
                               End;
                            If bAchou Then
                              Begin
                                 rCustoMed  := ConvNum(CustoMed[i-1].rCustoMedio);
                                 rSaldoQtde := ConvNum(CustoMed[i-1].rSaldoQtdeUC);
                                 rValorEst  := ConvNum(CustoMed[i-1].rSaldoQtdeUC) * ConvNum(CustoMed[i-1].rCustoMedio);
                              End;
                            rNovoCustoMed   := ConvNum(rCustoMed);
                            rNovoSaldoQtde  := ConvNum(rSaldoQtde) + ConvNum(Moviment[x].QTDEMOV);
                            StrPCopy(cTipoMov,Moviment[x].CODTIPOMOV);
                            // Verifica se é transferência e se é sáida
                          if ( cTipoMov[0] in ['A','K','B','S','b','Z','C'] ) or (Moviment[x].FLGENTRADACUSTO = 'S') Then
                                Begin
                                  { Movimento de Recebimento de Mercadoria}
                                   rNovoValor    := ConvNum(rValorEst) + ConvNum(Moviment[x].VALORMOV);
                                   rValorMov     := ConvNum(Moviment[x].VALORMOV);
                                   If rNovoSaldoQtde <> 0 Then
                                      rNovoCustoMed := ConvNum(rNovoValor)/ConvNum(rNovoSaldoQtde);
                                End
                            Else
                               Begin
                                  { Os Demais movimentos }
                                  rValorMov  := ConvNum(Moviment[x].QTDEMOV) * ConvNum(rNovoCustoMed);
                               End;
                               Moviment[x].VALORMOV      := ConvNum(rValorMov);
                               Moviment[x].CUSTOMEDIOMOV := ConvNum(rNovoCustoMed);
                           {*} If i > 1 then
                                  Begin
                                     CustoMed[i-1].rCustoMedio  := ConvNum(rNovoCustoMed);
                                     CustoMed[i-1].rSaldoQtdeUC := ConvNum(rNovoSaldoQtde);
                                  End;
                             //Grava o valor da entrada no outro almoxarifado.
                              If    ( Moviment[x].CODALMOXTRANSF <> -1 ) and ( (cTipoMov[0]<> 'B') And (cTipoMov[0] <> 'S' ) )
                                And ( (Moviment[x+1].CODTIPOMOV = 'B') Or (Moviment[x+1].CODTIPOMOV = 'S') ) Then
                                    Moviment[x+1].VALORMOV := ConvNum(rValorMov)*(-1);
                              rCustoMed := ConvNum(rNovoCustoMed);
                              //
                           {   qryUpdMovVal.Close;
                              qryUpdMovVal.ParamByName('pVALORMOV').asFloat      := StrToFloat( FormatFloat('#0.00000',Moviment[x].VALORMOV ) );
                              qryUpdMovVal.ParamByName('pCUSTOMEDIOMOV').asFloat := StrToFloat( FormatFloat('#0.00000',Moviment[x].CUSTOMEDIOMOV) );
                              qryUpdMovVal.ParamByName('pIDMOV').asFloat         := Moviment[x].IDMOV;
                              qryUpdMovVal.ExecSql;
                           }
                        End;
                       // Atualização do Movimentos
                         For x := 1 To iMax Do
                           Begin
                              qryUpdMovVal.Close;
                              qryUpdMovVal.ParamByName('pVALORMOV').asFloat      := ConvNum(StrToFloat( FormatFloat('#0.00000',Moviment[x].VALORMOV ) ));
                              qryUpdMovVal.ParamByName('pCUSTOMEDIOMOV').asFloat := ConvNum(StrToFloat( FormatFloat('#0.00000',Moviment[x].CUSTOMEDIOMOV)));
                              qryUpdMovVal.ParamByName('pIDMOV').asFloat         := Moviment[x].IDMOV;
                              qryUpdMovVal.ExecSql;
                           End;
                       // Atualiza CustoMedio
                        For x := 1 To iMaxCM Do
                           Begin
                              qryUpdValores.Close;
                              qryUpdValores.ParamByName('pCUSTOMEDIO').asFloat   := ConvNum(StrToFloat( FormatFloat('#0.00000',CustoMed[x].rCUSTOMEDIO)) );
                              qryUpdValores.ParamByName('pSALDOQTDEUC').asFloat  := ConvNum(StrToFloat( FormatFloat('#0.00000',CustoMed[x].rSALDOQTDEUC)) );
                              qryUpdValores.ParamByName('pCODCUSTEIO').asInteger := CustoMed[x].iCodCusteio;
                              qryUpdValores.ParamByName('pCODARTIGO').asString   := CustoMed[x].sCodArt;
                              qryUpdValores.ExecSQL;
                           End;
               End;
       End;
     Except
        Raise;
     End;
End;

Function TMovNew.AtualizaSaldo  ( dData      : TDateTime;
                                  sCodArt    : String;
                                  iCodAlmox  : LongInt ) : Double;
Var
    rSaldoQtde     : Double; // Saldo da quantidade em esto no Almoxarifado
    rSaldoRepresa  : Double; // É o saldo do Artigo até a data represa
Begin
     SCodArt := Espaco( Trim( sCodArt ),14);
     //
     Try
         With DtmMoviment Do
             Begin
                 // Pega o ultimo movimento antes da data determinada.
                 qrySaldoRep.Close;
                 qrySaldoRep.ParamByName('pDATAMOV').AsDateTime        := dData;
                 qrySaldoRep.ParamByName('pCODARTIGO').AsString        := sCodArt;
                 qrySaldoRep.ParamByName('pCODALMOXARIFADO').AsInteger := iCodAlmox;
                 qrySaldoRep.Open;
                 //
                 rSaldoQtde    := ConvNum(qrySaldoRep.FieldByName('SALDO').asFloat);
                 rSaldoRepresa := ConvNum(qrySaldoRep.FieldByName('SALDO').asFloat);
                 qrySaldoRep.Close;
                 //
                 qryAtuSaldo.Close;
                 qryAtuSaldo.ParamByName('pDATAMOV').AsDateTime        := dData;
                 qryAtuSaldo.ParamByName('pCODARTIGO').AsString        := sCodArt;
                 qryAtuSaldo.ParamByName('pCODALMOXARIFADO').AsInteger := iCodAlmox;
                 qryAtuSaldo.Open;
                 qryAtuSaldo.First;
                 While Not qryAtuSaldo.EOF Do
                   Begin
                      rSaldoQtde := ConvNum(rSaldoQtde) + ConvNum(qryAtuSaldo.FieldByName('QTDEMOV').asFloat);
                      // Grava novo Saldo
                      qryUpdSaldoMov.Close;
                      qryUpdSaldoMov.ParamByName('pSALDOQTDEMOV').asFloat := StrToFloat( FormatFloat('#0.00000',rSaldoQtde ) );
                      qryUpdSaldoMov.ParamByName('pIDMOV').asFloat        := qryAtuSaldo.FieldByName('IDMOV').asFloat;
                      qryUpdSaldoMov.ExecSql;
                      //
                      If Not VerifDtRepresa(qryAtuSaldo.FieldByName('DATAMOV').asDateTime) Then
                          rSaldoRepresa := ConvNum(rSaldoQtde);
                      qryAtuSaldo.Next;
                  End;
                 qryAtuSaldo.Close;
                 If Not VerifDtRepresa( dData ) Then
                   Begin
                      qryUpdSaldo.Close;
                      qryUpdSaldo.ParamByName('pSALDOQTDE').AsFloat  := ConvNum(StrToFloat( FormatFloat('#0.00000',rSaldoRepresa)));
                      qryUpdSaldo.ParamByName('pCODARTIGO').asString := sCodArt;
                      qryUpdSaldo.ParamByName('pCODALMOX').AsInteger := iCodAlmox;
                      qryUpdSaldo.ExecSQL;
                   End;
                 qryUpdSaldo.Close;
           End;
           Result := ConvNum(rSaldoQtde);
     Except
        Raise;
     End;
End;

Procedure TMovNew.AtualizaSaldoRet ( dData     : TDateTime;
                                    sCodArt    : String;
                                    iCodAlmox  : LongInt );
Begin
     SCodArt := Espaco( Trim( sCodArt ),14);
     //
     Try
         With DtmMoviment Do
             Begin
                 qryInfoSaldoMov.Close;
                 qryInfoSaldoMov.ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmox;
                 qryInfoSaldoMov.ParamByName('pCODARTIGO').asString        := sCodArt;
                 qryInfoSaldoMov.ParamByName('pDATAMOV').asDateTime        := dData;
                 qryInfoSaldoMov.Open;
                 IF Not qryInfoSaldoMov.IsEmpty Then
                    Begin
                       qryUpdSaldo.Close;
                       qryUpdSaldo.ParamByName('pSALDOQTDE').AsFloat  := StrToFloat( FormatFloat('#0.00000',qryInfoSaldoMov.FieldByName('SALDOQTDEMOV').asFloat) );
                       qryUpdSaldo.ParamByName('pCODARTIGO').asString := sCodArt;
                       qryUpdSaldo.ParamByName('pCODALMOX').AsInteger := iCodAlmox;
                       qryUpdSaldo.ExecSQL;
                    End;
                 //
                 qryInfoSaldoMov.Close;
                 qryUpdSaldo.Close;
             End;
     Except
        Raise;
     End;
End;

Function TMovNew.LeUltDataMovRep( sCodArt : String ) : TDateTime;
Var
   dDataRep : TDateTime; // Data de Represa
Begin
    SCodArt := Espaco( Trim( sCodArt ),14);
    //
    With DtmMoviment.qryUltDataMovRep Do
       Begin
           dDataRep := Modulo.LeDataRepresa;
           Close;
           ParamByName('pDATAMOV').asDateTime := dDataRep;
           ParamByName('pCODARTIGO').asString := sCodArt;
           Open;
           Result := FieldByName('DATAMOV').asDateTime;
           Close;
       End;
End;

Procedure TMovNew.UpdMov( n ,val,pln : LongInt );
Begin
   Try
      With DtmMoviment.QryUpdMov Do
        Begin
            Close;
            ParamByName('pIDMOVENTRADA').asFloat := val;
            ParamByName('pIDMOV').asFloat        := n;
            If Pln > 0 Then
               ParamByName('pPLNCODIGO').asFloat  := pln
            Else
               ParamByName('pPLNCODIGO').Clear;
            ExecSql;
            Close;
        End;
   Except
      Raise;
   end;
End;

Function TMovNew.InfoSaldo ( sArt : String; icodAlmoxa : LongInt; Dt : TDateTime ) : Double;
Begin
  sArt    := Espaco( Trim( sArt ),14);
  Try
    With DtmMoviment Do
       Begin
           If Dt <= Modulo.LeDataRepresa Then
              Begin
                 qryInfoSaldoRep.Close;
                 qryInfoSaldoRep.ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmoxa;
                 qryInfoSaldoRep.ParamByName('pCODARTIGO').asString        := sArt;
                 qryInfoSaldoRep.Open;
                 IF Not qryInfoSaldoRep.IsEmpty Then
                    InfoSaldo := qryInfoSaldoRep.FieldByName('SALDOQTDE').asFloat
                 Else
                    InfoSaldo := 0;
                 qryInfoSaldoRep.Close;
              End
           Else
              Begin
                 qryInfoSaldoMov.Close;
                 qryInfoSaldoMov.ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmoxa;
                 qryInfoSaldoMov.ParamByName('pCODARTIGO').asString        := sArt;
                 qryInfoSaldoMov.ParamByName('pDATAMOV').asDateTime        := Dt;
                 qryInfoSaldoMov.Open;
                 IF Not qryInfoSaldoMov.IsEmpty Then
                    InfoSaldo := qryInfoSaldoMov.FieldByName('SALDOQTDEMOV').asFloat
                 Else
                    InfoSaldo := 0;
                 qryInfoSaldoMov.Close;
              End;
       End;
  Except
      Raise;
  End;
End;

Function TMovNew.ConvNum( n : Double ) : Double;
Begin
    Result := StrToFloat(Format('%20.5f',[n]));
End;

Procedure TMovNew.AtualizaPrecoSug(sCodArt : String; IdModChefBuffet : LongInt);
var rCusto, rCustoInd  : Double;
    bDeleta : Boolean;
Begin
   bDeleta := true;
   Try
      with DtmMoviment do begin
	 qryAtuPrecoSug.SQL.Delete(11);
	 If IdModChefBuffet > 0 then begin
	    qryModChef.Close;
	    qryModChef.ParamByName('IDMODCHEFBUFFET').AsInteger := IdModChefBuffet;
	    qryModChef.Open;
	    sCodArt := qryModChefCODARTIGOBUFFET.AsString;
	 end;
	 qryAtuPrecoSug.Close;
	 sCodArt := Trim(sCodArt);
	 if sCodArt <> '' then begin
	    qryAtuPrecoSug.SQL.Insert(11,'(I.CODARTIGO = ''' + Espaco(sCodArt,14)+ ''') AND ');
	    bDeleta := false;
	 end;
	 qryAtuPrecoSug.Open;
	 If IdModChefBuffet > 0 then begin
	    rCusto :=0;
	    qryModChef.First;
	    while not qryModChef.EOF do begin
	       qryCustoArt.Close;
	       qryCustoArt.ParamByName('CODARTIGO').AsString := Espaco(qryModChefCODARTIGO.AsString,14);
	       qryCustoArt.Open;
	       If not qryCustoArt.isEmpty then begin
		  If qryCustoArtCUSTOMEDIO.AsFloat > qryCustoArtCUSTOREP.AsFloat then
		     rCusto := rCusto + (qryModChefQTDE.AsFloat * qryCustoArtCUSTOMEDIO.AsFloat)
		  else
		     rCusto := rCusto + (qryModChefQTDE.AsFloat * qryCustoArtCUSTOREP.AsFloat);
	       end;
	       qryModChef.Next;
	    end;
	    qryModChef.First;
	    rCusto := rCusto/qryModChefBUFFETQTDPREVISTA.AsFloat;
	    //
	    qryAtuPrecoSug.Edit;
	    qryAtuPrecoSugVLRCUSTO.AsFloat := rCusto;
	    qryAtuPrecoSugPRECOSUG.AsFloat := (rCusto/(1-(qryAtuPrecoSugPERCLUCRO.AsFloat/100)));
	    qryAtuPrecoSug.Post;
	    //
	    qryModChef.Edit;
	    qryModChefVLRCUSTO.AsFloat := rCusto;
	    qryModChefPRECOSUG.AsFloat := (rCusto/(1-(qryAtuPrecoSugPERCLUCRO.AsFloat/100)));
	    qryModChef.Post;
	    //
	    qryAtuPrecoSug.ApplyUpDates;
	    qryModChef.ApplyUpDates;
	    qryAtuPrecoSug.CommitUpDates;
	    qryModChef.CommitUpDates;
	 end else begin
	    qryAtuPrecoSug.First;
	    While not qryAtuPrecoSug.EOF do begin
	       rCusto:=0;
	       qryFichaTec.Close;
	       qryFichaTec.ParamByName('CODARTIGO').AsString := Espaco(qryAtuPrecoSugCODARTIGO.AsString,14);
	       qryFichaTec.Open;
	       if not qryFichaTec.isEmpty then begin
	          qryFichaTec.First;
                  while not qryFichaTec.EOF do begin
                    qryCustoArt.Close;
                    qryCustoArt.ParamByName( 'CODARTIGO' ).AsString := Espaco( qryFichaTecCODARTIGOSEC.AsString, 14 );
                    qryCustoArt.Open;
                    if not qryCustoArt.isEmpty then begin
                      if qryCustoArtCUSTOMEDIO.AsFloat > qryCustoArtCUSTOREP.AsFloat then
                        rCustoInd := ( qryFichaTecQTDE.AsFloat * qryCustoArtCUSTOMEDIO.AsFloat )
                      else
                        rCustoInd := ( qryFichaTecQTDE.AsFloat * qryCustoArtCUSTOREP.AsFloat );
                    end else begin
                        rCustoInd := 0;
                    end;
                    rCusto := rCusto + rCustoInd;
                    qryUpdFichaTec.Close;
                    qryUpdFichaTec.ParamByName('CODARTIGOPRINC').AsString :=  Espaco(qryFichaTecCODARTIGOPRINC.AsString,14);
                    qryUpdFichaTec.ParamByName('CODARTIGOSEC').AsString   :=  Espaco(qryFichaTecCODARTIGOSEC.AsString,14);
                    qryUpdFichaTec.ParamByName('VLRCUSTO').AsFloat        :=  rCustoInd;
                    qryUpdFichaTec.ExecSQL;
                    qryFichaTec.Next;
                  end;
	       end else begin
		  qryCustoArt.Close;
		  qryCustoArt.ParamByName('CODARTIGO').AsString := Espaco(qryAtuPrecoSugCODARTIGO.AsString,14);
		  qryCustoArt.Open;
		  If not qryCustoArt.isEmpty then begin
		     If qryCustoArtCUSTOMEDIO.AsFloat > qryCustoArtCUSTOREP.AsFloat then
			rCusto := qryCustoArtCUSTOMEDIO.AsFloat*qryAtuPrecoSugFATOR.AsFloat
		     else
			rCusto := qryCustoArtCUSTOREP.AsFloat*qryAtuPrecoSugFATOR.AsFloat;
		  end;
	       end;
	       qryAtuPrecoSug.Edit;
	       qryAtuPrecoSugVLRCUSTO.AsFloat := rCusto;
	       qryAtuPrecoSugPRECOSUG.AsFloat := (rCusto /(1-(qryAtuPrecoSugPERCLUCRO.AsFloat/100)));
	       qryAtuPrecoSug.Post;
	       qryAtuPrecoSug.Next;
	    end;
	    qryAtuPrecoSug.ApplyUpDates;
	    qryAtuPrecoSug.CommitUpDates;
	 end;
      end;
   Finally
      if bDeleta then begin
	 DtmMoviment.qryAtuPrecoSug.Close;
	 DtmMoviment.qryAtuPrecoSug.SQL.Insert(11,'(I.CODARTIGO = ''XPTO'') AND ');
      end;
   End;
End;



function TMovNew.InfoSaldoValidade(iCodAlmox: Integer; sCodArt,
  sDataVali: String): Double;
begin
    sCodArt := Espaco( Trim(sCodArt), 14);
    With DtmMoviment.qrySaiLoteVali Do
       Begin
           sDataVali := FormatDateTime('DD/MM/YYYY',StrtoDateTime(sDataVali));
           Close;
           SQL.Delete(10);
           if trim(sDataVali) = '' then
              SQL.Insert(10, ' AND (1 = 1)')
           else
              SQL.Insert(10, ' AND (L.DATAVALIDADE = TO_DATE('''+sDataVali+''',''DD/MM/YYYY''))');
           ParamByName('pCODALMOXARIFADO').asInteger := iCodAlmox;
           ParamByName('pCODARTIGO').asString        := sCodArt;
           Open;
           Result := FieldByName('SALDOLOTE').AsFloat;
       end;
end;

end.
