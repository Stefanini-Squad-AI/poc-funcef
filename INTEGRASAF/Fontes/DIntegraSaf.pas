unit DIntegraSaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, uImpostoRetido;

const
  HISTCOMPL      = 'Importação de Documentos SAF';
  
type
  EIntegraSafError = Exception;
  
  TDtmIntegraSaf = class(TDataModule)
    QryParam: TwwQuery;
    QryParamIDPESSOA: TFloatField;
    QryParamDIRARQUIVO: TStringField;
    QryParamDIRLOG: TStringField;
    QryParamINTOPER: TFloatField;
    QryTipoDocP: TwwQuery;
    QryTipoDocR: TwwQuery;
    QryTipoDocRCODTIPDOC: TFloatField;
    QryTipoDocRDESCRICAO: TStringField;
    QryTipoDocRDEBCRE: TStringField;
    QryTipoDocPCODTIPDOC: TFloatField;
    QryTipoDocPDESCRICAO: TStringField;
    QryTipoDocPDEBCRE: TStringField;
    QryParamCODTIPDOCP: TFloatField;
    QryParamCODTIPDOCR: TFloatField;
    QryParamCOMPLDOCUMENTO: TStringField;
    QryBuscaCliente: TwwQuery;
    QryBuscaFornecedor: TwwQuery;
    QryBuscaClienteIDPESSOA: TFloatField;
    QryBuscaFornecedorIDPESSOA: TFloatField;
    QryTipoCLiente: TwwQuery;
    QryRamoForn: TwwQuery;
    QryTipoCLienteIDTIPOCLIENTE: TFloatField;
    QryTipoCLienteDESCRICAO: TStringField;
    QryRamoFornIDRAMOFORNECEDOR: TFloatField;
    QryRamoFornDESCRAMOFORNECEDOR: TStringField;
    QryParamIDTIPOCLIENTE: TFloatField;
    QryParamIDRAMOFORNECEDOR: TFloatField;
    QryTipoRecebDesemb: TwwQuery;
    QryTipoRecebDesembCODTIPRECDES: TStringField;
    QryTipoRecebDesembPLACONTACREDITO: TStringField;
    QryTipoRecebDesembPLANO: TFloatField;
    QryCentCusto: TwwQuery;
    QryCentCustoCODCENTROCUSTO: TStringField;
    QryCentRespon: TwwQuery;
    QryCentResponCODCENTRORESPON: TStringField;
    QryObrigaSubConta: TwwQuery;
    QryObrigaSubContaPLASUBCONTA: TStringField;
    QryBuscaDadosBanco: TwwQuery;
    QryBuscaDadosBancoIDCBANCARIA: TFloatField;
    QryInsBanco: TwwQuery;
    FloatField1: TFloatField;
    QryInsAgencia: TwwQuery;
    FloatField2: TFloatField;
    QryTxt: TwwQuery;
    QryTxtIDFORCLI: TFloatField;
    QryTxtRECPAG: TStringField;
    QryTxtNODOCUMENTO: TFloatField;
    QryTxtDATAVENCTO: TDateTimeField;
    QryTxtDATALANCTO: TDateTimeField;
    QryTxtVALOR: TFloatField;
    QryTxtCODTIPRECDES: TStringField;
    QryTxtCONTABILIZA: TStringField;
    QryTxtCODCENTRORESPON: TStringField;
    QryTxtOPERACAO: TStringField;
    QryTxtNOME: TStringField;
    QryTxtTIPO: TStringField;
    QryTxtNUMDOCUMENTO: TStringField;
    QryTxtNUMBANCO: TStringField;
    QryTxtNUMAGENCIA: TStringField;
    QryTxtCONTACORRENTE: TStringField;
    QryTxtLOGRADOURO: TStringField;
    QryTxtNOMECIDADE: TStringField;
    QryTxtCEP: TStringField;
    UpdTxt: TUpdateSQL;
    Qry: TwwQuery;
    QryBuscaCCForn: TwwQuery;
    QryBuscaCCFornCONTACFORN: TStringField;
    QryBuscaCCCli: TwwQuery;
    QryBuscaCCCliCONTACCLIENTE: TStringField;
    QryPlanopatro: TwwQuery;
    QryPlanopatroIDPLANOPREV: TFloatField;
    QryPlanopatroIDPATRO: TFloatField;
    QryTxtNUMEMPRESA: TFloatField;
    QryBuscaAlterador: TwwQuery;
    QryBuscaAlteradorCODALTERADOR: TFloatField;
    QryBuscaAlteradorACRESDECRES: TStringField;
    QryBuscaValorDoc: TwwQuery;
    QryBuscaValorDocVALOR: TFloatField;
    QryDocsOpen: TwwQuery;
    QryDocsOpenCODDOCUMENTO: TFloatField;
    QryDocsOpenNODOCUMENTO: TFloatField;
    UpdDocsOpen: TUpdateSQL;
    QryExcDoc: TwwQuery;
    QryDocsOpenPLNCODIGO: TFloatField;
    QryDocsOpenDATALANCTO: TDateTimeField;
    QryTxtNUMAP: TFloatField;
    QryDocsOpenCOMPLDOCUMENTO: TStringField;
    QryHistoricoSaf: TwwQuery;
    QryHistoricoSafFLGBLOQUEADO: TStringField;
  private
    { Private declarations }
    function TiraMascara(sString: string): string;
    Function ExcluirDoc:String;
  public
    { Public declarations }
    procedure ImportaRegistros;
  end;

