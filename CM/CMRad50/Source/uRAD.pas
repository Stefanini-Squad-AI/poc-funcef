// andre tavares - pendência 17624 - 16/11/2004
unit uRAD;

interface

Uses SysUtils, Wwquery, Forms, Dialogs;

Type
     TRad = Class
           private
                 FTipoProcesso     : LongInt;     // Tipo de Processos instaciando
                 FValor            : Double;      // Valor utilizado no processo
                 FCodCentroCusto   : String;      // Chave do Centro de Custo
                 FIdEmpresa        : LongInt;     // Chave do Centro de Custo
                 FCodCentroRespon  : String;      // Chave do Centro de Resposabilidade
                 FUnidNegoc        : LongInt;     // Chave da Unidade de Negócio
                 FCodGrupoProd     : String;      // Chave da Tabela Grupo de Produto
                 FIdPessoa         : LongInt;     // Empresa próripa
                 FIdUsuario        : LongInt;     // Usuario que esta executando a etapa
                 FOBS              : String;      // Observação do processo
                 FIdProcesso       : LongInt;     // Indica o Processo selecionado na execução da etapa
                 FIdPessResp       : LongInt;     // Tipo de Pessoa que está associado o processo
                 FCodTipDoc        : Integer;     // tipo de documento
//                 FValMinimo        : Double;      // Valor mínimo para criação do processo

                 //
                 Function ExecQry( Var q : TwwQuery ) : Boolean;
    procedure SetCodTipDoc(const Value: Integer);
           public
             // Atributos
                Property TipoProcesso     : LongInt  Read FTipoProcesso    Write FTipoProcesso;
                Property Valor            : Double   Read FValor           Write FValor;
//                Property ValMinimo        : Double   Read FValMinimo       Write FValMinimo;
                Property CodCentroCusto   : String   Read FCodCentroCusto  Write FCodCentroCusto;
                Property IdEmpresa        : LongInt  Read FIdEmpresa       Write FIdEmpresa;
                Property CodCentroRespon  : String   Read FCodCentroRespon Write FCodCentroRespon;
                Property UnidNegoc        : LongInt  Read FUnidNegoc       Write FUnidNegoc;
                Property CodGrupoProd     : String   Read FCodGrupoProd    Write FCodGrupoProd;
                Property IdPessoa         : LongInt  Read FIdPessoa        Write FIdPessoa;
                Property OBS              : String   Read FOBS             Write FOBS;
                Property IdProcesso       : LongInt  Read FIdProcesso      Write FIdProcesso;
                Property IdPessResp       : LongInt  Read FIdPessResp      Write FIdPessResp;
                Property CodTipDoc        : Integer read FCodTipDoc write SetCodTipDoc;
             // Mensagens
           Constructor Create;
           Destructor  Destroy; Override;
           Function    IniciarProcesso  : LongInt;
           Function    SituacaoProcesso : Boolean;
           Function    VerifNumDia( cTipo : Char; iIdTpProc,IdTpEtapa : LongInt ) : Integer;
           Function    InfoNumProcPend(Msg : Boolean = True) : Integer;
     end;

Var
   Rad  : TRad;

implementation

Uses DRad, UDataBase, USistema, udiasUteis;

Destructor TRad.Destroy;
Begin
    if assigned(DtmRad) then
      freeAndNil(DtmRAD);
//      DtmRAD.Free;
    Inherited Destroy;
End;

Constructor TRad.Create;
Begin
   Inherited Create;
   DtmRAD           := TDtmRAD.Create(Application);
   FTipoProcesso    := -1;
   FValor           := 0;
//   FValMinimo       := 0;
   FCodCentroCusto  := '';
   FIdEmpresa       := -1;
   FCodCentroRespon := '';
   FUnidNegoc       := -1;
   FCodGrupoProd    := '';
   FIdPessoa        := -1;
   FIdUsuario       := -1;
   FIdProcesso      := -1;
   FIdPessResp      := -1;
   FCodTipDoc       := -1; // Andre Tavares - pendência 17624 - 16/11/2004
End;

Function TRad.IniciarProcesso : LongInt;
Var
   iIdProc  : LongInt;
   iIdEtapa : LongInt;
   ValMinimo : Double;
