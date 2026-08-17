//***************************************************************************************
//Atender   : WO28309
//Data      : 17/12/2025
//Autor     : Paulo Nobre
//Descrição : Ajustes necessários para garantir a gravação correta dos campos BLOBs.
//---------------------------------------------------------------------------------------
//Rotina.............: ProcessaBloqueteCobranca 
//N. SIG.............: 63651
//Data da Alteração..: 25/10/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequações para leitura de arquivo no convênio SIACC.
//***************************************************************************************
{-------------------------------------------------------------------------------
// Data      : 12/03/2018
// Autor     : Everson Luiz Pereira da Cunha
// SIG       : SIG TIBERO
// Descrição : Melhoria em adequação ao TIBERO.
               Inserir alias nas tabelas e campos.
               Retirar INDEX, +rule, etc
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 28/01/2016
// Autor     : Fernando Xavier
// Sol       : 268590
// PPM       : 1264334
// Descrição : Erro na impressão de bloquetos
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 11/01/2016
// Autor     : Peterson Victor
// Sol       : 247490
// PPM       : 1204495
// Descrição : Alteração da função para melhorar a  performance
 -----------------------------------------------------------------------------

// Rotinas   : GetDocsEmissao
// Data      : 10/12/2015
// Autor     : Peterson Victor
// Sol       : 265893
// PPM       : 1199112
// Descrição : Correção da query para retornar dados
 -----------------------------------------------------------------------------

// Rotinas   : GetDocsEmissao
// Data      : 17/11/2015
// Autor     : Helio Lima Custodio
// Sol       : 253577/17906
// PPM       : 1163500
// Descrição : Correção o e-mail utilizado para envio, deve ser o campo
               EMAILFUNCEF  da tabela PessoaFisica.
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 08/07/2015
// Autor     : Helio Lima Custodio
// Sol       : 253577/17359
// PPM       : 842402
// Descrição : Inclusão de IDPESSOA e EMAIL na consulta.
 -----------------------------------------------------------------------------
// Rotinas   : GetDadosCedente
// Data      : 26/11/2013
// Autor     : William Santana
// Sol/KTN   : 208257.15307/2050609
// Descrição : AJUSTE NA QUERY PARA EMISSÃO DE FICHA DE COMPENSAÇÃO.
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 12/12/2012
// Autor     : Higor Nayde Ferreira
// Sol/KTN   : 196541/1882213
// Descrição : Liberar Impresão para todos os Usuarios
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 23/07/2012
// Autor     : Edilaine Ferraresi
// Sol/KTN   : 178674/1726751
// Descrição : melhorar performance da query
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 26/06/2012
// Autor     : Otacilio Aquino
// Sol       : 178674.10282
// Kintana   : 1708253
// Descrição : Inclusão dos Filtro na consulta SQL .
 -----------------------------------------------------------------------------
// Rotinas   : GetDocsEmissao
// Data      : 31/05/2010
// Autor     : Arnaldo V. Scarin
// Sol/KTN   : 132569/767550
// Descrição : Inclusão de Filtro para que os documentos filhos não sejam enviados
//             no arquivo de lote.
 -----------------------------------------------------------------------------
// Rotinas   : GetDocumentos
// Data      : 07/04/2005
// Autor     : Andre Tavares
// Pendência : 22079
// Descrição : criei o parâmetro coddocumento para buscar somente um documento em particular
//------------------------------------------------------------------------------

// andre tavares - pendencia 22455 26/05/2006 - as Queries que selecionam os documentos
//para emissao  de boletos e arquivos intbanco agora estão no novo métosdo getdocsEmissao, criei ainda o método
// PodeEmitirDocGrupado que define se há documentos agrupados com algum campo do filtro na tela diferente.

// Atualização: Andre Tavares - pendência 16555 - 05/05/2004
//              Andre Tavares - 21/12/2004 - pendencia 17884
//              Andre Tavares - 28/03/2005 - pendência 18844
}

Unit uCtrlParamBloqueteCobranca;

{-------------------------------------------------------------------------------
Analista : Alex Pereira
Data     : 15/04/04
Pendência: 14671
Descrição: Trocar a CMIntBanco50 para CMIntBancoMT50. Com auxílio do Tavares
-------------------------------------------------------------------------------}

Interface

Uses Forms, Dialogs, Windows, classes, Controls, sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes, stdctrls,
  uCtrlIntBanco, uCmDialogs, uIntBancoManager, ucmfileUtils, uSistema;

Type
  TCtrlParamBloqueteCobranca = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    CtrlIntBanco: TCtrlIntBanco;
    RgAceiteItemIndex, DbLcPortadorLookupValue, ModuloModeloImpressora, GridCobrGetActiveRow: integer;
    RedJurosValue: Double;
    MemoBloq: TMemo;
    ModuloImpressoraDefault, mensagembarras, EdLocalPagtoText,
      DbLcPortadorText, DataIniText: String;
    CdsBanco, CdsLocalBloquete, CdsEmitidos: TClientDataSet;
    //Prepara Bloqueto para serem impressos de acordo com a opção do usuario
    Function PreparaBloquetos(CodBloqCheIsNull, BloqueteIsEmpty, ImprimeBloquete: Boolean): Boolean;
    //Prepara Cobrança para ser emitida de acordo com a opção do usuario
    Function PreparaCobranca(CodArquivoRemessaIsNull, BloqueteIsEmpty: Boolean; RgOrigemItemIndex, RgNossNumItemIndex: Integer): Boolean;
    //Imprime bloqueto, a partir da seleção do portador forma
    Function ImprimeBloquete: Boolean;
    //Procedimentos para montar SQL do arquivo de remessa e chamar o form de parâmetros
    //da DPL CobrançaEletrônica
    Procedure EnviaNovaRemessa(pGeraNossoNum: Boolean);
    //Monta SQL do Grid de Documentos emitidos
    Function AtualizaQryEmitidos(bVazio: Boolean): Boolean;
    //ReGera arquivo de remessa
    Procedure EnviaRemessaSelecionada;
    //Retorna o número do arquivo remessa, tanto para nova remessa quanto para remessa selecionada
    Function NumRemessaDia(NovaRemessa: Boolean): Integer;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function ProcessaBloqueteCobranca(bnomeArquivo, bEmissBloq, bEmissCobr: Boolean; ovBanco, ovBloquete, ovEmitidos: OleVariant;
      iCODPORTFORMA, RgOrigemItemIndex, RgNossNumItemIndex, pRgAceiteItemIndex, pGridCobrGetActiveRow: integer;
      pRedJurosValue: Double; pMemoBloq: TMemo; pModuloImpressoraDefault: String;
      pModuloModeloImpressora: Integer; pmensagembarras, pEdLocalPagtoText, pDbLcPortadorText, pDataIniText: String;
      listadocs: tstringlist; iIdEmpresa: Integer; sRecPag: String): Boolean;

    //andre tavares - pendencia 22455 26/05/2006
    Function GetDocsEmissao(const idpessoa: int64; const idusuario: int64; const pemisbloq: string;
                            const idmodulo: int64 = 0; const pcontroleremessa: int64 = 0; const pcodportforma: int64 = 0;
                            const idtipocliente: int64 = 0; const bUsuarioLogado: boolean = true;    //Paulo WO28309
                            const codtipdoc: int64 = 0; const coddocumento: integer = 0;
                            // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                            dataprogramadaini: string = '';
                            dataprogramadafim: string = ''): olevariant;
                            // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
    //andre tavares - pendencia 22455 26/05/2006
    function PodeEmitirDocGrupado(const pemisbloq: boolean;      const pcodportforma: int64;
                                  const pIdUusario: integer;     const pIdModulo: integer;
                                  const pidTipoCliente: integer; const pcodtipoDoc: integer): boolean;

    function GetDadosCedente():olevariant; //William Santana SOL 208257.15307  KIN 2050609

  End;

Implementation

Uses
  FSelBloquetoCobranca, FAlteraDocEmitidosMT,
  uCheqBloqMT, FConfigBarrasCMMT,
  FCobrRemessaItauMT, uCPFCNPJ, fTelaAut;

{ TCtrlAlteraVenc }

Procedure TCtrlParamBloqueteCobranca.AfterInitialize;
Begin
  Inherited;
  CtrlIntBanco.InitializeAs(Self);
  CtrlIntBanco.OpenTransaction := false;
End;

Function TCtrlParamBloqueteCobranca.ProcessaBloqueteCobranca(bnomeArquivo, bEmissBloq, bEmissCobr: Boolean;
  ovBanco, ovBloquete, ovEmitidos: OleVariant; iCODPORTFORMA, RgOrigemItemIndex, RgNossNumItemIndex, pRgAceiteItemIndex,
  pGridCobrGetActiveRow: integer;
  pRedJurosValue: Double; pMemoBloq: TMemo; pModuloImpressoraDefault: String;
  pModuloModeloImpressora: Integer; pmensagembarras, pEdLocalPagtoText, pDbLcPortadorText, pDataIniText: String;
  listadocs: tstringlist; iIdEmpresa: Integer; sRecPag: String): Boolean;