var
  DtmIntegraSaf: TDtmIntegraSaf;

implementation

{$R *.DFM}

uses
  uIntegraBack, uDocumento, uFuncaoGeral, uSistema, uModulo, uDataBase, ulancContab;

procedure TDtmIntegraSaf.ImportaRegistros;
var
  T                   : TextFile;
  Linha               : string;  
  Campo               : string;  
  iCountCampo         : Integer; 
  CodDocumento        : Longint; 
  OldCodDocumento     : Longint; 
  OldSubConta         : Longint; 
  OldPlano            : Longint; 
  OldPlaConta         : string;
  OldCentCusto        : string;  
  IdForcli            : Longint; 
  ContaCredito        : string;  
  CodTipDoc           : Longint; 
  CodSubConta         : Longint; 
  NumLancto           : Longint; 
  PlnCodigo           : Longint; 
  DebCre              : string;  
  CodTipRecDes        : string;  
  iPlano              : Longint; 
  IdFor               : Longint; 
  IdCli               : Longint; 
  CCusto              : string;  
  CRespon             : string;  
  //idbanco             : Longint;
  //idAgencia           : Longint;
  Ano, Mes, Dia       : Word;
  sConsDocumento      : string;
  iNumReg             : Integer;
  iPlanoSAF, iPatroSAF: Integer;
  lstAux              : TStrings;
  sPerDataIni         : String;
  sPerDataFin         : String;
  sMens               : String;
  CountDocsExcluidos  : Integer;
  CountDocsImportados : Integer;
  CountDocsAnalizados : Integer;
  sData               : String;  
