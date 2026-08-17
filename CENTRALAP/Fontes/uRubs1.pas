(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/10/2000
*******************************************************************************)

unit uRubs;

interface

Uses SysUtils, Forms, Classes, DB, wwQuery, dialogs, FileCtrl, Controls,ufiario,fatend;

   {
    >>Status da RUBS/Histórico da RUBS
    1,'Gerado'
    2,'Emitido'
    3,'Regerado'
    4,'Reemitido'
    5,'Cancelado'
    6,'Carta Enviada'
    7,'Encerrado'
    //Somente Para Histórico
    8,'Etiqueta Emitida'
    9,'Carta de Rosto Emitida'
    10,'Termo Emitido'
    11,'Documento Recebido'
    12,'Documento Pendente'
   }


CONST
  SQLRUBSPEND =
     '  SELECT DISTINCT ' +
     '     R.IDRUBS, ' +
     '     DECODE(R.FLGSTATUS,1,''Gerado'', ' +
     '     DECODE(R.FLGSTATUS,2,''Emitido'', ' +
     '     DECODE(R.FLGSTATUS,3,''Regerado'', ' +
     '     DECODE(R.FLGSTATUS,4,''Reemitido'', ' +
     '     DECODE(R.FLGSTATUS,5,''Cancelado'', ' +
     '     DECODE(R.FLGSTATUS,6,''Carta Enviada'', ' +
     '     ''Encerrado'')))))) AS STATUS, ' +
     '     R.FLGSTATUS, ' +
     '     R.FLGSTATUS AS FLGOLDSTATUS, ' +
     '     R.IDCANCELAMENTO, ' +
     '     R.IDHISTBAIXA, ' +
     '     R.IDHISTLANCTO, ' +
     '     HL.DATAMOV ' +
     '  FROM ' +
     '     RUBXBENEFICIO RB, ' +
     '     RUBS R, ' +
     '     HISTMOVRUBS HL ' +
     '  WHERE ';

     WHERERUBSPEND =
       '    (R.IDHISTLANCTO = HL.IDHISTMOVRUBS(+)) AND ' +
       '    (R.IDRUBS = RB.IDRUBS) ' +
       ' ORDER BY ' +
       '    R.IDRUBS ';

  SQLDOCPEND =
     ' SELECT DISTINCT ' +
     '    TD.NOMEDOCUMENTO, ' +
     '    TD.IDDOCUMENTO, ' +
     '    TP.FLGRECEBIDO, ' +
     '    TP.FLGRECEBIDO AS OLDFLGRECEBIDO, ' +
     '    TP.DATARECEB, ' +
     '    TP.IDTIPODOCXRUB, ' +
     '    TP.IDRUBXBENEFICIO, ' +
     '    R.IDRUBS ' +
     ' FROM ' +
     '    TIPODOCXRUB TP, ' +
     '    DOCUMENTOS TD, ' +
     '    RUBXBENEFICIO RX, ' +
     '    RUBS R ' +
     ' WHERE ';
  WHEREDOCPEND =
     '    (TP.IDDOCUMENTO = TD.IDDOCUMENTO) AND ' +
     '    (RX.IDRUBXBENEFICIO = TP.IDRUBXBENEFICIO) AND ' +
     '    (R.IDRUBS = RX.IDRUBS) ' +
     ' ORDER BY ' +
     '    TP.FLGRECEBIDO, TD.NOMEDOCUMENTO ';

  SQLDOCPENDHISTORICO =
     ' SELECT DISTINCT ' +
     '    R.IDRUBS, ' +
     '    R.IDCANCELAMENTO, ' +
     '    R.IDHISTBAIXA, ' +
     '    R.IDHISTLANCTO ' +
     ' FROM ' +
     '    RUBXBENEFICIO RB, ' +
     '    RUBS R ' +
     ' WHERE ' +

     '    (R.IDRUBS = RB.IDRUBS) ';