Begin
    //Rosane: Falta colocar a data prevista de termino do processo e da etapa.
    Result := -1;
    // ========================================================================
    //  Se não preencher o tipo de processo não cria o processo
    // ========================================================================
    if FTipoProcesso < 0 Then
       Result := -1
    Else
       Begin
            ValMinimo := 0;
            DtmRad.qryAux.SQL.Text := 'SELECT VALMINIMO FROM RADTIPOPROCESSO ' +
            ' WHERE (IDTIPOPROCESSO = ' + IntToStr( FTipoProcesso ) + ')';
            DtmRad.qryAux.Open;
            if not DtmRad.qryAux.EOF Then
               ValMinimo := DtmRad.qryAux.FieldByName('VALMINIMO').AsFloat;

            if FValor > ValMinimo Then Begin
               With DtmRad Do
                  Begin
                       qryEmpresaProp.Close;
                       qryEmpresaProp.ParamByName('pIDPESSOA').AsFloat := Sistema.idEmpresa;
                       qryEmpresaProp.Open;
                       //
                       qryExecProc.Close;
                       iIdProc := LeUltRegistro(nil,'RADINSTPROCESSO');
                       //
                       qryExecProc.ParamByName('pIDPROCESSO').AsInteger       := iIdProc;
                       qryExecProc.ParamByName('pIDTIPOPROCESSO').AsInteger   := FTipoProcesso;
                       qryExecProc.ParamByName('pIDUSUARIO').AsInteger        := Sistema.IdUsuario;
                       qryExecProc.ParamByName('pFLGOK').AsString             := 'N';
                       qryExecProc.ParamByName('pDATAINIPROCESSO').AsDateTime := Date;
                       qryExecProc.ParamByName('PDATAFIMPREV').AsDateTime     := DiasUteis.SomaDiasUteis(Date,Rad.VerifNumDia('P',FTipoProcesso,-1),
                                                                 qryEmpresaProp.FieldByName('IDCIDADES').AsInteger,qryEmpresaProp.FieldByName('IDPAIS').AsInteger,
                                                                 qryEmpresaProp.FieldByName('IDESTADO').AsString,False,True,False);
                       If Trim(FCodCentroCusto) <> '' Then
                          qryExecProc.ParamByName('pCODCENTROCUSTO').asString := FCodCentroCusto
                       Else
                          qryExecProc.ParamByName('pCODCENTROCUSTO').Clear;

                       if FIdPessoa > 0 Then
                          qryExecProc.ParamByName('pIDPESSOA').AsInteger  := FIdPessoa
                       Else
                          qryExecProc.ParamByName('pIDPESSOA').Clear;

                       if FIdEmpresa > 0 Then
                          qryExecProc.ParamByName('pIDEMPRESA').AsInteger := FIdEmpresa
                       Else
                          qryExecProc.ParamByName('pIDEMPRESA').Clear;

                       if FUnidNegoc > 0 Then
                          qryExecProc.ParamByName('pUNIDNEGOC').AsInteger     := FUnidNegoc
                       Else
                          qryExecProc.ParamByName('pUNIDNEGOC').Clear;

                       // inicio - andre tavares - pendência 17624 - 16/11/2004
                       if FCodTipDoc > 0 Then
                          qryExecProc.ParamByName('pCodTipDoc').AsInteger := FCodTipDoc
                       Else
                          qryExecProc.ParamByName('pCodTipDoc').Clear;
                       // fim - andre tavares - pendência 17624 - 16/11/2004

                       if Trim(FCodGrupoProd) <> '' Then
                          qryExecProc.ParamByName('pCODGRUPOPROD').asString   := FCodGrupoProd
                       Else
                          qryExecProc.ParamByName('pCODGRUPOPROD').Clear;

                       if Trim(FCodCentroRespon) <> '' Then
                          qryExecProc.ParamByName('pCODCENTRORESPON').asString := FCodCentroRespon
                       Else
                          qryExecProc.ParamByName('pCODCENTRORESPON').Clear;

                       qryExecProc.ParamByName('pVLRPROCESSO').AsFloat := FValor;

                       If FIdPessResp > 0 Then
                          qryExecProc.ParamByName('pIDPESSRESP').AsFloat  := FIdPessResp
                       Else
                          qryExecProc.ParamByName('pIDPESSRESP').Clear;

                       qryExecProc.ParamByName('POBS').AsString        := FOBS;
                       if ExecQry( qryExecProc ) Then
                          Begin
                              qryEtapa.Close;
                              qryEtapa.Params[0].Value := FTipoProcesso;
                              qryEtapa.Open;
                              If Not qryEtapa.IsEmpty Then
                                 Begin
                                    //Rosane: Alterei aqui para pegar todas as primeiras etapas
                                    //        Coloquei somente um While.
                                    qryEtapa.First;
                                    While Not qryEtapa.EOF do
                                        Begin
                                           qryExecEtapa.Close;
                                           iIdEtapa := LeUltRegistro(nil,'RADINSTETAPA');
                                           //
                                           qryExecEtapa.ParamByName('pIDPROCESSO').AsInteger    := iIdProc;
                                           qryExecEtapa.ParamByName('pIDETAPA').AsInteger       := iIdEtapa;
                                           qryExecEtapa.ParamByName('pIDTIPOETAPA').AsInteger   := qryEtapa.FieldByName('IDTIPOETAPA').asInteger;
                                           qryExecEtapa.ParamByName('pDATAINIETAPA').AsDateTime := Date;
                                           qryExecEtapa.ParamByName('PDATAFIMPREV').AsDateTime  := DiasUteis.SomaDiasUteis(Date,Rad.VerifNumDia('E',FTipoProcesso,qryEtapa.FieldByName('IDTIPOETAPA').asInteger),
                                                                 qryEmpresaProp.FieldByName('IDCIDADES').AsInteger,qryEmpresaProp.FieldByName('IDPAIS').AsInteger,
                                                                 qryEmpresaProp.FieldByName('IDESTADO').AsString,False,True,False);
                                           qryExecEtapa.ParamByName('pIDETAPAANT').Clear;
                                           if ExecQry( qryExecEtapa ) Then
                                              Result := iIdProc
                                           Else
                                              Result := -1;
                                           qryEtapa.Next;
                                        end;
                                 End
                              Else
                                 Result := -1;
                          End
                       Else
                          Result := -1;
                  End;
            End;
       End;