Var
  bConfirmaEmissao, bEspera: Boolean;
  sOrdemDeCriacao, sSql: String;
  fOldPortForma, i: integer;
  fdiasprotesto, fControleRemessa: Double;
  cdsAux : TclientDataSet; // andre tavares - pendência 18844
  bSiacc: Boolean;

  procedure _MostraArquivo(sNomeArquivo : String);
  begin
    If Application.MessageBox(Pchar('Deseja visualizar o arquivo ' + (#13+#10) + sNomeArquivo + '?'),'Atenção',Mb_IconQuestion + Mb_YesNo) = Id_Yes Then
      ShellExecuteFile(sNomeArquivo,'','',SW_SHOW);
  end;

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.AlteraVencimento;
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      bSiacc := False; //Cássio Rovaroto - SIG nº 63651
      CdsBanco.Data := ovBanco;
      CdsBanco.Locate('CODPORTFORMA', iCODPORTFORMA, []);
      CdsLocalBloquete.Data := ovBloquete;
      CdsEmitidos.Data := ovEmitidos;
      RgAceiteItemIndex := pRgAceiteItemIndex;
      RedJurosValue := pRedJurosValue;
      MemoBloq := pMemoBloq;
      ModuloImpressoraDefault := pModuloImpressoraDefault;
      ModuloModeloImpressora := pModuloModeloImpressora;
      mensagembarras := pmensagembarras;
      EdLocalPagtoText := pEdLocalPagtoText;

      DbLcPortadorLookupValue := iCODPORTFORMA;
      DbLcPortadorText := pDbLcPortadorText;
      DataIniText := pDataIniText;
      GridCobrGetActiveRow := pGridCobrGetActiveRow;

      StartTransacao;

      //inicio andre tavares - pendência 18844 - 28/03/2005
      cdsAux := TclientDataSet.Create(nil);

      // andré tavares - pendência 19308 - comentei o código acima e escrevi a linha abaixo, por algum motivo está dando erro de sql na FCRT.
      cdsAux.Data := getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + intToStr(iCODPORTFORMA) + ' FOR UPDATE ');
      IntBancoManager.NossoNumero := cdsAux.fieldByName('NOSSONUMERO').asString;
      cdsAux.free;
      //fim - andre tavares - pendência 18844 - 28/03/2005

      CtrlIntBanco.mensagem1 := '';
      CtrlIntBanco.mensagem2 := '';
      CtrlIntBanco.mensagem3 := '';
      CtrlIntBanco.naogerararquivo := bnomeArquivo;
      CtrlIntBanco.IndiceDoBanco := CdsBanco.FieldByName('CodArquivoRemessa').AsInteger;
      If CtrlIntBanco.VerficaDadosEmpresa('R', DbLcPortadorLookupValue) And
        CtrlIntBanco.ValidaRemessa('R', CdsLocalBloquete.Data, False) Then
      Begin
        bConfirmaEmissao := False;
        If (bEmissCobr) And
          ((bEmissBloq) And
          (CdsBanco.FieldByName('IDCONFIGBARRAS').asInteger = 0)) Then
        Begin
          // Exibe Formulário para definição de ordem emissão da cobrança
          sOrdemDeCriacao := '';
          FrmSelBloquetoCobranca := TFrmSelBloquetoCobranca.Create(Application);
          If (FrmSelBloquetoCobranca.ShowModal = mrOk) And
            (FrmSelBloquetoCobranca.sOrdemDeCriacao.Text <> '') Then
          Begin
            sOrdemDeCriacao := FrmSelBloquetoCobranca.sOrdemDeCriacao.Text;
            If sOrdemDeCriacao = 'BA' Then //Bloqueto + Cobrança Eletrônica
            Begin
              bEmissBloq := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull,
                CdsLocalBloquete.IsEmpty, ImprimeBloquete);
              bEmissCobr := PreparaCobranca(CdsBanco.FieldByName('CodArquivoRemessa').IsNull,
                CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex);
              bConfirmaEmissao := (bEmissBloq And bEmissCobr);
            End
            Else If sOrdemDeCriacao = 'AB' Then //Cobrança Eletrônica + Bloqueto
            Begin
              bEmissCobr := PreparaCobranca(CdsBanco.FieldByName('CodArquivoRemessa').IsNull,
                CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex);
              bEmissBloq := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull,
                CdsLocalBloquete.IsEmpty, ImprimeBloquete);
              bConfirmaEmissao := (bEmissBloq And bEmissCobr);
            End
            Else If sOrdemDeCriacao = 'A' Then
              bConfirmaEmissao := PreparaCobranca(CdsBanco.FieldByName('CodArquivoRemessa').IsNull,
                CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex) //Cobranca
            Else If sOrdemDeCriacao = 'B' Then
              bConfirmaEmissao := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull,
                CdsLocalBloquete.IsEmpty, ImprimeBloquete); //Bloqueto
          End
          Else
            Exception.Create('Impressão\Geração de Boletos Cancelada pelo usuário.');
        End
        Else
        Begin
          If bEmissBloq And (CdsBanco.FieldByName('IDCONFIGBARRAS').asInteger = 0) Then
            bConfirmaEmissao := PreparaBloquetos((CdsBanco.FieldByName('CodBloqChe').asInteger = 0),
              CdsLocalBloquete.IsEmpty, ImprimeBloquete)
          Else
          Begin
            If bEmissCobr Then
            begin
              bConfirmaEmissao := PreparaCobranca((CdsBanco.FieldByName('CodArquivoRemessa').asInteger = 0),
                                  CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex)
            end
            Else
              Exception.Create('Impressão\Emissão de Cobranção cancelada pelo usuário');
          End;
        End;
        If bConfirmaEmissao Then
        Begin
          CdsLocalBloquete.First;

          While Not CdsLocalBloquete.Eof Do
          Begin
            If CdsLocalBloquete.FieldByName('FLGGRUPO').AsString = 'S' Then
              sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = ''S'', STATUS = ''1'' WHERE CODGRUPOCNAB = ' +
                CdsLocalBloquete.FieldByName('CODDOCUMENTO').AsString +
                ' AND RECPAG = ''R'' ' //andre tavares - pendência 22819 - 29/08/2006
            Else
              sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = ''S'', STATUS = ''1'' WHERE CODDOCUMENTO = ' +
                CdsLocalBloquete.FieldByName('CODDOCUMENTO').AsString +
                ' AND RECPAG = ''R'' '; //andre tavares - pendência 22819 - 29/08/2006

            ExecSql(sSql);
            CdsLocalBloquete.Next;
          End;

          fOldPortForma := DbLcPortadorLookupValue;

          Cdsbanco.Data := GetDataPacket('SELECT ' +
            '            PF.CODPORTFORMA,                    ' +
            '            PF.DESCRICAO,                       ' +
            '            PF.CODBLOQCHE,                      ' +
            '            PF.CODARQUIVOREMESSA,               ' +
            '            PF.NOSSONUMERO,                     ' +
            '            PF.JUROSPORDIA,                     ' +
            '            PF.PRAZOPROTESTO,                   ' +
            '            PF.NUMEMPRESABANCO,                 ' +
            '            PC.CONTROLEREMESSA,                 ' +
            '            PF.PATHARQUIVOREM,                  ' +
            '            C.FLGIMPCONDENSADO,                 ' +
            '            PF.IDCONFIGBARRAS,                  ' +
            '            PF.CODPORTADOR                      ' +
            '            FROM                                ' +
            '            PORTADORFORMA PF,                   ' +
            '            TEMPLBLOQCHEQUE C,                  ' +
            '            PORTADORCONTA PC                    ' +
            '            WHERE                               ' +
            '            PF.RECPAG = '''+ sRECPAG +'''And            ' +
            '            PF.CODBLOQCHE = C.CODBLOQCHE(+) And  ' +
            '            PF.IDPESSOA = '+ IntTostr(iIdEmpresa)+' And         ' +
            '            PC.CODPORTADOR = PF.CODPORTADOR      ' +
            '            ORDER BY                             ' +
            '            PF.DESCRICAO           ');
          Cdsbanco.Locate('CODPORTFORMA', fOldPortForma, []);
          DbLcPortadorLookupValue := fOldPortForma;

          fdiasprotesto := CdsBanco.FieldByName('PRAZOPROTESTO').AsFloat;

          If (Not CdsBanco.FieldByName('CONTROLEREMESSA').IsNull) And
            (Not CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull) Then
          Begin
            fControleRemessa := CdsBanco.FieldByName('CONTROLEREMESSA').AsFloat;

            AbrirForm(FrmConfigBarrasCMMT, TFrmConfigBarrasCMMT, False);
            FrmConfigBarrasCMMT.HabilitaImpressao(True);

            FrmConfigBarrasCMMT.edit1.Text := '';
            FrmConfigBarrasCMMT.edit2.Text := '';
            FrmConfigBarrasCMMT.edit3.Text := '';
            FrmConfigBarrasCMMT.edit4.Text := '';
            FrmConfigBarrasCMMT.edit5.Text := '';
            FrmConfigBarrasCMMT.edit6.Text := '';
            FrmConfigBarrasCMMT.edit7.Text := '';
            FrmConfigBarrasCMMT.edit8.Text := '';
            FrmConfigBarrasCMMT.tag := RgOrigemItemIndex;

            With FrmConfigBarrasCMMT Do
            Begin
              DsBloquete.DataSet := CdsBloqImpressos;
              If CdsBloqImpressos.Active Then
                CdsBloqImpressos.Close;
              SqlBloqImpressos.Prepare;

              If RgOrigemItemIndex = 0 Then
                SqlBloqImpressos.ParamByname('CONTROLEREMESSA').AsFloat := fControleRemessa
              Else
                SqlBloqImpressos.ParamByname('CONTROLEREMESSA').AsFloat := CdsEmitidos.FieldByName('CONTROLEREMESSA').AsFloat;

              controlerem := CdsEmitidos.FieldByName('CONTROLEREMESSA').Asinteger;
              FrmConfigBarrasCMMT.diasprotesto := fdiasprotesto;
              SqlBloqImpressos.ParamByname('CODPORTFORMA').AsFloat := fOldPortForma;
              SqlBloqImpressos.Open;
              CdsBloqImpressos.first;
              PORTFORMA := SqlBloqImpressos.ParamByname('CODPORTFORMA').ASINTEGER;
              While Not CdsBloqImpressos.eof Do
              Begin
                For i := 0 To listadocs.count - 1 Do
                Begin
                  If listadocs[i] = CdsBloqImpressos.fieldbyname('coddocumento').asstring Then
                    CdsBloqImpressos.delete;
                End;
                CdsBloqImpressos.next;
              End;
              CdsBloqImpressos.first;
              PnlDocsImpressos.Visible := True;
              PnlDocsImpressos.BringToFront;
              Caption := 'Impressão de Ficha de Compensação Referente a Remessa ' +
                SqlBloqImpressos.ParamByname('CONTROLEREMESSA').AsString;

              FrmConfigBarrasCMMT.CdsModelo.close;
              FrmConfigBarrasCMMT.SqlModelo.sql.clear;
              FrmConfigBarrasCMMT.SqlModelo.sql.add('SELECT IDCONFIGBARRAS, DESCCONFIGBARRAS, CARTEIRACOBR,' +
                'IDREPORTS, ORIGEMCM, NUMEROBANCO, CODMOEDA,' +
                ' TAMNOSSONUMERO  ' +
                '    FROM  CONFIGBARRAS where IDCONFIGBARRAS= ' + self.CdsBanco.FieldByName('IDCONFIGBARRAS').Asstring);
              FrmConfigBarrasCMMT.SqlModelo.open;
              If Not FrmConfigBarrasCMMT.CdsModelo.IsEmpty Then
              Begin
                CmbModelo.TEXT := FrmConfigBarrasCMMT.CdsModelo.FieldByName('DESCCONFIGBARRAS').AsString;
                FrmConfigBarrasCMMT.CmbModelo.LOOKUPVALUE := self.CdsBanco.FieldByName('IDCONFIGBARRAS').AsSTRING;
                CmbModelo.CloseUp(TRUE);
                TRATACMBMODELO;
                FrmConfigBarrasCMMT.DblcPortador.Text := self.CdsBanco.FieldByName('DESCRICAO').AsSTRING;
                FrmConfigBarrasCMMT.DblcPortador.LOOKUPVALUE := self.CdsBanco.FieldByName('CODPORTFORMA').AsSTRING;
                FrmConfigBarrasCMMT.DblcPortador.CloseUp(TRUE);
              End;
            End;
          End;
          AtualizaQryEmitidos(False);
        End;
      End;
      Commit;

      //Cássio Rovaroto - SIG nº 63651 - Início
      //If sistema.idModulo = 4 then
      //  _MostraArquivo(IntBancoManager.SNomeArquivo);
      if Sistema.IdModulo = 4 then
      begin
        if (CtrlIntBanco.IndiceDoBanco = 62) and (IntBancoManager.Impersonate) then
          bSiacc := True;

        _MostraArquivo(IntBancoManager.SNomeArquivo);

        if bSiacc then
          RevertToSelf;
      end;
      //Cássio Rovaroto - SIG nº 63651 - Fim

      Result := True;
    Except
      On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Constructor TCtrlParamBloqueteCobranca.Create;
Begin
  Inherited;
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.ExibeArquivoGerado   := true; // andre tavares - pendencia 17884 - 21/12/2004

  CdsBanco := TClientDataSet.Create(Nil);
  CdsLocalBloquete := TClientDataSet.Create(Nil);
  CdsEmitidos := TClientDataSet.Create(Nil);
End;

Destructor TCtrlParamBloqueteCobranca.Destroy;
Begin
  Inherited;
  CtrlIntBanco.Free;
  CdsBanco.Free;
  CdsLocalBloquete.Free;
  CdsEmitidos.Free;
End;

Procedure TCtrlParamBloqueteCobranca.DoChangeDataBase;
Begin
  Inherited;

End;

Procedure TCtrlParamBloqueteCobranca.OnCreateAppServer;
Begin
  Inherited;

End;

Function TCtrlParamBloqueteCobranca.PreparaBloquetos(CodBloqCheIsNull, BloqueteIsEmpty, ImprimeBloquete: Boolean): Boolean;
Begin
  Result := False;
  If Not CodBloqCheIsNull Then
    If Not BloqueteIsEmpty Then
      If ImprimeBloquete Then
        Result := (Application.MessageBox('Os Bloquetos foram impressos Corretamente ?', 'Atenção', Mb_YesNo + Mb_IconExclamation) =
          Id_Yes);
End;

Function TCtrlParamBloqueteCobranca.PreparaCobranca(CodArquivoRemessaIsNull, BloqueteIsEmpty: Boolean; RgOrigemItemIndex,
  RgNossNumItemIndex: Integer): Boolean;
Begin
  Result := False;
  If Not CodArquivoRemessaIsNull Then
  Begin
    //Valida Dados da Empresa Proprietária
    Case RgOrigemItemIndex Of
      0:
        If Not BloqueteIsEmpty Then
          Case RgNossNumItemIndex Of
            0: EnviaNovaRemessa(True);
            1: EnviaNovaRemessa(False);
          End;
      1: EnviaRemessaSelecionada;
    End;
    Result := True;
  End;

End;

Function TCtrlParamBloqueteCobranca.ImprimeBloquete: Boolean;
Var
  x: integer;
  CheqBloqCM: TCheqBloqCM;
  sAceite: String;
  Mensagem: Array[0..5] Of String;
Begin
  Result := True;
  Case RgAceiteItemIndex Of
    0: sAceite := 'S';
    1: sAceite := 'N';
  End;
  For X := 0 To 4 Do
    Mensagem[x] := '';
  If RedJurosValue <> 0 Then
  Begin
    For X := 1 To MemoBloq.Lines.Count - 1 Do
      Mensagem[x] := Copy(MemoBloq.Lines[x], 1, 40);
  End
  Else
    For X := 0 To MemoBloq.Lines.Count - 1 Do
      Mensagem[x] := Copy(MemoBloq.Lines[x], 1, 40);
  CheqBloqCM := TCheqBloqCM.Create(ModuloImpressoraDefault, ModuloModeloImpressora);
  Try
    CdsLocalBloquete.First;
    If CheqBloqCM.InicializaImpressora('Emissão de Bloquetos Para Cobrança') Then
    Begin
      CheqBloqCM.FonteCondensada := (CdsBanco.FieldByName('FLGIMPCONDENSADO').AsString = 'S');
      mensagembarras := '';
      While Not CdsLocalBloquete.Eof Do
      Begin
        If RedJurosValue <> 0 Then
        Begin
          Mensagem[0] :=
            'Cobrar R$ ' + Trim(
            FloatToStrF((CdsLocalBloquete.FieldByName('VALOR').AsFloat * RedJurosValue) / 100, ffnumber, 16, 2)) +
            ' por dia de atraso';
          mensagembarras := Mensagem[0];
        End;

        If Not CheqBloqCM.GeraCobr(
          CdsBanco.FieldByName('CodBloqChe').AsInteger,
          EdLocalPagtoText,
          CdsLocalBloquete.FieldByName('DataProgramada').AsString,
          CdsLocalBloquete.FieldByName('DataEmissao').AsString,
          CdsLocalBloquete.FieldByName('NoDocumento').AsString,
          '',
          sAceite,
          DateToStr(date),
          '',
          '',
          CdsLocalBloquete.FieldByName('MoeSigla').AsString,
          FloatToStrf(Abs(CdsLocalBloquete.FieldByName('VALOROM').AsFloat), ffnumber, 13, 2),
          '',
          FloatToStrF(Abs(CdsLocalBloquete.FieldByName('VALOR').AsFloat), ffNumber, 13, 2),
          CdsLocalBloquete.FieldByName('DataProgramada').AsString,
          CdsLocalBloquete.FieldByName('DataLimite').AsString,
          '',
          Mensagem[0],
          Mensagem[1],
          Mensagem[2],
          Mensagem[3],
          Mensagem[4],
          CdsLocalBloquete.FieldByName('Nome').AsString,
          CdsLocalBloquete.FieldByName('NumDocumento').AsString,
          CdsLocalBloquete.FieldByName('Logradouro').AsString,
          CdsLocalBloquete.FieldByName('Numero').AsString,
          CdsLocalBloquete.FieldByName('Complemento').AsString,
          CdsLocalBloquete.FieldByName('Bairro').AsString,
          CdsLocalBloquete.FieldByName('Cidade').AsString,
          CdsLocalBloquete.FieldByName('CodEstado').AsString,
          CdsLocalBloquete.FieldByName('CEP').AsString) Then
        Begin
          Result := False;
          abort;
        End;
        CdsLocalBloquete.Next;
      End;
      CheqBloqCM.Imprime;
    End;
    CheqBloqCM.Free;
  Except
    Result := False;
    CheqBloqCM.Free;
  End;
End;

Procedure TCtrlParamBloqueteCobranca.EnviaNovaRemessa(pGeraNossoNum: Boolean);
Var
  sUltNossoNumero,
  sUltCodArquivoGerado,
  sNossoNumero, sSql: String;
  iItemBanco: Integer;
Begin

  If pGeraNossoNum Then
    sNossoNumero := IntBancoManager.NossoNumero //andre tavares - pendencia 18844
  Else
    sNossoNumero := '0';


  iItemBanco := DbLcPortadorLookupValue;
  CtrlIntBanco.AtualizaDoc := True;
  CtrlIntBanco.MostraFormRemessa(
    CdsBanco.FieldByName('CodArquivoRemessa').AsInteger,
    NumRemessaDia(True),
    pGeraNossoNum,
    sNossoNumero,
    CdsBanco.FieldByName('PrazoProtesto').AsString,
    CdsBanco.FieldByName('JurosPorDia').AsString,
    CdsBanco.FieldByName('NumEmpresaBanco').AsString,
    IntToStr(CdsBanco.FieldByName('ControleRemessa').AsInteger),
    CdsBanco.FieldByName('PathArquivoRem').AsString,
    CdsLocalBloquete.Data,
    sUltNossoNumero,
    sUltCodArquivoGerado);

  If ((sUltNossoNumero <> '0') And (sUltCodArquivoGerado <> '0')) Or
    ((sUltNossoNumero = '0') And (sUltCodArquivoGerado <> '0')) Then
  Begin
    If pGeraNossoNum Then
    Begin
      sSql := ' Update PortadorForma Set NossoNumero = ' + sUltNossoNumero + ' , ControleRemessa = ' + sUltCodArquivoGerado +
        ' Where CodPortForma = ' + CdsBanco.FieldByName('CodPortForma').AsString;
      ExecSql(sSql);
    End;
    sSql := ' Update PortadorConta Set ControleRemessa = ' + sUltCodArquivoGerado +
      ' Where CodPortador = ' + CdsBanco.FieldByName('CodPortador').AsString;

    ExecSql(sSql);
    AtualizaQryEmitidos(False);
    DbLcPortadorLookupValue := iItemBanco;
  End;
End;

Function TCtrlParamBloqueteCobranca.AtualizaQryEmitidos(
  bVazio: Boolean): Boolean;
Var
  sSql: String;
Begin
  sSql := 'SELECT DISTINCT P.DESCRICAO, D.DATAREMESSA , D.CONTROLEREMESSA, P.CODPORTFORMA  ' +
    'FROM DOCUMENTO D , PORTADORFORMA P ' +
    'WHERE ';
  If bVazio Or ((DbLcPortadorText = '') And (DataIniText = '')) Then
    sSql := sSql + '(1=2)'
  Else
  Begin
    If (DbLcPortadorText <> '') Then
      sSql := sSql + ' (D.CODPORTFORMA = ' + CdsBanco.FieldByName('CODPORTFORMA').AsString + ') AND ';
    If (DataIniText <> '') Then
      sSql := sSql + ' (D.DATAREMESSA = TO_DATE(''' + DataIniText + ''',''DD/MM/YYYY'')) AND ';
    sSql := sSql + ' ( D.CODPORTFORMA = P.CODPORTFORMA ) AND ' +
      ' ( D.CONTROLEREMESSA IS NOT NULL) ' +
      ' ORDER BY P.DESCRICAO, D.DATAREMESSA , D.CONTROLEREMESSA';
  End;
  CdsEmitidos.Data := GetDataPacket(sSql);
  Result := Not CdsEmitidos.IsEmpty;
End;

Procedure TCtrlParamBloqueteCobranca.EnviaRemessaSelecionada;
Var
  sNossoNumero, sUltNossoNumero, sUltCodArquivoGerado: String;
Begin
  If CdsLocalBloquete.FieldByName('NOSSONUMERO').isNull Then
    sNossoNumero := '0'
  else
  begin
    sNossoNumero := IntBancoManager.NossoNumero;
    CdsLocalBloquete.edit;
    CdsLocalBloquete.FieldByName('NOSSONUMERO').AsString := sNossoNumero;
  end;

  CdsLocalBloquete.First;
  CtrlIntBanco.AtualizaDoc := True;

  CtrlIntBanco.MostraFormRemessa(CdsBanco.FieldByName('CodArquivoRemessa').AsInteger,
    NumRemessaDia(False),
    False,
    sNossoNumero,
    CdsBanco.FieldByName('PrazoProtesto').AsString,
    CdsBanco.FieldByName('JurosPorDia').AsString,
    CdsBanco.FieldByName('NumEmpresaBanco').AsString,
    IntToStr(CdsEmitidos.FieldByName('ControleRemessa').AsInteger - 1),
    CdsBanco.FieldByName('PathArquivoRem').AsString,
    CdsLocalBloquete.Data,
    sUltNossoNumero,
    sUltCodArquivoGerado);
End;

Function TCtrlParamBloqueteCobranca.NumRemessaDia(
  NovaRemessa: Boolean): Integer;
Var
  OldData: String;
Begin
  OldData := DataIniText;
  If (StrToDate(DataIniText) <> Date) And NovaRemessa Then
  Begin
    OldData := DataIniText;
    DataIniText := DateToStr(Date);
  End;
  If NovaRemessa Or CdsEmitidos.IsEmpty Then
    Result := CdsEmitidos.RecordCount
  Else
    Result := GridCobrGetActiveRow;
  DataIniText := OldData;
End;

//início andre tavares - pendencia 22455 26/05/2006
function TCtrlParamBloqueteCobranca.GetDocsEmissao(const idpessoa: int64; const idusuario: int64; const pemisbloq: string;
                                                   const idmodulo: int64 = 0; const pcontroleremessa: int64 = 0; const pcodportforma: int64 = 0;
                                                   const idtipocliente: int64 = 0; const bUsuarioLogado: boolean = true;    //Paulo WO28309
                                                   const codtipdoc: int64 = 0; const coddocumento: integer = 0;
                                                   // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                                                   dataprogramadaini: string = '';
                                                   dataprogramadafim: string = ''): olevariant;
                                                   // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **

var cds, cdsaux: TClientDataset;
    sSql : string;
    dias : Real;
    Data : TDateTime;
    cont : Integer;

    function fct_sql(bPeriodo:Boolean; sData:string): string;

    begin
       if idtipocliente = 0 then
       begin
//         sSql := ' SELECT /*+RULE*/  '+#13+ // Edilaine - SOL 178674 / KTN 1726751      //Everson TIBERO
         sSql := ' SELECT '+#13+ // Edilaine - SOL 178674 / KTN 1726751                   //Everson TIBERO
                 '   0 AS IMPRIME, IDFORCLI, CEP, CODESTADO, CIDADE, BAIRRO, COMPLEMENTO, NUMERO, '+#13+
                 '   LOGRADOURO, NUMDOCUMENTO, NOME, VALORDESCONTO, DATALIMITE, DATAPROGRAMADA, '+#13+
                 '   IDPESSOA, '+#13+//Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '   EMAILFUNCEF, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '   CODPORTFORMA, DATAVENCTO, DATAEMISSAO, NODOCUMENTO, MOESIGLA, CODDOCUMENTO, '+#13+
                 '   (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')  ) AS DATADOCUMENTO, '+#13+
                 '   TIPO, NOSSONUMERO, COMPLDOCUMENTO, TIPOENDERECO, NUMAGENCIA, NUMCONTA, VALORJUROS, '+#13+
                 '   (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, '+#13+
                 '   FLGGRUPO, VALOR, VALOROM, NUMRAZAOCC, IDTIPOCLIENTE, NUMEMPRESABANCO, CODTIPOPAGTO, CODFORMAPAGTO, FLGEMITEAVISO, ' +#13+
                 '   NOME AS RAZAOSOCIAL, NUMAGENCIA, CONTACORRENTE, NUMBANCO AS CODBANCOFAVORECIDO, AGENCIACONVENIO '+#13+ //andré tavares - pendência 27408 - 13/02/2008

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '   ,IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', CODTIPDOC ';

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', IDUSUARIOINCLUSAO '+#13;

//                 sSql := sSql + ' FROM (SELECT /*+RULE*/ '+#13+   // Edilaine - SOL 178674 / KTN 1726751  //Everson TIBERO
                 sSql := sSql + ' FROM (SELECT '+#13+   // Edilaine - SOL 178674 / KTN 1726751              //Everson TIBERO
                 '       D.IDFORCLI, '+#13+
                 '       E.CEP, '+#13+
                 '       ES.CODESTADO, '+#13+
                 '       C.NOME AS CIDADE, '+#13+
                 '       E.BAIRRO, '+#13+
                 '       E.COMPLEMENTO, '+#13+
                 '       E.NUMERO, '+#13+
                 '       E.LOGRADOURO,    '+#13+
                 '       DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO,  '+#13+
                 '       P.IDPESSOA, '+#13+//Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '       PF.EMAILFUNCEF, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '       P.RAZAOSOCIAL AS NOME, '+#13+
                 '       D.VALORDESCONTO, '+#13+
                 '       D.DATALIMITE, '+#13+
                 '       D.DATAPROGRAMADA, '+#13+
                 '       D.CODPORTFORMA, '+#13+
                 '       D.DATAVENCTO, '+#13+
                 '       (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') ) AS DATAEMISSAO,  '+#13+
                 '       D.NODOCUMENTO, '+#13+
                 '       M.MOESIGLA, '+#13+
                 '       D.CODDOCUMENTO, '+#13+
                 '       P.TIPO, '+#13+
                 '       D.NOSSONUMERO, '+#13+
                 '       D.COMPLDOCUMENTO, '+#13+
                 '       E.TIPOENDERECO,  '+#13+
   //              '       AB.NUMAGENCIA, '+#13+
                 '       PC.NOCONTACORR AS NUMCONTA, '+#13+
                 '       F.JUROSPORDIA AS VALORJUROS, '+#13+
                 '       (''N'') AS FLGGRUPO, '+#13+
                 '       SALDO.VALOR, '+#13+
                 '       SALDO.VALOROM, '+#13+
                 '       F.NUMRAZAOCC, '+#13+
                 '       CP.IDTIPOCLIENTE, '+#13+
                 '       F.NUMEMPRESABANCO, '+#13+
                 '       F.CODTIPOPAGTO, F.CODFORMAPAGTO, F.FLGEMITEAVISO, cb.*, AB.NUMAGENCIA AS AGENCIACONVENIO '+#13+ //andré tavares - pendência 27408 - 13/02/2008

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '       ,D.IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', D.CODTIPDOC '+#13;

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql +
                 '   FROM '+#13+
                 '       ENDPESS E, CIDADES C, ESTADO ES, '+#13+
                 '       PESSOA P, '+#13+
                 '       PESSOAFISICA PF,'+#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '       DOCUMENTO D, '+#13+
                 '       MOEDA M, '+#13+
                 '       AGENCIABANCARIA AB, '+#13+
                 '       PORTADORCONTA PC, '+#13+
                 '       CLIENTEPESS CP, '+#13+
                 //'       PORTADORFORMA F , '+#13+  // Edilaine - SOL 178674 / KTN 1726751 - comentado

//                 '       (SELECT  /*+RULE*/ '+#13+ //Everson TIBERO
                 '       (SELECT  '+#13+             //Everson TIBERO
                 // Edilaine - SOL 178674 / KTN 1726751 - alteração no alias do DOCUMENTO
                 '          DOC.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) AS VALOR, '+#13+
                 '          SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) AS VALOROM '+#13+
                 '        FROM  '+#13+
                 '            LANCTODOCUM L,DOCUMENTO DOC '+#13+

                 '       WHERE (L.CODDOCUMENTO = DOC.CODDOCUMENTO) '+#13+
                 '         AND (DOC.CODGRUPOCNAB IS NULL) '+#13+
                 '         AND (RTRIM(DOC.OPERACAO) IN (''2'',''3'',''13'',''14'')) '+#13+
                 '         AND (DOC.RECPAG = ''R'') And (DOC.IDPESSOA = '+ intToStr(idpessoa)+  ') '+#13+
                 '         AND (NVL(DOC.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) +') '+#13+
                 '         AND ((DOC.STATUS <> ''2'') OR (DOC.STATUS IS NULL)) '+#13+
                 '         AND (DOC.CONTROLEREMESSA IS NULL                 OR '+#13+
                 '              DOC.CONTROLEREMESSA = '+ intTostr(pcontroleremessa) +' ) ';

                 if idmodulo <> 0 then
                   ssql := sSql +'         AND   (DOC.IDMODULO = ' + intToStr(idmodulo)+ ') '+#13;

                 sSql := sSql +
                 //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
                 '         AND NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD WHERE DXD.IDDOCUMENTO = DOC.CODDOCUMENTO)'+#13+
                 '       GROUP BY  DOC.CODDOCUMENTO '+#13+
                 '       HAVING '+#13+
                 '          (SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) <> 0) OR '+#13+
                 '          (SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) <> 0) '+#13+
                 '           ) SALDO, '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - fim

                 // Edilaine - SOL 178674 / KTN 1726751
//                 '       (SELECT /*+USE_NL*/ PF.CODPORTFORMA, PF.JUROSPORDIA, PF.NUMRAZAOCC, PF.NUMEMPRESABANCO,  PF.CODTIPOPAGTO, '+#13+  //Everson TIBERO
                 '       (SELECT PF.CODPORTFORMA, PF.JUROSPORDIA, PF.NUMRAZAOCC, PF.NUMEMPRESABANCO,  PF.CODTIPOPAGTO, '+#13+  //Everson TIBERO
                 '               PF.CODFORMAPAGTO, PF.FLGEMITEAVISO, PF.CODPORTADOR '+#13+
                 '          FROM PORTADORFORMA PF '+#13+
                 '         WHERE PF.CODPORTFORMA = '+ intToStr(pcodportforma) +#13+
                 '       ) F, '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - fim


//                 ' ( SELECT /*+RULE*/ DISTINCT C.IDCBANCARIA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE '+#13+  //Everson TIBERO
                 ' ( SELECT DISTINCT C.IDCBANCARIA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE '+#13+   //Everson TIBERO
                 '   FROM CONTABANCARIA C, AGENCIABANCARIA A, BANCO B  '+#13+    // Edilaine - SOL 178674 / KTN 1726751
                 '   WHERE C.IDAGENCIA = A.IDPESSOA AND                '+#13+
                 '         B.IDPESSOA  = A.IDBANCO  ) CB,           '+#13+

                 // Edilaine - SOL 178674 / KTN 1726751
                 ' (SELECT DISTINCT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG A_11 '+#13+
                 '   WHERE A_11.RECPAG = ''R'' '+#13+
                 '     AND NOT EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B_11 WHERE B_11.RECPAG = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_11.idusuario = '+ intToStr(idusuario);

                 sSql := sSql +
                 '  ) union '+#13+
                 '  SELECT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG a_12 '+#13+
                 '   WHERE a_12.RECPAG = ''R''  '+#13+
                 '     and exists (select 1 from UsuarioxTpdocto b_12 where a_12.codtipdoc = b_12.codtipdoc and b_12.recpag = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_12.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + ' )) TD ';
                 // Edilaine - SOL 178674 / KTN 1726751 - FIM

                 // Edilaine - SOL 178674 / KTN 1726751 - comentado
                 {
                 '   WHERE '+
                 ' (CB.IDCBANCARIA(+) = D.IDCBANCARIA) AND '+
                 ' (D.CODTIPDOC IN (SELECT CODTIPDOC FROM /*+RULE*/ TIPODOCRECPAG A WHERE A.RECPAG =  ''R'' AND NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE RECPAG= ''R'' '; // Edilaine - SOL 178674 / KTN 1726751

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);

                 sSql := sSql +
                 ' ) union  SELECT CODTIPDOC  FROM /*+RULE*/ TIPODOCRECPAG a WHERE a.RECPAG = ''R'' '+#13+  // Edilaine - SOL 178674 / KTN 1726751
                 '    and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc = b.codtipdoc and recpag= ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);
                 }
                 // Edilaine - SOL 178674 / KTN 1726751 - comentado fim

                 // Edilaine - SOL 178674 / KTN 1726751 - reorganizar os filtros e depois acrescentar os joins
                 sSql := sSql +
                 '   WHERE '+
                 '    (NVL(D.EMISBLOQ, ''N'' ) = '+ quotedStr(pemisbloq) +')             AND '+#13+
                 '    (D.RECPAG = ''R'')                         AND '+#13+
                 '    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
                 '    (D.IDPESSOA = '+ intToStr(idpessoa)+ ')     AND '+#13+
                 '    (CP.IDPESSOA = D.IDFORCLI)                 AND '+#13+
                 '    (D.CODGRUPOCNAB IS NULL)                   AND '+#13+
                 '    (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 '    (CB.IDCBANCARIA(+) = D.IDCBANCARIA) AND '+#13+
                 '    (D.CODTIPDOC = TD.CODTIPDOC)  AND '+#13;

                 //andre tavares = pendencia 22079 - 18/07/2006
                 if coddocumento <> 0 then
                    ssql := sSql + '    D.CODDOCUMENTO = '+ intToStr(coddocumento)+ ' AND  '+#13;

                 //sSql := sSql +                                                              // Edilaine - SOL 178674 / KTN 1726751 - comentado
                 //' ))) AND and (F.CODPORTFORMA =  '+ intToStr(pcodportforma)+ ' ) AND '+#13+ // Edilaine - SOL 178674 / KTN 1726751 - comentado

                 // Edilaine - SOL 178674 / KTN 1726751 - fim reorganizar os filtros


                 // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                 if codtipdoc <> 0 then
                   ssql := sSql + ' (D.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
                                   //Higor Nayde Ferreira	SOL 196541  KTN 1882213
                  if idusuario > 0 then
                  begin
                     if sistema.idusuario = idusuario then
                     begin
                        ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13;
                     end
                     else
                     begin
                         ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
                      end;
                  end;
                                 //Higor Nayde Ferreira	SOL 196541  KTN 1882213

                 if bPeriodo then
                 begin
                    if Trim(dataprogramadaini) <> '' then
                    begin
                      ssql := sSql + ' (D.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

                      if Trim(dataprogramadafim) = '' then
                        ssql := sSql + ' (D.DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
                      else
                        ssql := sSql + ' (D.DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
                    end;
                 end
                 else
                    ssql := sSql + ' (D.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;

                 // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **


                 if idmodulo <> 0 then
                   ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

                 sSql := sSql +
                 '    (D.CONTROLEREMESSA IS NULL                 OR  '+#13+
                 '     D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+') AND '+#13+
                 '    (D.IDFORCLI=P.IDPESSOA)                    AND '+#13+
                 '    (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND '+#13+
                 '    (D.MOECODIGO = M.MOECODIGO(+))             AND '+#13+
                 '    (D.CODPORTFORMA = F.CODPORTFORMA)          AND '+#13+
                 '    (F.CODPORTADOR = PC.CODPORTADOR(+))        AND '+#13+
                 '    (PC.IDAGENCIA = AB.IDPESSOA(+))            AND '+#13+
                 '    (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND '+#13+
                 '    (E.IDCIDADES = C.IDCIDADES(+))             AND '+#13+
                 '    (ES.IDESTADO(+) = C.IDESTADO)              AND '+#13+
                 '    P.IDPESSOA = PF.IDPESSOA(+) '+#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 ' UNION ALL '+#13+
//                 '   SELECT /*+RULE*/ DISTINCT '+#13+    // Edilaine - SOL 178674 / KTN 1726751 - alteração dos alias   //Everson TIBERO
                 '   SELECT DISTINCT '+#13+    // Edilaine - SOL 178674 / KTN 1726751 - alteração dos alias        //Everson TIBERO
                 '      d2.idforcli, E2.CEP, ES2.CODESTADO, C2.NOME AS CIDADE, E2.BAIRRO, '+#13+
                 '      E2.COMPLEMENTO, E2.NUMERO, E2.LOGRADOURO, '+#13+
                 '      DECODE(P2.TIPO,''J'',DECODE(P2.NUMDOCUMENTO,NULL,''00000000000000'',P2.NUMDOCUMENTO),DECODE(P2.NUMDOCUMENTO,NULL,''00000000000'',P2.NUMDOCUMENTO)) AS NUMDOCUMENTO,  '+#13+
                 '      P2.IDPESSOA,' +#13+//Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '      PF2.EMAILFUNCEF, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '      P2.RAZAOSOCIAL AS NOME, D2.VALORDESCONTO , D2.DATALIMITE, 	D2.DATAPROGRAMADA, '+#13+
                 '      D2.CODPORTFORMA, D2.DATAVENCTO, TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')  AS DATAEMISSAO, 	D2.CODGRUPOCNAB,  '+#13+
                 '      M2.MOESIGLA, D2.CODGRUPOCNAB AS CODDOCUMENTO, P2.TIPO, D2.NOSSONUMERO, '+#13+
                 '      ('''') AS COMPLDOC,    E2.TIPOENDERECO, /*AB2.NUMAGENCIA,*/ PC2.NOCONTACORR AS NUMCONTA,  '+#13+
                 '      SUM(F2.JUROSPORDIA) AS VALORJUROS, (''S'') AS FLGGRUPO, SUM(SALDO2.VALOR), SUM(SALDO2.VALOROM),  F2.NUMRAZAOCC, CP2.IDTIPOCLIENTE, F2.NUMEMPRESABANCO, ' + #13+
                 '      F2.CODTIPOPAGTO, F2.CODFORMAPAGTO, F2.FLGEMITEAVISO, CB2.*, AB2.NUMAGENCIA AS AGENCIACONVENIO '+#13+ //andré tavares - pendência 27408 - 13/02/2008

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '       ,D2.IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', D2.CODTIPDOC '+#13;

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', D2.IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql +
                 '   FROM  ENDPESS E2, CIDADES C2, ESTADO ES2,  '+#13+
                 '       PESSOA P2, '+#13+
                 '       PESSOAFISICA PF2, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '       DOCUMENTO D2, '+#13+
                 '       MOEDA M2, '+#13+
                 '       AGENCIABANCARIA AB2, '+#13+
                 '       PORTADORCONTA PC2, '+#13+
                 '       CLIENTEPESS CP2, '+#13+
                 //'       PORTADORFORMA F, '+#13+   // Edilaine - SOL 178674 / KTN 1726751 - comentado

//                 '      (SELECT  /*+RULE*/ '+#13+  //Everson TIBERO
                 '      (SELECT  '+#13+              //Everson TIBERO
                 '           DOC2.CODDOCUMENTO, SUM(DECODE(L2.DEBCRE,''C'',L2.VALOR * -1,L2.VALOR)) AS VALOR, '+#13+
                 '           SUM(DECODE(L2.DEBCRE,''C'',L2.VALOROUTRAMOEDA*-1,L2.VALOROUTRAMOEDA)) AS VALOROM '+#13+
                 '       FROM  LANCTODOCUM L2      , DOCUMENTO DOC2 '+#13+
                 '       WHERE (L2.CODDOCUMENTO = DOC2.CODDOCUMENTO) AND '+#13+
                 '             (DOC2.CODGRUPOCNAB IS NOT NULL)            AND '+#13+
                 '             (RTRIM(DOC2.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 '             (DOC2.RECPAG = ''R'') And '+#13+
                 '             (DOC2.IDPESSOA =  '+ intToStr(idpessoa) +') and '+#13+
                 '                 (NVL(DOC2.EMISBLOQ, ''N'') = '+ quotedStr(pEmisBloq) +') AND  '+#13+
                 '       ((DOC2.STATUS <> ''2'') OR (DOC2.STATUS IS NULL))  AND '+#13+
                 '        (DOC2.CONTROLEREMESSA IS NULL OR '+#13+
                 '        DOC2.CONTROLEREMESSA = '+ intToStr(pcontroleremessa) +') AND '+#13;

                 if idmodulo <> 0 then
                   ssql := sSql + '   (DOC2.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

                 //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
                 ssql := sSql +
                 '       NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD2 WHERE DXD2.IDDOCUMENTO = DOC2.CODDOCUMENTO)'+#13+
                 '       GROUP BY DOC2.CODDOCUMENTO '+#13+
                 '       HAVING '+#13+
                 '          (SUM(DECODE(L2.DEBCRE,''C'',L2.VALOR * -1,L2.VALOR)) <> 0) OR '+#13+
                 '          (SUM(DECODE(L2.DEBCRE,''C'',L2.VALOROUTRAMOEDA*-1,L2.VALOROUTRAMOEDA)) <> 0) '+#13+
                 '           ) SALDO2, '+#13+

//                 ' ( SELECT /*+RULE*/ DISTINCT CT2.IDCBANCARIA, BC2.NUMBANCO, AG2.NUMAGENCIA, CT2.CONTACORRENTE '+#13+   //Everson TIBERO
                 ' ( SELECT DISTINCT CT2.IDCBANCARIA, BC2.NUMBANCO, AG2.NUMAGENCIA, CT2.CONTACORRENTE '+#13+    //Everson TIBERO
                 '   FROM CONTABANCARIA CT2, AGENCIABANCARIA AG2, BANCO BC2  '+#13+
                 '   WHERE CT2.IDAGENCIA = AG2.IDPESSOA AND                '+#13+
                 '         BC2.IDPESSOA  = AG2.IDBANCO  ) CB2,           '+#13+

                 // Edilaine - SOL 178674 / KTN 1726751
//                 ' (SELECT /*+USE_NL*/ PF2.CODPORTFORMA, PF2.JUROSPORDIA, PF2.NUMRAZAOCC, PF2.NUMEMPRESABANCO, PF2.CODTIPOPAGTO, '+#13+   //Everson TIBERO
                 ' (SELECT PF2.CODPORTFORMA, PF2.JUROSPORDIA, PF2.NUMRAZAOCC, PF2.NUMEMPRESABANCO, PF2.CODTIPOPAGTO, '+#13+   //Everson TIBERO
                 '         PF2.CODFORMAPAGTO, PF2.FLGEMITEAVISO, PF2.CODPORTADOR '+#13+
                 '    FROM PORTADORFORMA PF2 '+#13+
                 '   WHERE PF2.CODPORTFORMA = '+ intTostr(pcodportforma) +#13+
                 ' ) F2, '+#13+

                 ' (SELECT DISTINCT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG A_21 '+#13+
                 '   WHERE A_21.RECPAG = ''R'' '+#13+
                 '     AND NOT EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B_21 WHERE B_21.RECPAG = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_21.idusuario = '+ intToStr(idusuario);

                 sSql := sSql +
                 '  ) union '+#13+
                 '  SELECT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG a_22 '+#13+
                 '   WHERE a_22.RECPAG = ''R''  '+#13+
                 '     and exists (select 1 from UsuarioxTpdocto b_22 where a_22.codtipdoc = b_22.codtipdoc and b_22.recpag = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_22.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + ' )) TD2 '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - fim


                 // Edilaine - SOL 178674 / KTN 1726751 - comentado
                 {
                 '   WHERE '+#13+
                 '      (D2.IDCBANCARIA = CB2.IDCBANCARIA(+))  AND '+#13+
                 '      (d2.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ''R'' and not exists  (select 1 from UsuarioxTpdocto b where recpag= ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + ' ) union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ''R'' '+#13+
                 '      and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc '+#13;

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + '       and recpag = ''R''))) and '+#13;

                 if pcodPortForma <> 0 then
                   sSql := sSql + ' (F.CODPORTFORMA =  '+ intTostr(pcodportforma) + ' ) AND '+#13;
                 }
                 //andre tavares = pendencia 22079 - 18/07/2006
                 '   WHERE '+#13+
                 '      (D2.CODGRUPOCNAB IS NOT NULL)               AND '+#13+
                 '      (D2.RECPAG = ''R'')                           AND '+#13+
                 '      (RTRIM(D2.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 '      (D2.STATUS <> ''2'')                        AND '+#13+
                 '      (NVL(D2.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) + ' )           AND '+#13+
                 '      (D2.IDPESSOA = '+ intToStr(idpessoa) +' )    AND '+#13+
                 '      (D2.CONTROLEREMESSA IS NULL                 OR  '+#13+
                 '       D2.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ')            AND '+#13;

                 if coddocumento <> 0 then
                   ssql := sSql + ' D2.CODDOCUMENTO = '+ intToStr(coddocumento)+ ' AND'+#13;


                 //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
                 if idmodulo <> 0 then
                   ssql := sSql + '   (D2.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

                 // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                 if codtipdoc <> 0 then
                   ssql := sSql + ' (D2.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
                                   //Higor Nayde Ferreira	SOL 196541  KTN 1882213
                  if idusuario > 0 then
                  begin
                     if sistema.idusuario = idusuario then
                     begin
                         ssql := sSql + ' (D2.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13;
                     end
                     else
                     begin
                         ssql := sSql + ' (D2.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
                      end;
                  end;

                 if bPeriodo then
                 begin
                                    //Higor Nayde Ferreira	SOL 196541  KTN 1882213
                    if Trim(dataprogramadaini) <> '' then
                    begin
                      ssql := sSql + ' (D2.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

                      if Trim(dataprogramadafim) = '' then
                        ssql := sSql + ' (D2.DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
                      else
                        ssql := sSql + ' (D2.DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
                    end;

                                  // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
                 end
                 else
                    ssql := sSql + ' (D2.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;


                 sSql := sSql +
                 //'      (D.CODGRUPOCNAB IS NOT NULL)               AND '+#13+
                 //'      (D.RECPAG = ''R'')                           AND '+#13+
                 //'      (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 //'      (D.STATUS <> ''2'')                        AND '+#13+
                 //'      (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) + ' )           AND '+#13+
                 //'      (D.IDPESSOA = '+ intToStr(idpessoa) +' )    AND '+#13+
                 //'      (D.CONTROLEREMESSA IS NULL                 OR  '+#13+
                 //'       D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ')AND '+#13+
                 '      (D2.CODTIPDOC = TD2.CODTIPDOC)               AND '+#13+
                 '      (D2.IDCBANCARIA = CB2.IDCBANCARIA(+))         AND '+#13+
                 '      (CP2.IDPESSOA = D2.IDFORCLI)                 AND '+#13+
                 '      (D2.IDFORCLI = P2.IDPESSOA)                  AND '+#13+
                 '      (D2.CODDOCUMENTO = SALDO2.CODDOCUMENTO)      AND '+#13+
                 '      (D2.MOECODIGO = M2.MOECODIGO(+))             AND '+#13+
                 '      (D2.CODPORTFORMA = F2.CODPORTFORMA)          AND '+#13+
                 '      (F2.CODPORTADOR = PC2.CODPORTADOR(+))        AND '+#13+
                 '      (PC2.IDAGENCIA = AB2.IDPESSOA(+))            AND '+#13+
                 '      (E2.IDENDERECO(+) = P2.IDENDCOBRANCA)        AND '+#13+
                 '      (E2.IDCIDADES = C2.IDCIDADES(+))             AND '+#13+
                 '      (ES2.IDESTADO(+) = C2.IDESTADO)              AND '+#13+
                 '      P2.IDPESSOA = PF2.IDPESSOA(+) ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '   GROUP BY D2.IDFORCLI, '+#13+
                 '       D2.CODGRUPOCNAB, '+#13+
                 '       E2.CEP, ES2.CODESTADO, C2.NOME, E2.BAIRRO, '+#13+
                 '       E2.COMPLEMENTO, E2.NUMERO, E2.LOGRADOURO, NUMDOCUMENTO, '+#13+
                 '       P2.RAZAOSOCIAL, D2.VALORDESCONTO, D2.DATALIMITE, D2.DATAPROGRAMADA, '+#13+
                 '       D2.CODPORTFORMA, D2.DATAVENCTO, '+#13+
                 '       M2.MOESIGLA, P2.TIPO, D2.NOSSONUMERO, '+#13+
                 '       E2.TIPOENDERECO,  AB2.NUMAGENCIA, PC2.NOCONTACORR, F2.JUROSPORDIA, '+#13+
                 '       F2.NUMRAZAOCC, CP2.IDTIPOCLIENTE, F2.NUMEMPRESABANCO, F2.CODTIPOPAGTO, F2.CODFORMAPAGTO, F2.FLGEMITEAVISO, ' + #13+
                 '       CB2.IDCBANCARIA, CB2.NUMBANCO, CB2.NUMAGENCIA, CB2.CONTACORRENTE, ' +#13+
                 '       P2.IDPESSOA, ' +#13+ //Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '       PF2.EMAILFUNCEF ' +#13+

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '       ,D2.IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', D2.CODTIPDOC '+#13;

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', D2.IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql + ') ' +#13+ ' ORDER BY FLGGRUPO, NODOCUMENTO ';
       end
       else begin
         sSql := ' SELECT 0 AS IMPRIME, IDFORCLI, CEP, CODESTADO, CIDADE, BAIRRO, COMPLEMENTO, NUMERO, LOGRADOURO, NUMDOCUMENTO, NOME,  '+#13+
         '  VALORDESCONTO, DATALIMITE, DATAPROGRAMADA, CODPORTFORMA, DATAVENCTO, DATAEMISSAO, NODOCUMENTO, '+#13+
         '   (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')  ) AS DATADOCUMENTO, '+#13+
         ' (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, '+#13+
         '  MOESIGLA, CODDOCUMENTO, TIPO, NOSSONUMERO, COMPLDOCUMENTO, TIPOENDERECO, NUMAGENCIA, NUMCONTA, '+#13+
         '  VALORJUROS, FLGGRUPO, VALOR, VALOROM, NUMRAZAOCC, IDTIPOCLIENTE, NUMEMPRESABANCO, CODTIPOPAGTO, CODFORMAPAGTO, CODPORTFORMA, ''00000'' AS AGENCIACONVENIO ' + #13 + //pendência 24491 - 10/03/2008

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', IDUSUARIOINCLUSAO '+#13;

           sSql := sSql +
         ' FROM (SELECT  '+#13+
         '         D.IDFORCLI, E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO, E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, '+#13+
         '         DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO, '+#13+
         '         P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, D.CODPORTFORMA, D.DATAVENCTO, '+#13+
         '          (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') ) AS DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA, '+#13+
         '         D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA, '+#13+
         '         F.JUROSPORDIA AS VALORJUROS, (''N'') AS FLGGRUPO, SALDO.VALOR, SALDO.VALOROM, F.NUMRAZAOCC, CP.IDTIPOCLIENTE, F.NUMEMPRESABANCO, F.CODTIPOPAGTO, F.CODFORMAPAGTO '+#13 +

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,D.IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', D.CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

         sSql := sSql +
         ' FROM '+#13+
         ' ENDPESS E, CIDADES C, ESTADO ES, '+#13+
         ' (SELECT '+#13+
         '    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) AS VALOR, '+#13+
         '    SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) AS VALOROM '+#13+
         ' FROM '+#13+
         '     LANCTODOCUM L,DOCUMENTO D WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+#13+
         '     (D.RECPAG = ''R'') AND (D.IDPESSOA =  '+ intToStr(idpessoa)+  ') AND '+#13+
         '      (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) +') AND '+#13+
         '       ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
         '        (D.CONTROLEREMESSA IS NULL                 OR '+#13+
         '        D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') '+#13+
         //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
         '       AND NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD WHERE DXD.IDDOCUMENTO = D.CODDOCUMENTO)'+#13+
         ' GROUP BY D.CODDOCUMENTO  '+#13+
         ' HAVING '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) <> 0) OR '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) <> 0) '+#13+
         '     ) SALDO, '+#13+
         ' PESSOA P, '+#13+
         ' DOCUMENTO D, '+#13+
         ' PORTADORFORMA F , '+#13+
         ' MOEDA M, '+#13+
         ' AGENCIABANCARIA AB, '+#13+
         ' PORTADORCONTA PC, '+#13+
         ' CLIENTEPESS CP '+#13+

         //David - Pendência 26006 - Retirado IDMODULO para corrigir problema com documento agrupados
         //' MODULO '+#13+

         ' WHERE (D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG =  ''R'' AND '+#13+
         ' NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE '+#13;

         if idusuario <> 0 then
           sSql := sSql + '  B.IDUSUARIO = ' + intTostr(idusuario)+ ' AND '+#13;

         sSql := sSql + '  RECPAG=''R'') UNION  SELECT CODTIPDOC  FROM TIPODOCRECPAG A WHERE A.RECPAG = ''R'' '+#13+
                        '  AND EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B WHERE A.CODTIPDOC=B.CODTIPDOC '+#13;

         if idusuario <> 0 then
           sSql := sSql + ' AND B.IDUSUARIO=' + intTostr(idusuario)+#13;

         sSql := sSql + ' AND RECPAG=''R''))) AND '+#13+
         ' (F.CODPORTFORMA =   '+ intToStr(pcodportforma)+ ') AND '+#13+
         ' (NVL(D.EMISBLOQ, ''N'' )= '+ quotedStr(pemisbloq) +')             AND '+#13+
         ' (D.RECPAG = ''R'')                         AND '+#13+
         ' ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
         ' (D.IDPESSOA =  '+ intToStr(idpessoa)+  ')    AND '+#13+
         ' (CP.IDPESSOA = D.IDFORCLI)                   AND '+#13;

         //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
         if idmodulo <> 0 then
           ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

         ssql := sSql +
         ' ((CP.IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ ' )  OR '+#13+
         ' (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE  '+#13+
         ' IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ '))) AND '+#13+
         ' (D.CODGRUPOCNAB IS NULL)                   AND '+#13+
         ' (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
         ' (D.CONTROLEREMESSA IS NULL                 OR '+#13+
         '  D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') AND '+#13+
         ' (D.IDFORCLI=P.IDPESSOA)                    AND '+#13+
         ' (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND '+#13;

         // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
         if codtipdoc <> 0 then
           ssql := sSql + ' (D.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
         //Higor Nayde Ferreira	SOL 196541  KTN 1882213
         if idusuario > 0 then
         begin
            if sistema.idusuario = idusuario then
               ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13
            else
               ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
         end;

         if bPeriodo then
         begin
                      //Higor Nayde Ferreira	SOL 196541  KTN 1882213
            if Trim(dataprogramadaini) <> '' then
            begin
              ssql := sSql + ' (D.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

              if Trim(dataprogramadafim) = '' then
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
              else
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
            end;

            // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
         end
         else
            ssql := sSql + ' (D.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;

         //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
         if idmodulo <> 0 then
           ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

         ssql := sSql +
         ' (D.MOECODIGO = M.MOECODIGO(+))             AND '+#13+
         ' (D.CODPORTFORMA = F.CODPORTFORMA)          AND '+#13+
         ' (F.CODPORTADOR = PC.CODPORTADOR(+))        AND '+#13+
         ' (PC.IDAGENCIA = AB.IDPESSOA(+))            AND '+#13+
         ' (E.IDCIDADES = C.IDCIDADES(+))             AND '+#13+
         ' (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND '+#13+
         ' (ES.IDESTADO(+) = C.IDESTADO) '+#13+
         ' UNION ALL '+#13+
         ' SELECT DISTINCT '+#13+
         '  D.IDFORCLI, '+#13+
         '  E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO, '+#13+
         '  E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, '+#13+
         '  DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO, '+#13+
         '  P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, '+#13+
         '  D.CODPORTFORMA, D.DATAVENCTO, TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') AS DATAEMISSAO, D.CODGRUPOCNAB, '+#13+
         '  M.MOESIGLA, D.CODGRUPOCNAB AS CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, '+#13+
         '  ('''') AS COMPLDOC, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA,  '+#13+
         '  SUM(F.JUROSPORDIA) AS VALORJUROS, (''S'') AS FLGGRUPO, SUM(SALDO.VALOR),SUM(SALDO.VALOROM),  F.NUMRAZAOCC, CP.IDTIPOCLIENTE, F.NUMEMPRESABANCO, F.CODTIPOPAGTO, F.CODFORMAPAGTO  ' + #13+

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,D.IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', D.CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

         sSql := sSql +
         ' FROM ENDPESS E, CIDADES C, ESTADO ES,  '+#13+
         ' (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) AS VALOR,  '+#13+
         '    SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) AS VALOROM '+#13+
         ' FROM LANCTODOCUM L   ,DOCUMENTO D '+#13+
         ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+#13+
         '     (D.RECPAG = ''R'') AND '+#13+
         '     (D.IDPESSOA =  '+ intToStr(idpessoa)+  ') AND '+#13+
         '     (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) +')            AND '+#13+
         '     ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
         '     (D.CONTROLEREMESSA IS NULL  OR '+#13+
         '      D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') '+#13+
         //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
         '       AND NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD WHERE DXD.IDDOCUMENTO = D.CODDOCUMENTO)'+#13+
         ' GROUP BY D.CODDOCUMENTO '+#13+
         ' HAVING '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) <> 0) OR '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) <> 0) '+#13+
         '     ) SALDO,  '+#13+
         ' PESSOA P, DOCUMENTO D, PORTADORFORMA F, MOEDA M, AGENCIABANCARIA AB, PORTADORCONTA PC, CLIENTEPESS CP ' + #13+

         ' WHERE (D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG =  ''R'' AND NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE ';

         if idusuario <> 0 then
           sSql := sSql + ' B.IDUSUARIO= '+ intTostr(idusuario)+ ' AND '+#13;

         sSql := sSql + ' RECPAG=''R'') UNION  SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG = ''R'' '+#13+
         '  AND EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B WHERE A.CODTIPDOC=B.CODTIPDOC '+#13;

         if idusuario <> 0 then
           sSql := sSql + ' AND B.IDUSUARIO= '+ intTostr(idusuario);

         //andre tavares = pendencia 22079 - 18/07/2006
         if coddocumento <> 0 then
           ssql := sSql + ' AND D.CODDOCUMENTO = '+ intToStr(coddocumento) +#13; // andré tavares - penência 24491 - 13/02/2007


          sSql := sSql + ' AND RECPAG=''R''))) AND   (F.CODPORTFORMA =   '+ intToStr(pcodportforma)+ ') AND '+#13+
         '   (D.CODGRUPOCNAB IS NOT NULL) AND '+#13+
         '   (D.RECPAG = ''R'') AND '+#13+
         '   (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
         '   (D.STATUS <> ''2'') AND '+#13+
         '   (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) + ' ) AND '+#13+
         '   (D.IDPESSOA =  '+ intToStr(idpessoa)+ ') AND '+#13+
         '   (CP.IDPESSOA = D.IDFORCLI) AND '+#13;

         // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
         if codtipdoc <> 0 then
           ssql := sSql + ' (D.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
                   //Higor Nayde Ferreira	SOL 196541  KTN 1882213
         if idusuario > 0 then
          begin
             if sistema.idusuario = idusuario then
             begin
                ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13;
             end
             else
             begin
                 ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
             end;
          end;

         if bPeriodo then
         begin
                      //Higor Nayde Ferreira	SOL 196541  KTN 1882213
            if Trim(dataprogramadaini) <> '' then
            begin
              ssql := sSql + ' (D.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

              if Trim(dataprogramadafim) = '' then
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
              else
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
            end;

            // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
         end
         else
            ssql := sSql + ' (D.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;

         ssql := sSql +
         '   ((CP.IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ ') OR '+#13+
         '   (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ '))) AND '+#13+
         '   (D.CONTROLEREMESSA IS NULL OR '+#13+
         '    D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') AND '+#13+
         '   (D.IDFORCLI=P.IDPESSOA) AND '+#13+
         '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO) AND '+#13;

         //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
         if idmodulo <> 0 then
           ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

         ssql := sSql +
         '   (D.MOECODIGO = M.MOECODIGO(+))             AND '+#13+
         '   (D.CODPORTFORMA = F.CODPORTFORMA)          AND '+#13+
         '   (F.CODPORTADOR = PC.CODPORTADOR(+))        AND '+#13+
         '   (PC.IDAGENCIA = AB.IDPESSOA(+))            AND '+#13+
         '   (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND '+#13+
         '   (E.IDCIDADES = C.IDCIDADES(+))             AND '+#13+
         '   (ES.IDESTADO(+) = C.IDESTADO) '+#13+
         ' GROUP BY D.IDFORCLI, D.CODGRUPOCNAB, '+#13+
         '    E.CEP, ES.CODESTADO, C.NOME, E.BAIRRO, '+#13+
         '    E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, NUMDOCUMENTO, '+#13+
         '    P.RAZAOSOCIAL, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, '+#13+
         '    D.CODPORTFORMA, D.DATAVENCTO, '+#13+
         '    M.MOESIGLA, P.TIPO, D.NOSSONUMERO, '+#13+
         '    E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR, F.JUROSPORDIA, '+#13+
         '    F.NUMRAZAOCC, CP.IDTIPOCLIENTE, F.NUMEMPRESABANCO, F.CODTIPOPAGTO, F.CODFORMAPAGTO  ' +

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,D.IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', D.CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

         sSql := sSql +  ') ORDER BY FLGGRUPO, NODOCUMENTO '+#13;
       end; //else

      result := sSql;

   end;
begin
  sSql := '';

  cds := TclientDataSet.Create(nil);
  cdsaux := TclientDataSet.Create(nil);

  try
     //Inicio Sol265893 PPM1199112

     if dataprogramadafim = '' then
        dias := 1
     else
        dias := strtodate(dataprogramadafim) - strtodate(dataprogramadaini);

     if (dias > 5) or (trim(dataprogramadaini) = '') then // SOL 268590 PPM 1264334
     begin
        sSql := fct_sql(True,'');
        cmDebugToFile(sSql, 'c:\PLANUS\temp\botelo.txt');
        cds.data := getDataPacket(sSql);
     end
     else
     begin
        if dataprogramadafim = '' then
           dataprogramadafim := dataprogramadaini;

        Data := strtodate(dataprogramadaini);

        while (Data <= strtodate(dataprogramadafim)) do
        begin
           cdsaux.close;

           if (cdsaux.active) and
              (not cdsaux.IsEmpty) then
           cdsaux.EmptyDataSet;

           sSql := fct_sql(False,datetostr(Data));
           cmDebugToFile(sSql, 'c:\PLANUS\temp\botelo.txt');
           cdsaux.data := getDataPacket(sSql);

           if not cdsaux.IsEmpty then
           begin
              if cds.IsEmpty then
                 cds.data := cdsaux.data
              else
                 cds.data := cds.data + cdsaux.data;
           end;

           Data := Data + 1;
        end;
     end;

     result := cds.data;
     //Fim Sol265893 PPM1199112
  finally
     cds.Free;
     cdsaux.Free;
  end; //try

end;//function

function TCtrlParamBloqueteCobranca.PodeEmitirDocGrupado(const pemisbloq: boolean;      const pcodportforma: int64;
                                                         const pIdUusario: integer;     const pIdModulo: integer;
                                                         const pidTipoCliente: integer; const pcodtipoDoc: integer): boolean;
var  _ssql, sEmissBloq : string;
begin
   result := true;
   sEmissBloq := 'S';
   if pemisbloq then
     sEmissBloq := 'N';


   _sSql := ' SELECT COUNT(*), D1.CODGRUPOCNAB '+#13+
            ' FROM( '+#13+
            '       SELECT ';

   if pcodtipoDoc > 0 then
     _sSql := _ssql + ' D.CODTIPDOC, ';

   if pIdUusario > 0 then
     _sSql := _ssql + ' D.IDUSUARIOINCLUSAO, ';

   if pidTipoCliente > 0 then
     _sSql := _ssql + ' CP.IDTIPOCLIENTE, ';

   if pIdModulo > 0 then
     _sSql := _ssql + ' D.IDMODULO, ';

   _sSql := _ssql + ' D.IDFORCLI, D.CODGRUPOCNAB '+#13+
                    '       FROM DOCUMENTO D, CLIENTEPESS CP '+#13+
                    ' WHERE D.IDFORCLI = CP.IDPESSOA AND '+#13+
                    '       D.CODGRUPOCNAB IS NOT NULL AND '+#13+
                    '       D.OPERACAO IN (''2'',''3'',''13'',''14'') AND '+#13+
                    '       D.CODPORTFORMA =  '+ intToStr(pcodportforma) + ' AND '+#13+
                    '       NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(sEmissBloq)+ ' AND ' +#13+
                    '       (D.STATUS <> ''2'' OR D.STATUS IS NULL) AND '+#13+
                    '       D.RECPAG = ''R'' '+#13+
                    ' GROUP BY ';

   if pcodtipoDoc > 0 then
     _sSql := _ssql + ' D.CODTIPDOC, ';

   if pIdUusario > 0 then
     _sSql := _ssql + ' D.IDUSUARIOINCLUSAO, ';

   if pidTipoCliente > 0 then
     _sSql := _ssql + ' CP.IDTIPOCLIENTE, ';

   if pIdModulo > 0 then
     _sSql := _ssql + ' D.IDMODULO, ';


    _sSql := _ssql + ' D.IDFORCLI, D.CODGRUPOCNAB '+#13+
                     '     ) D1 '+#13+
                     ' GROUP BY D1.CODGRUPOCNAB '+#13+
                     ' HAVING COUNT(*) > 1 ';

   with TClientDataset.Create(nil) do
   begin
     try
       data := GetDataPacket(_sSql);
       result := recordCount = 0;
     finally
       free;
     end;//try
   end;//with
end;
//fim andre tavares - pendencia 22455 26/05/2006


//William Santana SOL 208257.15307  KIN 2050609
 function TCtrlParamBloqueteCobranca.GetDadosCedente():olevariant;
 begin

   result := getdatapacket('SELECT P.NUMDOCUMENTO AS NUMDOCUMENTO_CEDENTE, P.RAZAOSOCIAL AS RAZAOSOCIAL_CEDENTE, ' +#13+
                           '  ( E.LOGRADOURO                                                                     ' +#13+
                           '  || DECODE(E.NUMERO,NULL,NULL,'', ''||E.NUMERO)                                     ' +#13+
                           '  || DECODE(E.COMPLEMENTO,NULL,NULL,'' - ''||E.COMPLEMENTO)                          ' +#13+
                           '  || DECODE(E.BAIRRO,NULL,NULL,'' ''||E.BAIRRO)                                      ' +#13+
                           '  || DECODE(E.CEP,NULL,NULL,'' CEP: ''||E.CEP)                                       ' +#13+
                           '  || DECODE(C.NOME,NULL,NULL,'' ''||C.NOME)                                          ' +#13+
                           '  || DECODE(C.UF,NULL,NULL,''-''||C.UF)                                              ' +#13+
                           '  || DECODE(TF.DDD,NULL,NULL,''TEL: (''||TRIM(TF.DDD)||'')'')                        ' +#13+
                           '  || DECODE(TF.NUMERO,NULL,NULL,'' ''||TF.NUMERO)                                    ' +#13+
                           '  || DECODE(TD.NUMERO,NULL,NULL,'' / ''||TD.NUMERO)                                  ' +#13+
                           '  ) ENDERECO_CEDENTE                                                                 ' +#13+
                           '  FROM  PESSOA P, ENDPESS E, CIDADES C,                                              ' +#13+
                           '  (SELECT IDENDERECO, NUMERO FROM TELENDPESS WHERE TIPO Like ''%C%'') TD,            ' +#13+
                           '  (SELECT IDENDERECO, NUMERO, DDD FROM TELENDPESS WHERE TIPO Like ''%F%'') TF        ' +#13+
                           '   WHERE (P.IDPESSOA = E.IDPESSOA)                                                   ' +#13+
                           '   AND (P.IDENDCOMERCIAL = E.IDENDERECO)                                             ' +#13+
                           '   AND (E.IDCIDADES = C.IDCIDADES)                                                   ' +#13+
                           '   AND (E.IDENDERECO = TD.IDENDERECO(+))                                             ' +#13+
                           '   AND (E.IDENDERECO = TF.IDENDERECO(+))                                             ' +#13+
                           '   AND (P.IDPESSOA = 1 )                                                             ');

 end;
//END - William Santana SOL 208257.15307  KIN 2050609
End.