type
   TStatusRubs = (srGerado,srEmitido,srRegerado,srReemitido,srCancelado,srCartaEnviada,srEncerrado,
                  srEtiquetaEmitida, srCartadeRostoEmitida, srTermoEmitido,srDocumentoRecebido,
                  srDocumentoPendente);
   TRubs = Class; //Forward declaration

   TBeneficios = Class
   private
      fIdPessJur :Real;
      fIdPessoa :Real;
      fIdPlanoPrev :Real;
      fIdBeneficio :Real;
      fIdsitbenef :Real;
      fIdRubXBenef :Real;
      fOwner :TRubs;
   public
      Constructor Create(AOwner:TRubs);
      Procedure Insert;

      property IdRubXBenef :Real read fIdRubXBenef;
      property IdPessJur :Real read fIdPessJur write fIdPessJur;
      property IdPessoa :Real read fIdPessoa write fIdPessoa;
      property IdPlanoPrev :Real read fIdPlanoPrev write fIdPlanoPrev;
      property IdBeneficio :Real read fIdBeneficio write fIdBeneficio;
      property Idsitbenef :Real read fIdsitbenef write fIdsitbenef;
   End;

   TDocumentos = Class
   private
      fIdDocumento :Real;
      fIdRubXBenef :Real;
      fDataRecebimento :TDateTime;
      fRecebido :Boolean;
      fOwner :TRubs;
      fIdtipoDocxRub :Real;
      fNome :String;
   public
      Procedure Insert;
      Procedure Edit;
      Constructor Create(AOwner:TRubs);

      property Nome :String read fNome write fNome;
      property IdtipoDocxRub :Real read fIdtipoDocxRub write fIdtipoDocxRub;
      property IdRubXBenef :Real read fIdRubXBenef write fIdRubXBenef;
      property IdDocumento :Real read fIdDocumento write fIdDocumento;
      property Recebido :Boolean read fRecebido write fRecebido;
      property DataRecebimento :TDateTime read fDataRecebimento write fDataRecebimento;
   End;

   THistorico = Class
   private
      fStatusRubs :TStatusRubs;
      fDescricao :String;
      fIdHistorico :Real;
      fOwner :TRubs;

      function GetDescricao:String;
   public
      Constructor Create(AOwner:TRubs);
      Procedure Insert;

      property IdHistorico :Real read fIdHistorico;
      property StatusRubs :TStatusRubs read fStatusRubs write fStatusRubs;
      property Descricao :String read GetDescricao write fDescricao;
   End;

   TRubs = Class
   private
     _IdCartaPadrao :LongInt;
     _IdEtiquetaPadrao :LongInt;
     _ListaArquivoDel :Tstrings;
     fDeletaArquivos:Boolean;
     fNumRub :Real;
     fStatusRubs :TStatusRubs;
     fIdAssuntoxAtend :Real;
     fIdRubs :Real;
     fBeneficios :TBeneficios;
     fDocumentos :TDocumentos;
     fHistorico :THistorico;
     fFormCaption :String;
     fEsperaForm :Boolean;
     fidtipobaixa :Real;
     Procedure SetDadosRub(Value: Real);
     procedure AtualizaHistoricos;
     Procedure EmiteAnexos;
     Procedure EmiteComplementos;
     Procedure GeraAnexos(idConfigRubs:LongInt; StatusHistorico:TStatusRubs;var slinhas:string);
     Procedure GetDeletaArquivos(Value:Boolean);
     function ZD(N:string; T:Integer):String;
   public
     Constructor Create;
     Destructor Destroy; Override;
     Procedure Emite;
     Procedure Insert;
     Procedure Execute;
     Procedure Edit;
     function GetTipoBaixa:LongInt;
     function DescricaoStatus(pStatusRubs: tStatusRubs):String;
     procedure GetComplementosRUBS;
     procedure SetParamEmissao;

     property DeletaArquivos :Boolean read fDeletaArquivos write GetDeletaArquivos;
     property idtipobaixa :Real read fidtipobaixa write fidtipobaixa;
     property EsperaForm :Boolean read fEsperaForm write fEsperaForm;
     Property IdRubs :Real read fIdRubs write fIdRubs;
     Property StatusRubs :TStatusRubs read fStatusRubs write fStatusRubs;
     Property IdAssuntoxAtend :Real read fIdAssuntoxAtend write fIdAssuntoxAtend;
     Property Beneficio :TBeneficios read fBeneficios write fBeneficios;
     Property Documento :TDocumentos read fDocumentos write fDocumentos;
     Property Historico :THistorico read fHistorico write fHistorico;
     Property NumRub :Real read fNumRub write SetDadosRub;
     Property FormCaption :String read fFormCaption write fFormCaption;
   End;

var
   Rubs : TRubs;

implementation

Uses datend, uString, uFuncaoGeral, uDataBase, fTelaAut, FCadRubNew, uSistema,
     fSelMotivoBaixa, dRubs, FSelCartaEtiq;

Constructor TRubs.Create;
Begin
  Inherited Create;
  fBeneficios := TBeneficios.Create(Self);
  fDocumentos := TDocumentos.Create(Self);
  fHistorico := THistorico.Create(Self);
  _ListaArquivoDel := TStringList.Create;
  fDeletaArquivos := False;
End;