End;

Function TRad.SituacaoProcesso : Boolean;
Begin
    Result := False;
    if FIdProcesso > 0 Then
       Begin
            With DtmRad Do
               Begin
                   qryProc.Close;
                   qryProc.Params[0].asInteger := FIdProcesso;
                   qryProc.Open;
                   If Not qryProc.IsEmpty Then
                       Result := qryProc.FieldByName('FLGOK').asString = 'S'
                   Else
                       Result := False;
               End;
       End;
End;

Function TRad.ExecQry( Var q : TwwQuery ) : Boolean;
Begin
    Result := True;
    Try
       q.ExecSql;
    Except
       Result := False;
    End;
End;

Function TRad.VerifNumDia( cTipo : Char; iIdTpProc,IdTpEtapa : LongInt ) : Integer;
Begin
    Result := 0;
    If cTipo = 'E' Then
       Begin
          DtmRad.qryNDiaEtapa.Close;
          DtmRad.qryNDiaEtapa.ParamByName('pIDPROC').AsInteger  := iIdTpProc;
          DtmRad.qryNDiaEtapa.ParamByName('pIDETAPA').AsInteger := IdTpEtapa;
          DtmRad.qryNDiaEtapa.Open;
          If Not DtmRad.qryNDiaEtapa.IsEmpty Then
             Result := DtmRad.qryNDiaEtapa.fieldByName('NUMDIASPREVISTO').asInteger;
       End
    Else
    If cTipo = 'P' Then
       Begin
          DtmRad.qryNDiaProc.Close;
          DtmRad.qryNDiaProc.Params[0].AsInteger  := iIdTpProc;
          DtmRad.qryNDiaProc.Open;
          If Not DtmRad.qryNDiaProc.IsEmpty Then
             Result := DtmRad.qryNDiaProc.fieldByName('NUMDIASPREVISTO').asInteger;
       End;
End;

Function TRad.InfoNumProcPend(Msg : Boolean = True) : Integer;
Begin
   With DtmRad Do
      Begin
          qryInfoProcPend.Close;
          qryInfoProcPend.ParamByName('pIDUSUARIO').asInteger := Sistema.IdUsuario;
          qryInfoProcPend.Open;
          If Not qryInfoProcPend.IsEmpty Then
             Begin
                If ( qryInfoProcPend.FieldByName('NUMERO').asInteger > 0 ) And ( Msg ) Then
                   ShowMessage('Existem '+qryInfoProcPend.FieldByName('NUMERO').asString+' processo(s) pendente(s) de sua autorização');
             End;
          Result := qryInfoProcPend.FieldByName('NUMERO').asInteger;
      End;
End;

procedure TRad.SetCodTipDoc(const Value: Integer);
begin
  FCodTipDoc := Value;
end;

end.