begin
  try
    CountDocsExcluidos := 0;
    CountDocsImportados := 0;
    CountDocsAnalizados := 0;

    lstAux := TStringList.Create;

    if FileExists(Modulo.DirArquivo + 's.saf') then
    begin
      AssignFile(T, Sistema.TempDir + 'Contaspr.txt');
      ReWrite(T);
      raise EIntegraSafError.Create('O Arquivo está em uso. Não é possível abrir arquivo.');
    end;

    DeleteFile(Modulo.DirArquivo + 's.cm');

    lstAux.SaveToFile(Modulo.DirArquivo + 's.cm');

    if QryTxt.Active then QryTxt.CLOSE;
    QryTxt.OPEN;

    AssignFile(T, Modulo.DirArquivo + 'Contaspr.txt');
    Reset(T);

    ReadLn(T, Linha);
    sPerDataIni := DateToStr(EncodeDate(StrToIntDef(Copy(Linha, 1, 4), 0), StrToIntDef(Copy(Linha, 5, 2), 0), StrToIntDef(Copy(Linha, 7, 2), 0)));
    sPerDataFin := DateToStr(EncodeDate(StrToIntDef(Copy(Linha, 9, 4), 0), StrToIntDef(Copy(Linha, 13, 2), 0), StrToIntDef(Copy(Linha, 15, 2), 0)));

    while not EOF(T) do
    begin
      inc(CountDocsAnalizados);
      ReadLn(T, Linha);
      iCountCampo := 0;
      QryTxt.Append;

      sData := '';

      while (Pos('^', Linha) <> 0) do
      begin
        Campo := Copy(Linha, 1, Pos('^', Linha) - 1);
        Linha := Copy(Linha, Pos('^', Linha) + 1, Length(Linha));

        if Campo = '' then
          QryTxt.Fields[iCountCampo].Clear
        else
        begin
          //Tag 1 > Campos Data
          //Tag 2 > Campos Float
          Case QryTxt.Fields[iCountCampo].Tag Of
          1:
          Begin
             //If sData = '' Then
             sData := DateToStr(EncodeDate(StrToIntDef(Copy(Campo, 1, 4), 0), StrToIntDef(Copy(Campo, 5, 2), 0), StrToIntDef(Copy(Campo, 7, 2), 0)));
             QryTxt.Fields[iCountCampo].AsDateTime := StrToDate(sData);
          End;
          2: QryTxt.Fields[iCountCampo].AsFloat := FuncaoGeral.Decode(Trim(Campo),'',0,StrToFloat(Trim(Campo)));
          else
            QryTxt.Fields[iCountCampo].AsString := Campo;
          End;
        end;

        Inc(iCountCampo);
      end;

      QryTxt.Fields[iCountCampo].AsString := Linha;

      QryTxtDATAVENCTO.AsDateTime := QryTxtDATALANCTO.AsDateTime;
      QryTxt.Post;
    end;

    Reset(T);

    //Busca os documentos lançados no período vindos do IntegraSF que estão em aberto
    with QryDocsOpen Do
    Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('IDMODULO').AsFloat := Sistema.idModulo;
       ParamByName('DATAINI').AsDateTime := StrTodate(sPerDataIni);
       ParamByName('DATAFIM').AsDateTime := StrTodate(sPerDataFin);
       Open;
    End;

    iNumReg := 0;
    QryTxt.First;
    while not QryTxt.EOF do
    begin
      ReadLn(T, Linha);

      try
        Inc(iNumReg);

        if QryTxtNODOCUMENTO.AsFloat = 0 then
          raise EIntegraSafError.Create('Nº do documento não informado no arquivo de Origem. "')
          //sConsDocumento :=': Doc Nº "A ser gerado na inclusão" - ' + QryTxtRECPAG.AsString + ' / ForCli: ' + QryTxtIDFORCLI.AsString + ' - Registro Nº ' + IntToStr(iNumReg)
        else
          sConsDocumento := ': Doc Nº ' + QryTxtNODOCUMENTO.AsString + ' - ' + QryTxtRECPAG.AsString + ' / ForCli: ' + QryTxtIDFORCLI.AsString + ' - Registro Nº ' + IntToStr(iNumReg);

        //Verifica se o histórico está liberado para importação
        If QryTxtCODTIPRECDES.AsString <> '' Then
        Begin
           QryHistoricoSaf.Close;
           QryHistoricoSaf.ParamByName('IDHISTORICOSAF').AsFloat := QryTxtCODTIPRECDES.AsFloat;
           QryHistoricoSaf.Open;

           If Not QryHistoricoSaf.IsEmpty Then
              If QryHistoricoSafFLGBLOQUEADO.AsString = 'S' Then
                 raise EIntegraSafError.Create('Histórico Nº ' + QryTxtCODTIPRECDES.AsString + ' Bloqueado Para Importação ');

           QryHistoricoSaf.Close;
        End;

        //Se o documento existir na query ele é excluído. Os Documentos existentes na Query que não foram excluídos
        //não constam no arquivo de importação no período informado, logo foram excluídos no sistema de origem e serão
        //excluídos no fina do processo;
        If QryDocsOpen.Locate('NODOCUMENTO;COMPLDOCUMENTO', VarArrayOf([QryTxtNODOCUMENTO.AsFloat,Modulo.ComplDocumento]), [] ) Then QryDocsOpen.Delete;

        //Busca o Número da AP do TotalPrev caso exista não lança o documento pois
        //Já está lançado no TotalPrev.
        if QryTxtNUMAP.AsFloat = 0 then
        begin
          // 1) Verifica a Existência do Favorecido: Busca o código correspondete na
          //    ClientePess Para 'R' e FornServ 'P'.
          //    Caso não exista insere o pessoa
          //    Caso exista na insere na ClientePess e EmpresaCliente para 'R' ou
          //    FornServ e EmpresaForn para 'P'

          IdForcli := 0;
          IdFor := 0;
          IdCli := 0;
          
          //Busca Cliente Pelo Código Correspondente
          with QryBuscaCliente do
          begin
            if Active then CLOSE;
            if not Prepared then Prepare;
            ParamByName('CODCORRESP').AsString := QryTxtIDFORCLI.AsString;
            OPEN;
            if not IsEmpty then
            begin
              IdCli := QryBuscaClienteIDPESSOA.AsInteger;
              IdForcli := QryBuscaClienteIDPESSOA.AsInteger;
            end;
            
            CLOSE;
          end;
          
          //BusCa Fornecedor Pelo Código Correspondente
          with QryBuscaFornecedor do
          begin
            if Active then CLOSE;
            if not Prepared then Prepare;
            ParamByName('CODCORRESP').AsString := QryTxtIDFORCLI.AsString;
            OPEN;
            if not IsEmpty then
            begin
              IdFor := QryBuscaFornecedorIDPESSOA.AsInteger;
              IdForcli := QryBuscaFornecedorIDPESSOA.AsInteger;
            end;
            CLOSE;
          end;

          //Alterado em 17/11/2000 Solicitado Pelo Darcy.
          //Insere o Pessoa Caso não exista forcli correspondente
          //Try
          //StartTransacao;
          
          if (IdForcli = 0) then
            raise EIntegraSafError.Create('Registro de Pessoa não existe no TotalPrev: "' + QryTxtNOME.AsString + '"');
          //IdForcli := Documento.ForCli.CriaPessoa(QryTxtNOME.AsString,QryTxtNOME.AsString,TiraMascara(QryTxtNUMDOCUMENTO.AsString));
          
          //If IdForcli < 0 Then
          //   Raise EIntegraSafError.Create('Erro Ao Inserir Pessoa "' + QryTxtNOME.AsString + '"');

          if (UpperCase(QryTxtRECPAG.AsString) = 'P') and
            (IdFor = 0) then
          begin
            raise EIntegraSafError.Create('Registro de Fornecedor não existe no TotalPrev: "' + QryTxtNOME.AsString + '"');

            {If Not Documento.ForCli.Inserir(IdForcli,Sistema.IdEmpresa,-1,IntegraBack.Plano,Modulo.IdRamoForn,Sistema.IdEmpresa,
                       '','','','','F',false) Then
                       Raise EIntegraSafError.Create('Erro Ao Inserir Fornecedor "' + QryTxtNOME.AsString + '"');
                        
                    If Not ExecutarQuery(Qry,'UPDATE FORNSERV SET CODCORRESP = ' + QryTxtIDFORCLI.AsString + ' WHERE IDPESSOA = ' + FloatToStr(IdForcli)) Then
                       Raise EIntegraSafError.Create('Erro Ao Atualizar Código Correspondente do Fornecedor "' + QryTxtNOME.AsString + '"');}
          end;

          if (UpperCase(QryTxtRECPAG.AsString) = 'R') and
            (IdCli = 0) then
          begin
            raise EIntegraSafError.Create('Registro de Cliente não existe no TotalPrev: "' + QryTxtNOME.AsString + '"');

            {If Not Documento.ForCli.Inserir(IdForcli,Sistema.IdEmpresa,-1,IntegraBack.Plano,Modulo.IdTipoCliente,Sistema.IdEmpresa,
                       '','','','','C',false) Then
                       Raise EIntegraSafError.Create('Erro Ao Inserir Clienete "' + QryTxtNOME.AsString + '"');

                    If Not ExecutarQuery(Qry, 'UPDATE CLIENTEPESS SET CODCLIENTE = ' + QryTxtIDFORCLI.AsString + ' WHERE IDPESSOA = ' + FloatToStr(IdForcli)) Then
                       Raise EIntegraSafError.Create('Erro Ao Atualizar Código Correspondente do Cliente "' + QryTxtNOME.AsString + '"');}
          end;
          
          //CommitTransacao;
          //Except
          //     On E: Exception Do
          //        Raise EIntegraSafError.Create(E.Message);
          //End;
          
          StartTransacao;
          
          // 2) Verifica se o número do documento já foi incluso
          // If QryTxtNODOCUMENTO.AsFloat = 0.00 Then
          // Begin
          //   QryTxt.Edit;
          //   QryTxtNODOCUMENTO.AsFloat := Now;
          //   QryTxt.Post;
          // End;
          
          if Documento.ValidaNumDoc(nil, QryTxtRECPAG.AsString, IdForcli, QryTxtNODOCUMENTO.AsFloat, Modulo.ComplDocumento,
            OldCodDocumento, OldSubConta, OldPlano, OldPlaConta, OldCentCusto) then
          begin
            //Verifica A Existência do Relacionamento de Histórico X Tipo ALterador e Lança o Alterador
            //Caso Contrário Gera Erro

            with QryBuscaValorDoc do
            begin
              if Active then CLOSE;
              if not Prepared then Prepare;
              Params[0].AsFloat := OldCodDocumento;
              Params[1].AsFloat := (QryTxtVALOR.AsFloat / 100);
              OPEN;
            end;
            
            if QryBuscaValorDoc.IsEmpty then
            begin
              if QryTxtCODTIPRECDES.AsString = '' then
                raise EIntegraSafError.Create('Histórico não informado para lançamento de Alterador')
              else
              begin
                if QryBuscaAlterador.Active then QryBuscaAlterador.CLOSE;
                if not QryBuscaAlterador.Prepared then QryBuscaAlterador.Prepare;
                QryBuscaAlterador.Params[0].AsFloat := QryTxtCODTIPRECDES.AsFloat;
                QryBuscaAlterador.OPEN;
                
                if QryBuscaAlterador.IsEmpty then
                  raise EIntegraSafError.Create('Histórico "' + QryTxtCODTIPRECDES.AsString + '"sem relacionamento com Alterador no sistema CM')
                else
                begin
                  //Lança Alterador caso exista o relacionamento com o histórico
                  NumLancto := Documento.GerarNumLancto(nil, CodDocumento);
                  PlnCodigo := -1;
                  
                  Documento.CriarLanctoDoc(Qry, OldCodDocumento, NumLancto, QryBuscaAlteradorCODALTERADOR.AsInteger,
                    PlnCodigo, QryTxtDATAVENCTO.AsString, (QryTxtVALOR.AsFloat / 100),
                    0, - 1, QryBuscaAlteradorACRESDECRES.AsString, '4', HISTCOMPL, Sistema.IdUsuario, False, - 1, '');
                end;
              end;
            end
            else
              QryBuscaValorDoc.CLOSE;
          end
          else
          begin
            //3) Verifica a Existência do Tipo de Desembolso e da Conta a crédito no mesmo
            //   Pelo Código Correspondente
            //   Caso não exista gera log solicitando DE-PARA
            with QryTipoRecebDesemb do
            begin
              if Active then CLOSE;
              if not Prepared then Prepare;
              ParamByName('CODCORRESP').AsString := QryTxtCODTIPRECDES.AsString;
              ParamByName('RECPAG').AsString := QryTxtRECPAG.AsString;
              ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
              OPEN;
              if not IsEmpty then
              begin
                CodTipRecDes := QryTipoRecebDesembCODTIPRECDES.AsString;
                ContaCredito := QryTipoRecebDesembPLACONTACREDITO.AsString;
                iPlano := QryTipoRecebDesembPLANO.AsInteger;
              end
              else
              begin
                CLOSE;
                if QryTxtRECPAG.AsString = 'P' then
                  raise EIntegraSafError.Create('Tipo de Desembolso "' + QryTxtCODTIPRECDES.AsString + '" não possui um correspondente ')
                else
                  raise EIntegraSafError.Create('Tipo de Recebimento "' + QryTxtCODTIPRECDES.AsString + '" não possui um correspondente ');
              end;

              CLOSE;

              if Trim(ContaCredito) = '' then
              begin
                if (UpperCase(QryTxtRECPAG.AsString) = 'P') then
                begin
                  with QryBuscaCCForn do
                  begin
                    if Active then CLOSE;
                    if not Prepared then Prepare;
                    ParamByName('IDFORCLI').AsFloat := IdForcli;
                    ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
                    OPEN;
                  end;
                  
                  if IsEmpty then
                    ContaCredito := QryBuscaCCFornCONTACFORN.AsString;
                end
                else
                begin
                  with QryBuscaCCCli do
                  begin
                    if Active then CLOSE;
                    if not Prepared then Prepare;
                    ParamByName('IDFORCLI').AsFloat := IdForcli;
                    ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
                    OPEN;
                  end;
                  
                  if IsEmpty then
                    ContaCredito := QryBuscaCCCliCONTACCLIENTE.AsString;
                end;
              end;
              
              if Trim(ContaCredito) = '' then
                raise EIntegraSafError.Create('Conta Crédito não informada ( ForCli CM = "' + IntToStr(IdForcli) + '" ) ');
            end;
            
            //4) Verifica a Existência do Centro de Custo e Do Centro de Responsabilidade
            //   Informados em 'Departamento' no campo QryTxtCODCENTRORESPON.Text
            //   Caso não exista gera log solicitando DE-PARA
            CCusto := '';
            with QryCentCusto do
            begin
              if Active then CLOSE;
              if not Prepared then Prepare;
              ParamByName('CODCORRESP').AsString := QryTxtCODCENTRORESPON.AsString;
              ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
              OPEN;
              if not IsEmpty then
                CCusto := QryCentCustoCODCENTROCUSTO.AsString
              else
              begin
                CLOSE;
                raise EIntegraSafError.Create('Centro de Custo "' + QryTxtCODCENTRORESPON.AsString + '" não possui um correspondente, está desativado ou é sintético ');
              end;

              CLOSE;
            end;
            
            with QryCentRespon do
            begin
              if Active then CLOSE;
              if not Prepared then Prepare;
              ParamByName('NOME').AsString := QryTxtCODCENTRORESPON.AsString;
              ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
              OPEN;
              if not IsEmpty then
                CRespon := QryCentResponCODCENTRORESPON.AsString
              else
              begin
                CLOSE;
                raise EIntegraSafError.Create('Centro de Responsabilidade "' + QryTxtCODCENTRORESPON.AsString + '" não possui um correspondente, está desativado ou é sintético  ');
              end;
              
              CLOSE;
            end;
            

            //5) Busca do Parâmetro do Sistema
            
            if QryTxtRECPAG.AsString = 'P' then
              CodTipDoc := Modulo.CodTipDocP
            else
              CodTipDoc := Modulo.CodTipDocR;
            
            if CodTipDoc = 0 then
              raise EIntegraSafError.Create('Tipo de Documento Para Importação não Informado');
            
            //6) Caso a conta contábil obrigue subconta busca a do parâmetro do sistema
            {With QryObrigaSubConta Do
                Begin
                   If Active Then Close;
                   If Not Prepared Then Prepare;
                   ParamByName('PLANO').AsFloat := iPlano;
                   ParamByName('PLACONTA').AsString := ContaCredito;
                   Open;
                   If (Not IsEmpty) And
                      (QryObrigaSubContaPLASUBCONTA.AsString = 'S') Then
                   Begin
                      If Modulo.CodSubConta = 0 Then
                         Raise EIntegraSafError.Create('A Conta A Crédito "'  +  ContaCredito + '" Obriga Subconta. Favor Informar Nos Parâmetros do Sistema ou no cadastro do Fornecedor/Cliente')
                      Else 
            CodSubConta := Modulo.CodSubConta
                      end
            else
              CodSubConta := 0;

              CLOSE;
            end;  }

            //7) Verfica a existência dos dados bancários do favorecido (Somente para 'P')
            //   Caso não existam são gravados na tabela contacorrente
            //   Também é inserida o banco, agência
            //   Nota: Informar o Número do Banco ao Invés do Nome
            {if (QryTxtRECPAG.AsString = 'P') and
               (QryTxtNUMBANCO.AsString <> '') and
               (QryTxtCONTACORRENTE.AsString <> '') and
               (QryTxtNUMAGENCIA.AsString <> '') then
            begin
              with QryBuscaDadosBanco do
              begin
                if Active then CLOSE;
                if not Prepared then Prepare;
                ParamByName('NUMBANCO').AsString := QryTxtNUMBANCO.AsString;
                ParamByName('NUMAGENCIA').AsString := QryTxtNUMAGENCIA.AsString;
                ParamByName('CONTACORRENTE').AsString := QryTxtCONTACORRENTE.AsString;

                Open;

                if IsEmpty then
                begin
                  idbanco := Documento.ForCli.CriaPessoa('Banco Nº: ' + QryTxtNUMBANCO.AsString, 'Banco Nº: ' + QryTxtNUMBANCO.AsString, '');
                  idAgencia := Documento.ForCli.CriaPessoa('Agência Nº: ' + QryTxtNUMAGENCIA.AsString, 'Agência Nº: ' + QryTxtNUMAGENCIA.AsString, '');

                  if (idbanco > 0) then
                  begin
                    QryInsBanco.ParamByName('IDPESSOA').AsFloat := idbanco;
                    QryInsBanco.ParamByName('NUMBANCO').AsString := QryTxtNUMBANCO.AsString;
                    QryInsBanco.ParamByName('FLGVALIDACC').AsString := 'N';

                    try
                      QryInsBanco.ExecSql;
                    except
                      on E: Exception do
                          raise EIntegraSafError.Create('Erro Ao Inserir Banco Nº: ' + QryTxtNUMBANCO.AsString + (#13 + #10) + E.message);
                    end;


                    if (idAgencia > 0) then
                    begin
                      QryInsAgencia.ParamByName('IDPESSOA').AsFloat := idAgencia;
                      QryInsAgencia.ParamByName('IDBANCO').AsFloat := idbanco;
                      QryInsAgencia.ParamByName('NUMAGENCIA').AsString := QryTxtNUMAGENCIA.AsString;
                      try
                        QryInsAgencia.ExecSql;
                      except
                        on E: Exception do
                            raise EIntegraSafError.Create('Erro Ao Inserir Agência Bancária Nº: ' + QryTxtNUMAGENCIA.AsString + (#13 + #10) + E.message);
                      end;
                    end
                    else
                      raise EIntegraSafError.Create('Erro Ao Inserir Pessoa Referente A Agência Bancária Nº: ' + QryTxtNUMAGENCIA.AsString);
                  end
                  else
                    raise EIntegraSafError.Create('Erro Ao Inserir Pessoa Referente Ao Banco Nº: ' + QryTxtNUMBANCO.AsString);
                end;
              end;
            end;}

            //8) Verfica a existência dos dados de endereço para o favorecido (IdForCli)
            //   Caso não existam são gravados na tabela endpess como endereço de cobrança

            //9) Os Documento são lançados > Sem Contabilização

            DebCre := Documento.BuscaDebCre(CodTipDoc);

            CodDocumento := Documento.GetCodigo(nil);

            //FuncaoGeral.DECODE(QryTxtRECPAG.AsString, 'P', 3, 4)

            Documento.Inserir(nil, CodDocumento, IntToStr(Sistema.IdModulo), IntToStr(iPlano),
              ContaCredito, CCusto, - 1, - 1, Sistema.IdEmpresa, IdForcli, CodTipDoc,
               - 1, QryTxtRECPAG.AsString, QryTxtNODOCUMENTO.AsFloat, Modulo.ComplDocumento, QryTxtDATALANCTO.AsString,
              QryTxtDATAVENCTO.AsString, QryTxtDATAVENCTO.AsString, '0', - 1, '2', Sistema.IdUsuario,
              CodSubConta, - 1, '', '', False, 0, 0, - 1);

            NumLancto := Documento.GerarNumLancto(nil, CodDocumento);
            PlnCodigo := -1;

            Documento.CriarLanctoDoc(Qry, CodDocumento, NumLancto, - 1, PlnCodigo, QryTxtDATAVENCTO.AsString, (QryTxtVALOR.AsFloat / 100),
              0, - 1, DebCre, '2', HISTCOMPL, Sistema.IdUsuario, False, - 1, '');
            
            with QryPlanopatro do
            begin
              if Active then CLOSE;
              if not Prepared then Prepare;
              ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
              ParamByName('NUMEMPRESA').AsFloat := QryTxtNUMEMPRESA.AsFloat;
              OPEN;
              
              if IsEmpty then
                raise EIntegraSafError.Create('Relacionamento Empresa "' + QryTxtNUMEMPRESA.AsString + '" X PLano Patrocinadora Não Cadastrado em "Parâmetros do Sistema"')
              else
              begin
                iPlanoSAF := QryPlanopatroIDPLANOPREV.AsInteger;
                iPatroSAF := QryPlanopatroIDPATRO.AsInteger;
              end;
            end;

            Documento.Rateio.Inserir(CodDocumento, CodTipRecDes, QryTxtRECPAG.AsString, CRespon,
              Sistema.IdEmpresa, (QryTxtVALOR.AsFloat / 100), 0, Sistema.IdUsuario, - 1, - 1, CCusto,
              iPatroSAF,
               - 1, iPlanoSAF);
          end;

          CommitTransacao;
          Inc(CountDocsImportados);
        end
        Else
           raise EIntegraSafError.Create('AP Nº ' + QryTxtNUMAP.AsString + ' Já Lançada no sistema TotalPrev"')
      except
        on E: Exception do
          begin
            lstAux.Add(Linha);
            RollbackTransacao;
            Modulo.GravaLog(E.message + sConsDocumento);
          end;
      end;
      QryTxt.Next;
    end;

    //Se o documento existir na query ele é excluído. Os Documentos existentes na Query que não foram excluídos
    //não constam no arquivo de importação no período informado, logo foram excluídos no sistema de origem e serão
    //excluídos no fina do processo;
    QryDocsOpen.First;
    While Not QryDocsOpen.Eof Do
    Begin
       sMens := ExcluirDoc;
       Inc(CountDocsExcluidos);
       If sMens <> '' Then
       Begin
          lstAux.Add(sMens);
          Modulo.GravaLog(sMens);
       End;
       QryDocsOpen.Next;
    End;

    DeleteFile(Modulo.DirArquivo + 's.cm');
    CloseFile(T);
    lstAux.SaveToFile(Modulo.DirLog + 'Contasprlog.txt');

    lstAux.Free;
    FuncaoGeral.FechaQry([QryTxt,QryDocsOpen],false,True);

    Modulo.GravaLog('Período Analisado: ' + sPerDataIni + ' até ' + sPerDataFin);
    Modulo.GravaLog('Total de Registros: ' + IntToStr(CountDocsAnalizados));
    Modulo.GravaLog('Registros Analisados Com Sucesso: ' + IntToStr(CountDocsImportados));
    Modulo.GravaLog('Registros Excluídos: ' + IntToStr(CountDocsExcluidos));
  except
    on E: Exception do
      begin
        DeleteFile(Modulo.DirArquivo + 's.cm');
        lstAux.Free;
        FuncaoGeral.FechaQry([QryTxt,QryDocsOpen],false,True);
        Modulo.GravaLog(E.message);
        CloseFile(T);
      end;
  end;
end;


function TDtmIntegraSaf.TiraMascara(sString: string): string;
var sAux: string;
begin
  sAux := Trim(sString);
  while Pos('.', sAux) <> 0 do
    Delete(sAux, Pos('.', sAux), 1);

  while Pos('/', sAux) <> 0 do
    Delete(sAux, Pos('/', sAux), 1);

  while Pos('-', sAux) <> 0 do
    Delete(sAux, Pos('-', sAux), 1);

  Result := sAux;
end;

Function TDtmIntegraSaf.ExcluirDoc:String;
Var
  liRetFuncao,iCodLancCAPCAR, iPlnCodigoOri :Integer;
  sDataLancamento :String;
  ExcImpostoRetido :TImpostoRetido;
Begin
  ExcImpostoRetido := TImpostoRetido.Create;
  try
    StartTransacao;

    iCodLancCAPCAR := QryDocsOpenCODDOCUMENTO.AsInteger;
    iPlnCodigoOri := QryDocsOpenPLNCODIGO.AsInteger;
    sDataLancamento := QryDocsOpenDATALANCTO.AsStrIng;

    ExcImpostoRetido.CodDocumento      := iCodLancCAPCAR;
    ExcImpostoRetido.NumLancto         := 0;
    ExcImpostoRetido.ExcluiAlteradores := True;
    ExcImpostoRetido.Excluir;

    Documento.Excluir(QryExcDoc,iCodLancCAPCAR,0);

    if iCodLancCAPCAR = -1 then
    begIn
       iCodLancCAPCAR:=QryDocsOpenCODDOCUMENTO.AsInteger;
       raise EIntegraSafError.Create('Não Foi Possível Excluir Documento ');
    end;

    if iPlnCodigoOri <> 0 then
       liRetFuncao := ExcluiLanc(True,iPlnCodigoOri,'BASEDADOS',
                      IntToStr(Sistema.IdModulo),
                      IntegraBack.Plano,
                      Sistema.IdEmpresa,
                      Sistema.IdUsuario,
                      true,
                      0,
                      IntegraBack.MascaraPlano);

    if liRetFuncao < 0 then  raise EIntegraSafError.Create('Não Foi Possível Excluir Lançamentos Contábeis Para o Documento ');

    CommitTransacao;
    ExcImpostoRetido.Free;    
    Result := '';
  except
    On E:EIntegraSafError Do
    Begin
      RollBackTransacao;
      Result := E.message + 'Nº ' + QryDocsOpenNODOCUMENTO.AsString;
      ExcImpostoRetido.Free;
    End;
  end;
End;

end.