Destructor TRubs.Destroy;
Begin
   fBeneficios.Free;
   fDocumentos.Free;
   fHistorico.Free;
   _ListaArquivoDel.Free;
   Inherited Destroy;
End;

Procedure TRubs.GetDeletaArquivos(Value:Boolean);
Begin
   fDeletaArquivos := Value;
   _ListaArquivoDel.Clear;
End;

function TRubs.DescricaoStatus(pStatusRubs: tStatusRubs):String;
Begin
  Case pStatusRubs Of
    srGerado : Result := 'Gerada';
    srEmitido : Result := 'Emitida';
    srRegerado : Result := 'Regerada';
    srReemitido : Result := 'Reemitida';
    srCancelado : Result := 'Cancelada';
    srCartaEnviada : Result := 'Carta Enviada';
    srEncerrado : Result := 'Encerrada';
    Else
      Result := 'Status Incorreto';
  End;
End;

Procedure TRubs.Insert;
Begin
   With DtmRubs.QryInsRubs Do
   Begin
      fIdRubs := LeultRegistro(nil,'RUBS');

      ParamByName('IDRUBS').AsFloat := fIdRubs;
      ParamByName('FLGSTATUS').AsString := IntToStr(Integer(fStatusRubs) + 1);
      ParamByName('IDASSUNTOXATEND').ASFloat := fIdAssuntoxAtend;
      ParamByName('IDHISTLANCTO').Clear;
      ParamByName('IDHISTBAIXA').Clear;
      ParamByName('IDCANCELAMENTO').Clear;
      ExecSql;
       

   End;

   fHistorico.StatusRubs := fStatusRubs;
   fHistorico.Descricao := '';
   fHistorico.Insert;

   AtualizaHistoricos;
End;

Procedure TRubs.Edit;
Begin
   With DtmRubs.QryUpdRubs Do
   Begin
      ParamByName('FLGSTATUS').AsString := IntToStr(Integer(fStatusRubs) + 1);
      ParamByName('IDRUBS').AsFloat := fIdRubs;
      ExecSql;

      fHistorico.fStatusRubs := fStatusRubs;
      fHistorico.Insert;

      AtualizaHistoricos;
   End;
End;

Procedure TRubs.SetDadosRub(Value: Real);

  Procedure OpenQueryWithParam(Qry :Array of TwwQuery; aParams :Real);
  Var
    X, iNumQry:Integer;
  Begin
    iNumQry := High(Qry);
    For X:=0 To iNumQry Do
      With Qry[x] Do
      Begin
         If Active Then Close;
         If Not Prepared Then Prepare;
         Params[0].AsFloat := aParams;
         Open;
      End;
  End;

Begin
 OpenQueryWithParam([DtmRubs.QryGeraRub,DtmRubs.QryGeraRubxBenf,
                     DtmRubs.QryGeraRubTipoDoc,DtmRubs.QryModelorub,
                     DtmRubs.QryBuscaDocTitular,DtmRubs.QryBuscaNumDocTitular
                     ],Value);

 OpenQueryWithParam([DtmRubs.QryCamposRub],DtmRubs.QryModelorubIDCONFIGRUBS.AsFloat);
End;

Procedure TRubs.Emite;
Var
  TxtRub :TextFile;
  sLinha :String;
Begin
  With DtmRubs Do
  Begin
     If (Not QryModelorub.IsEmpty) And
        (Not QryCamposRub.IsEmpty) And
        (Not QryGeraRub.IsEmpty)  Then
     Begin
        EmiteComplementos;

        AssignFile(TxtRub,QryModelorubNOMETXTRUB.AsString);

        Try
          //Cria o Diretório caso o mesmo não exista
          If Not DirectoryExists(ExtractFilePath(QryModelorubNOMETXTRUB.AsString)) Then
             ForceDirectories(ExtractFilePath(QryModelorubNOMETXTRUB.AsString));

          If (fDeletaArquivos) And
             (_ListaArquivoDel.IndexOf(QryModelorubNOMETXTRUB.AsString) = -1) Then
          Begin
             _ListaArquivoDel.Add(QryModelorubNOMETXTRUB.AsString);
             DeleteFile(QryModelorubNOMETXTRUB.AsString);
          End;

          If FileExists(QryModelorubNOMETXTRUB.AsString) Then
             //Abre o arquivo para inserção
                Append(TxtRub)
          Else
          Begin
             //Cria o arquivo e monta o header;
             sLinha := '';
             ReWrite(TxtRub);
             QryCamposRub.First;
             While Not QryCamposRub.Eof Do
             Begin
                 sLinha := sLinha +
                           Trim(QryCamposRubDESCHEADERRUBS.AsString) +
                           Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                 QryCamposRub.Next;
             End;

             If QryModelorubFLGDELIMITALINHA.AsString = 'N' Then
                Delete(sLinha,Length(sLinha),1);

             Writeln(TxtRub,Trim(sLinha));
          End;

          sLinha := '';
          QryCamposRub.First;
          QryGeraRubxBenf.First;
          QryGeraRubTipoDoc.First;
          QryBuscaDocTitular.First;
          QryBuscaNumDocTitular.First;

          While Not QryCamposRub.Eof Do
          Begin
             If (Uppercase(QryCamposRubCAMPODETALHE.AsString) = 'NOMEDOCUMENTO') Then
             Begin
                If QryCamposRubFLGTIPOARQUIVO.AsString = 'X' Then
                Begin
                   //Cria uma qry para termoxdocumentos
                   If Not QryGeraTermoTipoDoc.Eof Then
                   Begin
                      If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                        sLinha := sLinha +
                                  Trim(QryGeraTermoTipoDocNOMEDOCUMENTO.AsString) +
                                 Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                      Else
                        sLinha := sLinha +
                                  Espaco(QryGeraTermoTipoDocNOMEDOCUMENTO.AsString,
                                         QryCamposRubLARGURACOLUNA.AsInteger) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                      QryGeraTermoTipoDoc.Next;
                   End
                   Else
                   Begin
                     If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                        sLinha := sLinha +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                     Else
                        sLinha := sLinha +
                                  Espaco('',QryCamposRubLARGURACOLUNA.AsInteger) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString);
                   End;
                End
                Else
                Begin
                   If Not QryGeraRubTipoDoc.Eof Then
                   Begin
                      If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                        sLinha := sLinha +
                                  Trim(QryGeraRubTipoDocNOMEDOCUMENTO.AsString) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                      Else
                        sLinha := sLinha +
                                  Espaco(QryGeraRubTipoDocNOMEDOCUMENTO.AsString,
                                         QryCamposRubLARGURACOLUNA.AsInteger) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                      QryGeraRubTipoDoc.Next;
                   End
                   Else
                   Begin
                     If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                        sLinha := sLinha +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                     Else
                        sLinha := sLinha +
                                  Espaco('',QryCamposRubLARGURACOLUNA.AsInteger) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString);
                   End;
                End;
             End
             Else
               If (Uppercase(QryCamposRubCAMPODETALHE.AsString) = 'NOME_BENEFICIO_SERVICO') Then
               Begin
                  If Not QryGeraRubxBenf.Eof Then
                  Begin
                     If QryCamposRubLARGURACOLUNA.AsInteger = 0 Then
                        sLinha := sLinha +
                                  Trim(QryGeraRubxBenfNOME_BENEFICIO_SERVICO.AsString) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                     Else
                        sLinha := sLinha +
                                  Espaco(QryGeraRubxBenfNOME_BENEFICIO_SERVICO.AsString,
                                         QryCamposRubLARGURACOLUNA.AsInteger) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                    //Emite Anexos Por Benefícios
                    EmiteAnexos;

                    QryGeraRubxBenf.Next;
                  End
                  Else
                  Begin
                    If QryCamposRubLARGURACOLUNA.AsInteger = 0 Then
                       sLinha := sLinha +
                                 Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                    Else
                       sLinha := sLinha +
                                 Espaco('',QryCamposRubLARGURACOLUNA.AsInteger) +
                                 Trim(QryModelorubSEPARADORCOLUNAS.AsString);
                  End;
               End
               Else
               If (Uppercase(QryCamposRubCAMPODETALHE.AsString) = 'IDRUB') Then
               Begin
                    If QryCamposRubLARGURACOLUNA.AsInteger = 0 Then
                       sLinha := sLinha +
                                 Trim(QryGeraRub.FieldByName(QryCamposRubCAMPODETALHE.AsString).AsString) +
                                 Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                    Else
                       sLinha := sLinha +
                                 Zd(QryGeraRub.FieldByName(QryCamposRubCAMPODETALHE.AsString).AsString,
                                        QryCamposRubLARGURACOLUNA.AsInteger) +
                                 Trim(QryModelorubSEPARADORCOLUNAS.AsString);
               End
               Else
                 If (Uppercase(QryCamposRubCAMPODETALHE.AsString) = 'NOME_DOCUMENTO_PARTICIPANTE') Then
                 Begin
                    If Not QryBuscaDocTitular.Eof Then
                    Begin
                       If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                         sLinha := sLinha +
                                   Trim(QryBuscaDocTitularNOMEDOCUMENTO.AsString) +
                                   Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                       Else
                         sLinha := sLinha +
                                   Espaco(QryBuscaDocTitularNOMEDOCUMENTO.AsString,
                                          QryCamposRubLARGURACOLUNA.AsInteger) +
                                   Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                       QryBuscaDocTitular.Next;
                    End
                    Else
                    Begin
                      If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                         sLinha := sLinha +
                                   Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                      Else
                         sLinha := sLinha +
                                   Espaco('',QryCamposRubLARGURACOLUNA.AsInteger) +
                                   Trim(QryModelorubSEPARADORCOLUNAS.AsString);
                    End;
                 End
                 Else
                   If (Uppercase(QryCamposRubCAMPODETALHE.AsString) = 'NUMERO_DOCUMENTO_PARTICIPANTE') Then
                   Begin
                      If Not QryBuscaNumDocTitular.Eof Then
                      Begin
                         If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                           sLinha := sLinha +
                                     Trim(QryBuscaNumDocTitularNUMDOCUMENTO.AsString) +
                                     Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                         Else
                           sLinha := sLinha +
                                     Espaco(QryBuscaNumDocTitularNUMDOCUMENTO.AsString,
                                            QryCamposRubLARGURACOLUNA.AsInteger) +
                                     Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                         QryBuscaNumDocTitular.Next;
                      End
                      Else
                      Begin
                        If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                           sLinha := sLinha +
                                     Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                        Else
                           sLinha := sLinha +
                                     Espaco('',QryCamposRubLARGURACOLUNA.AsInteger) +
                                     Trim(QryModelorubSEPARADORCOLUNAS.AsString);
                      End;
                   End
                   Else
                   Begin
                      If QryCamposRubLARGURACOLUNA.AsInteger = 0 Then
                         sLinha := sLinha +
                                   Trim(QryGeraRub.FieldByName(QryCamposRubCAMPODETALHE.AsString).AsString) +
                                   Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                      Else
                         sLinha := sLinha +
                                   Espaco(QryGeraRub.FieldByName(QryCamposRubCAMPODETALHE.AsString).AsString,
                                          QryCamposRubLARGURACOLUNA.AsInteger) +
                                   Trim(QryModelorubSEPARADORCOLUNAS.AsString);
                   End;

             QryCamposRub.Next;
          End;

          If QryModelorubFLGDELIMITALINHA.AsString = 'N' Then
             Delete(sLinha,Length(sLinha),1);

          Writeln(TxtRub,Trim(sLinha));
        finally
          CloseFile(TxtRub);
        End;

     End;
  End;
End;

Procedure TRubs.EmiteAnexos;
Var sLinhas :String;
Begin
  With DtmRubs Do
  Begin
    If QryTermosXBenef.Active Then QryTermosXBenef.Close;
    If Not QryTermosXBenef.Prepared Then QryTermosXBenef.Prepare;
    QryTermosXBenef.ParamByName('IDBENEFICIO').AsFloat := QryGeraRubxBenfIDBENEFICIO.AsFloat;
    QryTermosXBenef.ParamByName('IDPESSOA').AsFloat := QryGeraRubxBenfIDPESSOA.AsFloat;
    QryTermosXBenef.ParamByName('IDPLANOPREV').AsFloat := QryGeraRubxBenfIDPLANOPREV.AsFloat;
    QryTermosXBenef.ParamByName('IDSITBENEF').AsFloat := QryGeraRubxBenfIDSITBENEF.AsFloat;
    QryTermosXBenef.Open;
    While Not QryTermosXBenef.Eof Do
    Begin
       GeraAnexos(QryTermosXBenefIDCONFIGRUBS.AsInteger, srTermoEmitido,slinhas);
       QryTermosXBenef.Next;
    End;
  End;
End;

Procedure TRubs.EmiteComplementos;
var
 slinhas :string;
Begin
   If _IdCartaPadrao <> -1 Then  GeraAnexos(_IdCartaPadrao, srCartadeRostoEmitida,slinhas);
   If _IdEtiquetaPadrao <> -1 Then GeraAnexos(_IdEtiquetaPadrao, srEtiquetaEmitida,slinhas);
End;

Procedure TRubs.GeraAnexos(idConfigRubs:LongInt; StatusHistorico:TStatusRubs;var slinhas:string);
 Var
  TxtAnexosRub :TextFile;
Begin
  With DtmRubs Do
  Begin
     If Not QryGeraRub.IsEmpty Then
     Begin
        If QryAnexosRubs.Active Then QryAnexosRubs.Close;
        If Not QryAnexosRubs.Prepared Then QryAnexosRubs.Prepare;
        QryAnexosRubs.Params[0].AsInteger := idConfigRubs;
        QryAnexosRubs.Open;

        If (Not QryAnexosRubs.IsEmpty) Then
        Begin

           AssignFile(TxtAnexosRub,QryAnexosRubsNOMETXTRUB.AsString);

           Try
             //Cria o Diretório caso o mesmo não exista
             If Not DirectoryExists(ExtractFilePath(QryAnexosRubsNOMETXTRUB.AsString)) Then
                ForceDirectories(ExtractFilePath(QryAnexosRubsNOMETXTRUB.AsString));

             If (fDeletaArquivos) And
                (_ListaArquivoDel.IndexOf(QryAnexosRubsNOMETXTRUB.AsString) = -1) Then
             Begin
                _ListaArquivoDel.Add(QryAnexosRubsNOMETXTRUB.AsString);
                DeleteFile(QryAnexosRubsNOMETXTRUB.AsString);
             End;

             If FileExists(QryAnexosRubsNOMETXTRUB.AsString) Then
                //Abre o arquivo para inserção
                Append(TxtAnexosRub)
             Else
             Begin
                //Cria o arquivo e monta o header;
                sLinhas := '';
                ReWrite(TxtAnexosRub);
                QryAnexosRubs.First;
                While Not QryAnexosRubs.Eof Do
                Begin
                    sLinhas := sLinhas +
                              Trim(QryAnexosRubsDESCHEADERRUBS.AsString) +
                              Trim(QryAnexosRubsSEPARADORCOLUNAS.AsString);

                    QryAnexosRubs.Next;
                End;

                If QryAnexosRubsFLGDELIMITALINHA.AsString = 'N' Then
                   Delete(sLinhas,Length(sLinhas),1);

                Writeln(TxtAnexosRub,Trim(sLinhas));
             End;

            QryGeraTermoTipoDoc.Close;
            QryGeraTermoTipoDoc.Prepare;
            QryGeratermoTipoDoc.ParamByName('IDBENEFICIO').AsFloat := QryGeraRubxBenfIDBENEFICIO.AsFloat;
            QryGeratermoTipoDoc.ParamByName('IDPESSOA').AsFloat := QryGeraRubxBenfIDPESSOA.AsFloat;
            QryGeratermoTipoDoc.ParamByName('IDPLANOPREV').AsFloat := QryGeraRubxBenfIDPLANOPREV.AsFloat;
            QryGeratermoTipoDoc.ParamByName('IDSITBENEF').AsFloat := QryGeraRubxBenfIDSITBENEF.AsFloat;
            QryGeratermoTipoDoc.ParamByName('IDTERMOSXBENEF').AsFloat := QryTERMOSXBENEFIDTERMOSXBENEF.AsFloat;
             QryGeratermoTipoDoc.Open;
             sLinhas := '';
             QryAnexosRubs.First;

             While Not QryAnexosRubs.Eof Do
             Begin
             If (Uppercase(QryAnexosRubsCAMPODETALHE.AsString) = 'NOMEDOCUMENTO') then
                begin
              if  Not QryGeraTermoTipoDoc.Eof then
                  Begin
                      If (QryCamposRubLARGURACOLUNA.AsInteger = 0) Then
                        sLinhas := sLinhas +
                                  Trim(QryGeraTermoTipoDocNOMEDOCUMENTO.AsString) +
                                 Trim(QryModelorubSEPARADORCOLUNAS.AsString)
                      Else
                        sLinhas := sLinhas +
                                  Espaco(QryGeraTermoTipoDocNOMEDOCUMENTO.AsString,
                                         QryCamposRubLARGURACOLUNA.AsInteger) +
                                  Trim(QryModelorubSEPARADORCOLUNAS.AsString);

                               QryGeraTermoTipoDoc.Next;
                    End ;
                end;
                If (Uppercase(QryAnexosRubsCAMPODETALHE.AsString) <> 'NOMEDOCUMENTO') And
                   (Uppercase(QryAnexosRubsCAMPODETALHE.AsString) <> 'NOME_BENEFICIO_SERVICO') Then
                Begin
                    If QryAnexosRubsLARGURACOLUNA.AsInteger = 0 Then
                     sLinhas := sLinhas +
                               Trim(QryGeraRub.FieldByName(QryAnexosRubsCAMPODETALHE.AsString).AsString) +
                               Trim(QryAnexosRubsSEPARADORCOLUNAS.AsString)
                    Else
                     sLinhas := sLinhas +
                               Espaco(QryGeraRub.FieldByName(QryAnexosRubsCAMPODETALHE.AsString).AsString,
                                      QryAnexosRubsLARGURACOLUNA.AsInteger) +
                               Trim(QryAnexosRubsSEPARADORCOLUNAS.AsString);

                End;

                QryAnexosRubs.Next;
             End;

             If QryAnexosRubsFLGDELIMITALINHA.AsString = 'N' Then
                Delete(sLinhas,Length(sLinhas),1);

             Writeln(TxtAnexosRub,Trim(sLinhas));
             fHistorico.StatusRubs := StatusHistorico;
             fHistorico.Descricao := 'Emissão de ' + QryAnexosRubsDESCRUB.AsString;
             fHistorico.Insert;

           finally
             CloseFile(TxtAnexosRub);
           End;
        End;
     End;
  End;
End;


Procedure TRubs.Execute;
Begin
   AbrirForm(FrmCadRubNew , TFrmCadRubNew, False);
   FrmCadRubNew.PnlAssunto.Caption := fFormCaption;

   fEsperaForm := True;

   While fEsperaForm Do Application.ProcessMessages;
End;

procedure TRubs.SetParamEmissao;
Begin
   If FazQuery(DtmRubs.QryAux,
              'SELECT IDCARTAPADRAO, IDETIQPADRAO FROM PARAMCENTRALAP WHERE IDPESSOA = ' + FloatToStr(Sistema.IdEmpresa)) Then
   Begin
      _IdCartaPadrao := DtmRubs.QryAux.Fields[0].AsInteger;
      _IdEtiquetaPadrao := DtmRubs.QryAux.Fields[1].AsInteger;
   End
   Else
   Begin
      _IdCartaPadrao := -1;
      _IdEtiquetaPadrao := -1;
   End;
End;

procedure TRubs.GetComplementosRUBS;
Var
 F: TFrmSelCartaEtiq;
Begin
   Try
      Application.CreateForm(TFrmSelCartaEtiq,F);
      F.ShowModal;
      SetParamEmissao;
   finally
      F.Free;
   End;
End;

function TRubs.GetTipoBaixa:LongInt;
Begin
  Try
     Application.CreateForm(TfrmSelMotivoBaixa,frmSelMotivoBaixa);

     If frmSelMotivoBaixa.Qry.Active Then frmSelMotivoBaixa.Qry.Close;

     If fStatusRubs = srCancelado Then
        frmSelMotivoBaixa.Qry.Params[0].AsInteger := 1
     Else
        frmSelMotivoBaixa.Qry.Params[0].AsInteger := 0;

     frmSelMotivoBaixa.Qry.Open;

     If (frmSelMotivoBaixa.ShowModal = MrOk) And
        (frmSelMotivoBaixa.CmbMotivoBaixa.Text <> '') Then
        Result := StrToInt(frmSelMotivoBaixa.CmbMotivoBaixa.LookupValue)
     Else
        Result := -1;
  Finally
     frmSelMotivoBaixa.Free;
  End;
End;

procedure TRubs.AtualizaHistoricos;
Begin
   With DtmRubs Do
   Begin
      Case fStatusRubs of
         srGerado :
         Begin
            QryUpdHistLancto.ParamByname('IDRUBS').AsFloat := fIdRubs;
            QryUpdHistLancto.ParamByname('IDHISTLANCTO').AsFloat := fHistorico.IdHistorico;
            QryUpdHistLancto.ExecSql;
         End;
         srCancelado,srEncerrado :
         Begin
            QryUpdHistBaixa.ParamByname('IDRUBS').AsFloat := fIdRubs;
            QryUpdHistBaixa.ParamByname('IDHISTBAIXA').AsFloat := fHistorico.IdHistorico;

            If fIdTipoBaixa > 0 Then
               QryUpdHistBaixa.ParamByname('IDCANCELAMENTO').AsFloat := fIdTipoBaixa
            Else
               QryUpdHistBaixa.ParamByname('IDCANCELAMENTO').Clear;

            QryUpdHistBaixa.ExecSql;
         End;
      End;
   End;
End;

{ THistorico = Class }

Constructor THistorico.Create(AOwner:TRubs);
Begin
  Inherited Create;
  fOwner := AOwner;
End;

Procedure THistorico.Insert;
Begin
   With DtmRubs.QryInsHist Do
   Begin
      fIdHistorico := LeultRegistro(nil,'HISTMOVRUBS');

      ParamByName('IDHISTMOVRUBS').AsFloat := fIdHistorico;
      ParamByName('IDRUBS').AsFloat := fOwner.IdRubs;
      ParamByName('FLGSTATUS').AsString := IntToStr(Integer(fStatusRubs) + 1);
      ParamByName('HISTORICO').AsString := GetDescricao;
      ParamByName('DATAMOV').AsDateTime := Date;
      Execsql;
   End;

   fDescricao := '';
End;

function THistorico.GetDescricao:String;
Var
   sOperacao :String;
Begin
   Case fStatusRubs of
      srGerado :sOperacao := 'Gerada';
      srEmitido :sOperacao := 'Emitida';
      srRegerado :sOperacao := 'Regerada';
      srReemitido :sOperacao := 'Reemitida';
      srCancelado :sOperacao := 'Cancelada';
      srCartaEnviada :sOperacao := 'Com Carta Enviada';
      srEncerrado :sOperacao := 'Encerrada';
      srEtiquetaEmitida :sOperacao := 'Etiqueta Emitida';
      srCartadeRostoEmitida :sOperacao := 'Cartade Rosto Emitida';
      srTermoEmitido :sOperacao := 'Termo Emitido';
      srDocumentoRecebido :sOperacao := 'Documento Recebido';
      srDocumentoPendente :sOperacao := 'Documento Pendente';
   Else
      sOperacao := 'Operação não informada'
   End;

   Result := 'RUBS ' + FloatToStr(fOwner.IdRubs) + ' - ' + sOperacao + ' em ' + DateTimeToStr(Now) + ' - Usuário Sistema: ' + Sistema.NomeUsuario + (#13 + #10) + fDescricao;
End;

{ TDocumentos = Class }

Constructor TDocumentos.Create(AOwner:TRubs);
Begin
  Inherited Create;
  fOwner := AOwner;
End;

Procedure TDocumentos.Insert;
Begin
  With DtmRubs.QryInsTipoDoc Do
  Begin
      fIdtipoDocxRub := LeultRegistro(nil,'TIPODOCXRUB');
      ParamByName('IDTIPODOCXRUB').AsFloat := fIdtipoDocxRub;
      ParamByName('IDRUBXBENEFICIO').AsFloat := fIdRubXBenef;
      ParamByName('IDDOCUMENTO').AsFloat := fIdDocumento;

      If fRecebido Then
      Begin
        ParamByName('FLGRECEBIDO').AsString := 'S';
        ParamByName('DATARECEB').AsDateTime := fDataRecebimento;
      End
      Else
      Begin
        ParamByName('FLGRECEBIDO').AsString := 'N';
        ParamByName('DATARECEB').Clear;
      End;
      ExecSql;
  End;
End;

Procedure TDocumentos.Edit;
Begin
  With DtmRubs.QryUpdTipoDoc Do
  Begin
      ParamByName('IDTIPODOCXRUB').AsFloat := fIdtipoDocxRub;

      If fRecebido Then
      Begin
        ParamByName('FLGRECEBIDO').AsString := 'S';
        ParamByName('DATARECEB').AsDateTime := fDataRecebimento;
        fOwner.Historico.StatusRubs := srDocumentoRecebido
      End
      Else
      Begin
        ParamByName('FLGRECEBIDO').AsString := 'N';
        ParamByName('DATARECEB').Clear;
        fOwner.Historico.StatusRubs := srDocumentoPendente
      End;
      ExecSql;

      fOwner.Historico.Descricao := ' Nome Documento: ' + fNome;
      fOwner.Historico.Insert;
   End;
End;

{ TBeneficios = Class }

Constructor TBeneficios.Create(AOwner:TRubs);
Begin
  Inherited Create;
  fOwner := AOwner;
End;

Procedure TBeneficios.Insert;
Begin
  With DtmRubs.QryInsBeneficio Do
  Begin
      fIdRubXBenef := LeultRegistro(nil,'RUBXBENEFICIO');
      ParamByName('IDRUBXBENEFICIO').AsFloat := fIdRubXBenef;
      ParamByName('IDPESSJUR').AsFloat := fIdPessJur;
      ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      ParamByName('IDPLANOPREV').AsFloat := fIdPlanoPrev;
      ParamByName('IDBENEFICIO').AsFloat := fIdBeneficio;
      ParamByName('IDRUBS').AsFloat := fOwner.IdRubs;
      ParamByName('IDSITBENEF').AsFloat := fIdsitbenef;
      ExecSql;
  End;
End;

Function TRubs.ZD(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := N;
     temp := Trim(temp);

     If length(Temp) > T Then
        temp := Copy(Temp,1,T);

     Tam := length(temp);

     for cont:=1 to t - Tam do
         temp:='0'+temp;
     result := temp;
end;


end.

