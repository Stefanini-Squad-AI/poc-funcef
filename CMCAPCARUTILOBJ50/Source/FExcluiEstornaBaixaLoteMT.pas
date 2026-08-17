{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Exclui/Estorna Baixas Automáticas                  }
{                                                       }
{ Analista Responsável: Gustavo Viegas / Davi Ramos     }
{ Atualizado Em: Janeiro/2003                           }
{                                                       }
{*******************************************************}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{
------------------------------------------------------------------------------
Rotina    : ActSelecionarExecute
Data      : 23/03/2022
Autor     : Edilaine
SIG       : 121878
Descrição : Na exclusão de baixa está selecionando registros indevidos 
--------------------------------------------------------------------------------
Rotina    : ActSelecionarExecute
Data      : 27/04/2021
Autor     : Edilaine
SIG       : 114951
Descrição : Na exclusão de baixa do encontro de contas não retorna todos documentos
--------------------------------------------------------------------------------
Pendência   :  SIG 114623
Responsável :  Ewerton Beltramini
Data        :  29/01/2021
Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
--------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 160459
Nº KINTANA..: 1348720
Data........: 08/10/2011
Responsável.: Eraldo Luis da Silva.
Descrição...: Erro ao estornar/ecluir lote.
--------------------------------------------------------------------------------------------------
Rotina......: ActSelecionarExecute
Nº SOL......: 157289/4921
Nº KINTANA..: 1279362
Data........: 24/05/2011
Responsável.: Ricardo de Freitas
Descrição...: Informando o Parâmetro de NUMLOTE na chamada da função: BuscaDocEncontroContas.
--------------------------------------------------------------------------------------------------
Rotina......: ActSelecionarExecute
Nº SOL......: 156757
Nº KINTANA..: 1277615
Data........: 19/05/2011
Responsável.: Helen V. Bianchi
Descrição...: Adicionado Filtro de Lote
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 155238
Nº KINTANA..: 1200572
Data........: 24/03/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração da opção "Desfazer Baixa via ETL" como default desmarcado.
--------------------------------------------------------------------------------------------------
Rotina......: PegaCaminhoETL, VerificarBaixaETL
Nº SOL......: 124570/3781 e 124570/3782
Nº KINTANA..: 1136318 e 1136319
Data........: 08/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para trazer o PathEtlProducao na utilização do ambiente de produção ou
              trazer PathEtlHom se outros.
---------------------------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
//Rotina.............: Desfazer Baixa ETL Início
//N. Sol.............: 124570  / 2982
//N. Kintana.........: 103005
//Data...............: 23/12/2010
//Responsável........: Gustavo Oliveira
//Descrição..........: Desfazer Baixa ETL.


//Rotina.............: Várias
//N. Sol.............: 140878
//N. Kintana.........: 885763
//Data...............: 02/08/2010
//Responsável........: Bruno Bastos
//Descrição..........: Ajuste da rotina do sol 135095.
//------------------------------------------------------------------------------
//Rotina.............: ActSelecionarExecute
//N. Sol.............: 135095
//N. Kintana.........: 815991
//Data...............: 14/07/2010
//Responsável........: Marcos Luiz de Jesus
//Descrição..........: Implementado Estorno de Baixa Automatica de Encontro de Contas

//------------------------------------------------------------------------------
//Rotina.............: ActProcurarExecute
//N. Sol.............: 128081
//N. Kintana.........: 683707
//Data...............: 03/12/2009
//Responsável........: Marilza Colpani
//Descrição..........: Correção na sentença SQL de busca de documentos para exclusão em lote.

//------------------------------------------------------------------------------
//Rotina............: ActProcurarExecute
//N. Sol.............: 121301, 121302
//N. Kintana......: 581910, 581900
//Data...............: 29/06/2009
//Responsável...: Ricardo Alves
//Descrição........: Modificada busca de documentos para exclusão em lote para utilizar 
//                   o valor total do lote e não o valor do documento.

//------------------------------------------------------------------------------
//Rotina............: LocalizaLoteDocumento
//N. Sol.............: 116951, 116952
//N. Kintana......: 550407, 550408
//Data...............: 14/05/2009
//Responsável...: Ricardo Alves
//Descrição........: Adicionado filtro por data para busca de documentos
//                   para estoro/exclusão de lotes

//------------------------------------------------------------------------------
//Rotina............: ActProcurarExecute, LocalizaLoteDocumento
//N. Sol.............: 90776, 90777
//N. Kintana......: 383148, 383151
//Data...............: 07/08/2008
//Responsável...: Ricardo Alves
//Descrição........: Adicionados filtros para busca de
//                     documentos para estoro/exclusão de lotes

// Autor     : Bruno Bastos
// Data      : 14/11/2007
// Pendência : 25122
// Descrição : Colocar no grid o portador forma utilizado na baixa do documento.
//------------------------------------------------------------------------------
// Autor     : Rodolpho da Silva
// Data      : 21/07/2005
// Pendência : 19792
// Descrição : Filtrar documentos conciliados/regularizados por REC/PAG
//------------------------------------------------------------------------------
{===============================================================================

  Data      : 10/06/2005
  Pendência : 19422
  Autor     : Rodolpho da Silva
  Descrição : Não permitir que documentos conciliados no Controle Financeiro sejam
              exluidos no CAR/CAP sem antes desfazer a regularização dos mesmos
              no Controle Financeiro.
 ===============================================================================}
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Alex
// Data      : 13/01/2004
// Pendência : 15740
// Alteração : Modificada a posição de limpeza do CDS para mostrar erros na exclusão.
// -----------------------------------------------------------------------------
Unit
  FExcluiEstornaBaixaLoteMT;

Interface

USes
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Db, DBTables, Wwdatsrc, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  Wwdbgrid, FokCancelar, DBClient, uCMClientDataSet, uCmSqlParams, CmParamReport,
   ActnList, ImgList, Menus, uCtrlExcluiEstornaBaixaLote,
  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  uCtrlFinanc, Mask, wwdbedit, Wwdbspin, MontaSelect, uCtrlPeriodo, uCmControlObject,
  // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
  uCtrlContab, DBGrids;


Type
  TFrmAlteraExcluiPagto = class(TfrmOkCancelar)
    Panel5: TPanel;
    Panel1: TPanel;
    GrdPagamentos: TwwDBGrid;
    DsSelecionados: TwwDataSource;
    GrdSelecionados: TwwDBGrid;
    LblDocPagos: TPanel;
    LbldocEscluidos: TPanel;
    Panel6: TPanel;
    btnExcluir: TSpeedButton;
    SbtEstorna: TSpeedButton;
    btnRecuperar: TBitBtn;
    btnSelecionar: TBitBtn;
    btnSelecionarDoc: TBitBtn;
    Splitter1: TSplitter;
    SQLPagamentos: TCMSqlParams;
    CdsPagamentos: TCMClientDataSet;
    SQLSelecionados: TCMSqlParams;
    CdsSelecionados: TCMClientDataSet;
    SQLExcluiEstornaFinanc: TCMSqlParams;
    CdsExcluiEstornaFinanc: TCMClientDataSet;
    DsPagamentos: TwwDataSource;
    CmpSelLotes: TCmParamReport;
    ActList: TActionList;
    ActProcurar: TAction;
    ActSelecionar: TAction;
    ImlEstorna: TImageList;
    PpmBaixas: TPopupMenu;
    Procurar1: TMenuItem;
    Procurar2: TMenuItem;
    N1: TMenuItem;
    Panel2: TPanel;
    spMinReg: TwwDBSpinEdit;
    lblReg: TLabel;
    LblQtdDocs: TLabel;
    SQLDocumentoCAP: TMontaSelect;
    SQLUsuarioBaixa: TMontaSelect;
    SQLDocumentoCAR: TMontaSelect;
    cdsAux: TCMClientDataSet;
    cdsAux2: TCMClientDataSet;
    ChkBx_DesfazerBaixaETL : TCheckBox;
    CdsBaixaETL: TCMClientDataSet;
    CMSqlBaixaETL: TCMSqlParams;
    QryETL: TQuery;

    Procedure FormCreate(Sender: TObject);
    Procedure btnRecuperarClick(Sender: TObject);
    Procedure GrdPagamentosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure ActListUpdate(Action: TBasicAction; var Handled: Boolean);
    Procedure ActProcurarExecute(Sender: TObject);
    Procedure ActSelecionarExecute(Sender: TObject);
    Procedure CdsPagamentosAfterOpen(DataSet: TDataSet);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure CdsSelecionadosAfterInsert(DataSet: TDataSet);
      Procedure DsSelecionadosDataChange(Sender: TObject; Field: TField);
      Procedure FormShow(Sender: TObject);
  Private
    { Private declarations }
    CtrlExcluiEstornaBaixaLote : TCtrlExcluiEstornaBaixaLote;

    //CtrlPeriodo: TCtrlPeriodo;

    ControleObjects: TCmControlObject;

      //  Rodolpho da Silva - P: 19995 - 17/08/2005
      //CtrlFinanc: TCtrlFinanc;

    sTipoDoc : String;
      // Número do SOL: 124570 2982 Kintana 103005 - Desfazer Baixa ETL Início
      BaixaETL: Boolean;
      SequenceBaixaETL: Integer;
      QtdeBaixaETL: Integer; // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
      Function GerarArquivo: Boolean;
      Function GerarSequenceETL: Integer;
      Function InserirDadosBaixaAutoETL(pNomeProcesso: String;
         pUsuario, pModulo: Integer): Boolean;
      Function VerificarBaixaETL(pProcesso: Integer): Boolean;
      Function GerarArquivoLOG(pProcesso: Integer): Boolean;
      // Número do SOL: 124570 2982 Kintana 103005 - Desfazer Baixa ETL Fim

      
    Procedure LimpaDocumentos;


    //  Rodolpho da Silva - P: 19422 - 10/06/2005
    function ExisteDocumConciliadoFinanceiro : boolean;

    // Ricardo A. SOL: 90776-90777 KTN: 383148-383151
    procedure LocalizaLoteDocumento( var cdsOrigem: TCMClientDataSet );

    Function PegaCaminhoETL(pRECPag: String): String;

  Public
    { Public declarations }
  End;

Var
  FrmAlteraExcluiPagto: TFrmAlteraExcluiPagto;




Implementation

Uses
  uDataBase, uCtrlParamIntegra, uSistema, uModulo, uCMTypes, uMensErro,
  FDocumConcFinan, CMwwQuery, Provider;

{$R *.DFM}
//************************************************
Procedure TFrmAlteraExcluiPagto.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ( ParamIntegra.RecPag = 'R' ) Then Begin
    sTipoDoc := 'Recebimento';
  End Else Begin
    sTipoDoc := 'Pagamento';
  End;

  CtrlExcluiEstornaBaixaLote              := TCtrlExcluiEstornaBaixaLote.Create;
  CtrlExcluiEstornaBaixaLote.IdEmpresa    := Sistema.IdEmpresa;
  CtrlExcluiEstornaBaixaLote.IdModulo     := Sistema.IdModulo;
  CtrlExcluiEstornaBaixaLote.IdUsuario    := Sistema.IdUsuario;
  CtrlExcluiEstornaBaixaLote.UsaPlanoPatro:= Sistema.UsaPlanoPatro;
  CtrlExcluiEstornaBaixaLote.IdEspAcesso  := Sistema.IdEspAcesso;
  CtrlExcluiEstornaBaixaLote.PlanoConta   := ParamIntegra.Plano;

  CdsSelecionados.PacketRecords := 1000; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
  CdsPagamentos.PacketRecords := 1000; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
  CtrlExcluiEstornaBaixaLote.CdsExcluidos := CdsSelecionados;

  CtrlExcluiEstornaBaixaLote.InitializeAs(ParamIntegra);

  CmpSelLotes.ParamValues[0].AsDateTime := Date;
  CmpSelLotes.ParamValues[1].AsDateTime := Date;

  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  //CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
  //CtrlFinanc.InitializeAs(ParamIntegra);

   //CtrlPeriodo := TCtrlPeriodo.Create;
   //CtrlPeriodo.InitializeAs(ParamIntegra);

   ControleObjects := TCmControlObject.Create;
   ControleObjects.InitializeAs(ParamIntegra);

  bbtnCancelarClick( Self );

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30036;
    bbtnAjuda.HelpContext := 30036;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

End;


Procedure TFrmAlteraExcluiPagto.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  CtrlExcluiEstornaBaixaLote.Free;

  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  //FreeAndNil(CtrlFinanc);
  
  Inherited;
End;




procedure TFrmAlteraExcluiPagto.btnRecuperarClick(Sender: TObject);
Begin
  Inherited;

  //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362
  CdsSelecionados.DisableControls;
  CdsSelecionados.Filter   := 'NUMCHQBORDERO = ' + QuotedStr(CdsSelecionados.FieldByName('NUMCHQBORDERO').asString);
  CdsSelecionados.Filtered := True;
  //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362 - Fim

  while not CdsSelecionados.eof do
  begin
    if CtrlExcluiEstornaBaixaLote.DocTemPai(CdsSelecionados.FieldByName('CODDOCUMENTO').AsInteger) then
      CdsSelecionados.Delete
    else
      CdsSelecionados.Next;
  end;
  //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início

  //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início
  CdsSelecionados.first;


  CtrlExcluiEstornaBaixaLote.MoveRegistros(CdsSelecionados, CdsPagamentos);

  //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362
  CdsSelecionados.Filter   := '';
  CdsSelecionados.Filtered := False;
  CdsSelecionados.EnableControls;
  //Ricardo Freitas - Fim


End;




procedure TFrmAlteraExcluiPagto.LimpaDocumentos;
Begin
  With SQLPagamentos, Sql Do
  Begin
    Clear;
    Add(' SELECT ');
    Add('    P.RAZAOSOCIAL AS NOME, ');
    Add('    D.NODOCUMENTO, ');
    Add('    D.COMPLDOCUMENTO, ');
    Add('    L.DATALANCTO, ');
    Add('    L.VALOR, ');
    Add('    L.VALOROUTRAMOEDA, ');
    Add('    D.CODDOCUMENTO, ');
    Add('    L.NUMLANCTO, ');
    Add('    L.PLNCODIGO, ');
    Add('    R.CODLANCFINANC, ');
    Add('    R.NUMCHQBORDERO, ');
    Add('    L.OPERACAO, R.NUMLOTE, ');
    Add('    R.DATACFLOAT, ');
    Add('    R.CODLANCNAOIDENT, ');
    Add('    DECODE(D.RECPAG,''R'', R.NUMCHQBORDERO, TO_CHAR(R.NUMLOTE)) AS LOTE, ');
    Add('    L.NUMLOTEMANUAL, ');
    Add('    D.FLGTIPODOCUMENTO ');

    //Bruno Bastos - Pend. 25122
    Add('    ,PTF.DESCRICAO ');

    Add(' FROM ');
    Add('    PESSOA P, ');
    Add('    DOCUMENTO D, ');
    Add('    LANCTODOCUM L, ');
    Add('    RECBTOPAGTO R ');

    //Bruno Bastos - Pend. 25122
    Add('   ,PORTADORFORMA PTF ');

    Add(' WHERE ');
    Add('    (1=2) ');

    SQLSelecionados.Sql.Assign(Sql);

    Open;
    SQLSelecionados.Open;
  End;
End;




procedure TFrmAlteraExcluiPagto.GrdPagamentosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;
  if Field.FieldName='VALOR' then
    begin
      AFont.Color:=clNavy;
      ABrush.Color:=$0080FFFF;{Amarelo claro}
    end;
end;



Procedure TFrmAlteraExcluiPagto.bbtnConfirmarClick(Sender: TObject);
var
  // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
  sAux: String;
  objFinanc: TCtrlFinanc;
  objPeriodo: TCtrlPeriodo;
  objContab: TCtrlContab;
Begin

  try
    CdsSelecionados.PacketRecords := 1000; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
    CdsPagamentos.PacketRecords := 1000; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"

    bbtnConfirmar.Enabled := false; //andré tavares - pendência 24378 - 05/02/2007

    // Início - Rodolpho da Silva - P: 19422 - 10/06/2005
    if not ExisteDocumConciliadoFinanceiro then
    begin
    // Fim    - Rodolpho da Silva - P: 19422 - 10/06/2005

       Try
         // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
         sAux := '';
         objFinanc := TCtrlFinanc.Create( Sistema.IdEmpresa, Sistema.IdModulo,
           Sistema.IdUsuario, Sistema.UsaPlanoPatro );
         try
           objFinanc.InitializeAs( ParamIntegra );
           if not objFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,
             CdsSelecionados.FieldByName('DATALANCTO').AsDateTime) then
             sAux := objFinanc.MessageInfo;
         finally
           FreeAndNil( objFinanc );
         end;

         if Trim(sAux) <> '' then
         begin
            MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
            Exit;
         end;

         sAux := '';
         objPeriodo := TCtrlPeriodo.Create;
         try
           objPeriodo.InitializeAs( ParamIntegra );

           if objPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, CdsSelecionados.FieldByName('DATALANCTO').AsString) then
           begin
             if objPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, objPeriodo.Periodo, objPeriodo.Exercicio, False) then
               sAux := objPeriodo.MessageInfo;
           end
           else
             sAux := objPeriodo.MessageInfo;

         finally
           FreeAndNil(objPeriodo);
         end;

         if Trim(sAux) <> '' then
         begin
            MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
            Exit;
         end;

         sAux := '';
         objContab := TCtrlContab.Create;
         try
           objContab.InitializeAs( ParamIntegra );
            if not objContab.TestaDataBloqueadaProc(Sistema.IdEmpresa, Sistema.IdModulo, CdsSelecionados.FieldByName('DATALANCTO').AsString) then
               sAux := objContab.MessageInfo;
         finally
           FreeAndNil(objContab);
         end;

         if Trim(sAux) <> '' then
         begin
            MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
            Exit;
         end;
         // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

         CdsSelecionados.DisableControls;
         CdsSelecionados.First;
         While Not CdsSelecionados.Eof Do
         Begin
            If (Modulo.ExisteRegularizacao(CdsSelecionados.FieldByName('CODDOCUMENTO').AsInteger)) Then
               btnRecuperar.Click
            else
            CdsSelecionados.Next;
         end;

         if not CdsSelecionados.IsEmpty then
         //  Início - Rodolpho da Silva - P: 19995 - 17/08/2005
         CtrlExcluiEstornaBaixaLote.MessageInfo := '';

         If ChkBx_DesfazerBaixaETL.Checked Then
         begin

             // Valida Período contábil
             If Not GerarArquivo Then
                Exit;

             If Not InserirDadosBaixaAutoETL('Desfazer Baixa', Sistema.IdUsuario, Sistema.IdModulo) Then
                Exit
             Else
                Begin
                   BaixaETL := True;
                   While BaixaETL Do
                      Begin
                         BaixaETL := VerificarBaixaETL(SequenceBaixaETL);
                         If Not BaixaETL Then
                            Sleep(1000)
                         Else
                            Sleep(30000);
                      End;
                End;

             If Application.MessageBox(PChar('Baixa desfeita com sucesso!' +#13+#10+
                                             'Total de documentos: ' + IntToStr(QtdeBaixaETL) +#13+#10+ // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
                                             'Deseja gerar arquivo de Log?'), 'Aviso', MB_YESNO) = Mryes Then
                Begin
                   If GerarArquivoLOG(SequenceBaixaETL) Then
                      MsgDlg('Arquivo de LOG gerado com sucesso!', 'Aviso', mtWarning, [mbOk], 0);
                End;
             SequenceBaixaETL := 0;

         end
         else
         begin
            CtrlExcluiEstornaBaixaLote.qtdMinCommit := trunc(spMinReg.value);

            CtrlExcluiEstornaBaixaLote.bbtnConfirmarClick( sTipoDoc,
                                                           SbtEstorna.Down,
                                                           ParamIntegra.EstornaContab );
         end;


//         if CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, CdsSelecionados.FieldByName('DATALANCTO').AsDateTime) then
//         //  Fim - Rodolpho da Silva - P: 19995 - 17/08/2005
//         begin
//                     // Número do SOL: 124570 2982 Kintana 103005 - Desfazer Baixa ETL Início
//                     //If ChkBx_DesfazerBaixaETL.Checked Then // Alterado por FHBS - SOL: 124570/2982 KTN: 103005
//                        //Begin
//                           If CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, CdsSelecionados.FieldByName('DATALANCTO').AsString) Then
//                              Begin
//                                 If Not CtrlPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio, False) Then
//                                    Begin
//
//                                       If ChkBx_DesfazerBaixaETL.Checked Then // Alterado por FHBS - SOL: 124570/2982 KTN: 103005
//                                       begin
//
//                                           // Valida Período contábil
//                                           If Not GerarArquivo Then
//                                              Exit;
//
//                                           If Not InserirDadosBaixaAutoETL('Desfazer Baixa', Sistema.IdUsuario, Sistema.IdModulo) Then
//                                              Exit
//                                           Else
//                                              Begin
//                                                 BaixaETL := True;
//                                                 While BaixaETL Do
//                                                    Begin
//                                                       BaixaETL := VerificarBaixaETL(SequenceBaixaETL);
//                                                       If Not BaixaETL Then
//                                                          Sleep(1000)
//                                                       Else
//                                                          Sleep(30000);
//                                                    End;
//                                              End;
//
//                                           If Application.MessageBox(PChar('Baixa desfeita com sucesso!' + ' Deseja gerar arquivo de Log?'), 'Aviso', MB_YESNO) = Mryes Then
//                                              Begin
//                                                 If GerarArquivoLOG(SequenceBaixaETL) Then
//                                                    MsgDlg('Arquivo de LOG gerado com sucesso!', 'Aviso', mtWarning, [mbOk], 0);
//                                              End;
//                                           SequenceBaixaETL := 0;
//                                           Exit;
//
//                                       end;
//
//
//                                    End
//                                 Else
//                                    Exit;
//                              End
//                           Else
//                              Exit;
//                        //End; // Alterado por FHBS - SOL: 124570/2982 KTN: 103005
//                     // Número do SOL: 124570 2982 Kintana 103005 - Desfazer Baixa ETL Fim
//            CtrlExcluiEstornaBaixaLote.qtdMinCommit := trunc(spMinReg.value);
//
//            CtrlExcluiEstornaBaixaLote.bbtnConfirmarClick( sTipoDoc,
//                                                           SbtEstorna.Down,
//                                                           ParamIntegra.EstornaContab );
//         end
//         // Início - Rodolpho da Silva - P: 19995 - 17/08/2005
//         else
//            MsgDlg(CtrlFinanc.MessageInfo,'Aviso',mtWarning,[mbOk],0);
//         // Fim - Rodolpho da Silva - P: 19995 - 17/08/2005

       Finally
         if (not CdsSelecionados.IsEmpty) and (Trim(CtrlExcluiEstornaBaixaLote.MessageInfo) <> '') then
            MsgDlg( CtrlExcluiEstornaBaixaLote.MessageInfo, 'Aviso', mtInformation, [ mbOk ], 0 );

//         bbtnCancelarClick(Self );
         FuncaoGeral.TiraIcone;
         CdsSelecionados.EnableControls;

       End;
    end;

  finally
    bbtnConfirmar.Enabled := true;//andré tavares - pendência 24378 - 05/02/2007
    CdsSelecionados.EmptyDataSet;
  end;

end;




procedure TFrmAlteraExcluiPagto.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  SbtEstorna.Down                      := ParamIntegra.EstornaContab;
  btnExcluir.Enabled                    := Not ParamIntegra.EstornaContab;
  LimpaDocumentos;
end;




procedure TFrmAlteraExcluiPagto.ActListUpdate(Action: TBasicAction;
  var Handled: Boolean);
Begin
  Inherited;
  ActSelecionar.Enabled := Not CdsPagamentos.IsEmpty;
  btnRecuperar.Enabled  := Not CdsSelecionados.IsEmpty;
  bbtnConfirmar.Enabled := BtnRecuperar.Enabled;
  bbtnCancelar.Enabled  := BtnRecuperar.Enabled;
end;




procedure TFrmAlteraExcluiPagto.ActProcurarExecute(Sender: TObject);
var
  blnParametroPreenchido: Boolean;
  strFiltros: string;
begin
  inherited;
  LimpaDocumentos;

  // Ricardo A. SOL: 90776-90777 KTN: 383148-383151
  // CONTAS A PAGAR OU CONTAS A RECEBER
  if ( ParamIntegra.RecPag = 'P' ) then
    CmpSelLotes.ParamValues[ 3 ].MontaSelect := SQLDocumentoCAP
  else
    CmpSelLotes.ParamValues[ 3 ].MontaSelect := SQLDocumentoCAR;

  If CmpSelLotes.Execute then
  begin

    // Ricardo A. SOL: 90776-90777 KTN: 383148-383151
    // verifica se algum parâmetro foi preenchido
    blnParametroPreenchido :=
      ( CmpSelLotes.ParamValues[ 0 ].AsDateTime <> 0 ) or
      ( CmpSelLotes.ParamValues[ 1 ].AsDateTime <> 0 ) or
      ( CmpSelLotes.ParamValues[ 2 ].AsInteger <> 0 ) or
      ( CmpSelLotes.ParamValues[ 3 ].AsInteger <> 0 ) or
      ( CmpSelLotes.ParamValues[ 4 ].AsFloat <> 0 ) or
      ( CmpSelLotes.ParamValues[ 5 ].AsString <> '0' ) or
      ( CmpSelLotes.ParamValues[ 5 ].AsInteger <> 0 ) or
      ( CmpSelLotes.ParamValues[ 6 ].AsInteger <> 0 ) or
      ( CmpSelLotes.ParamValues[ 7 ].AsInteger <> 0 );

    if not blnParametroPreenchido then
    begin
      MessageDlg('Pelo menos um parâmetro deve ser informado para realizar a consulta.', mtWarning, [mbOK], 0);
      Abort;
    end;

    // valida data final
    if ( CmpSelLotes.ParamValues[ 0 ].AsDateTime > 0 ) and
      ( CmpSelLotes.ParamValues[ 1 ].AsDateTime = 0 ) then
      CmpSelLotes.ParamValues[ 1 ].AsDateTime := CmpSelLotes.ParamValues[ 0 ].AsDateTime
    else
      if ( CmpSelLotes.ParamValues[ 0 ].AsDateTime >
        CmpSelLotes.ParamValues[ 1 ].AsDateTime ) then
      begin
        MessageDlg('A Data Final informada deve ser superior à Data Inicial.',
          mtWarning, [mbOK], 0);
        Abort;
      end;

    strFiltros := '';

    // DATA INICIAL
    if ( CmpSelLotes.ParamValues[ 0 ].AsDateTime <> 0 ) then
      strFiltros := strFiltros + ' (L.DATALANCTO >= :pDataInicial) AND ';

    // DATRICARDO.ALVESA FINAL
    if ( CmpSelLotes.ParamValues[ 1 ].AsDateTime <> 0 ) then
      strFiltros := strFiltros + ' (L.DATALANCTO <= :pDataFinal) AND ';

    // FORNECEDOR
    if ( CmpSelLotes.ParamValues[ 2 ].AsInteger <> 0 ) then
      strFiltros := strFiltros + ' (D.IDFORCLI = :pPessoa) AND ';

    // NÚMERO DO DOCUMENTO
    if ( CmpSelLotes.ParamValues[ 3 ].AsInteger <> 0 ) then
      strFiltros := strFiltros + ' (D.CODDOCUMENTO = :pDocumento) AND ';

    // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
    // VALOR
    if ( CmpSelLotes.ParamValues[ 4 ].AsFloat <> 0 ) then
      strFiltros := strFiltros + ' (M.VALORLANCFINAN = :pValor) AND ';

    //  CHEQUE BORDERO OU LOTE
    if ( ParamIntegra.RecPag = 'P' ) then
    begin
      if ( CmpSelLotes.ParamValues[ 5 ].AsString <> '0' ) then
        strFiltros := strFiltros + ' (DECODE(R.NUMLOTE,NULL,R.NUMCHQBORDERO,R.NUMLOTE) = :pLote) AND ';
    end
    else
      if ( CmpSelLotes.ParamValues[ 5 ].AsInteger <> 0 ) then
        strFiltros := strFiltros + ' (RTRIM(R.NUMCHQBORDERO) = :pLote) AND ';

    // FORMA
    if ( CmpSelLotes.ParamValues[ 6 ].AsInteger <> 0 ) then
      strFiltros := strFiltros + ' (R.CODPORTFORMA = :pForma) AND ';

    // USUÁRIO BAIXA
    if ( CmpSelLotes.ParamValues[ 7 ].AsInteger <> 0 ) then
      strFiltros := strFiltros + ' (USUARIO.IDPESSOA = :pUsuario) AND ';

    with SQLPagamentos, Sql Do
    begin
      Clear;
      if ParamIntegra.recpag='P' then
      begin
        Add(' SELECT ');
        Add('    P.RAZAOSOCIAL AS NOME, ');
        Add('    D.NODOCUMENTO, ');
        Add('    D.COMPLDOCUMENTO, ');
        Add('    L.DATALANCTO, ');
        Add('    L.VALOR, ');
        Add('    L.VALOROUTRAMOEDA, ');
        Add('    D.CODDOCUMENTO, ');
        Add('    L.NUMLANCTO, ');
        Add('    L.PLNCODIGO, ');
        Add('    R.CODLANCFINANC, ');
        Add('    R.NUMCHQBORDERO, ');
        Add('    L.OPERACAO, ');
        Add('    R.NUMLOTE, ');
        Add('    R.DATACFLOAT, ');
        Add('    R.CODLANCNAOIDENT , ');
        Add('    TO_CHAR(DECODE(R.NUMLOTE,NULL,R.NUMCHQBORDERO,R.NUMLOTE)) AS LOTE, ');
        Add('    L.NUMLOTEMANUAL, ');
        Add('    D.FLGTIPODOCUMENTO ');

        //Bruno Bastos - Pend. 25122
        Add('   ,PTF.DESCRICAO ');

        Add(' FROM ');
        Add('    DOCUMENTO D, ');
        Add('    LANCTODOCUM L, ');
        Add('    RECBTOPAGTO R, ');
        Add('    PESSOA P, ');

        //Bruno Bastos - Pend. 25122
        Add('    PORTADORFORMA PTF, ');
        Add( '   PESSOA USUARIO, ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        Add('   MOVIMFINANC M, ');

        // TABELA TOTDOCUM
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM , ');
        Add('       R.NUMCHQBORDERO ');
        Add('    FROM ');
        Add('       RECBTOPAGTO R, ');
        Add('       DOCUMENTO D, ');
        Add('       LANCTODOCUM L, ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        Add('       PESSOA USUARIO, ');
        Add('       MOVIMFINANC M ');

        Add('    WHERE ');
        Add('       (D.RECPAG = ''P'')  AND ');
        Add('       (D.IDPESSOA = :IDPESSOA) AND ');
        Add('       (R.IDUSUARIOINCLUSAO = USUARIO.IDPESSOA) AND ');

        //David - 13/02/07 - Resolvendo problema na consulta
        Add('       (L.ESTORNO IS NULL) AND ');

        Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('       (L.CODDOCUMENTO = R.CODDOCUMENTO)  AND ');
        Add('       (R.NUMLANCTO   = L.NUMLANCTO) AND ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        //Add('       (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) AND ');

        // Marilza Colpani SOL 128081 KTN 683707
        Add('       (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO) AND (M.CODLANCFINANC = R.CODLANCFINANC)) AND '); 

        // Ricardo A. SOL: 90776 KTN: 383148
        //Add('       (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add( strFiltros );
        Add('       (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('    GROUP BY ');
        Add('       R.NUMCHQBORDERO) TOTDOCUM, ');

        // TABELA TOTLOTE
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM , ');
        Add('       R.NUMCHQBORDERO ');
        Add('    FROM ');
        Add('       RECBTOPAGTO R, ');
        Add('       DOCUMENTO D, ');
        Add('       LANCTODOCUM L, ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        Add('       PESSOA USUARIO, ');
        Add('       MOVIMFINANC M ');

        Add('    WHERE ');
        Add('       (D.RECPAG = ''P'')  AND ');
        Add('       (D.IDPESSOA = :IDPESSOA) AND ');
        Add('       (R.IDUSUARIOINCLUSAO = USUARIO.IDPESSOA) AND ');
        Add('       (L.ESTORNO IS NULL) AND ');
        Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('       (L.CODDOCUMENTO = R.CODDOCUMENTO) AND ');
        Add('       (R.NUMLANCTO    = L.NUMLANCTO) AND ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        //Add('       (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) AND ');

        //edilaine SIG114951 : inicio
        // Marilza Colpani SOL 128081 KTN 683707
        //Add('       (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO) AND (M.CODLANCFINANC = R.CODLANCFINANC)) AND ');
        Add('       (M.CODLANCFINANC = R.CODLANCFINANC) AND ');
        //edilaine SIG114951 : fim


        // Ricardo A. SOL: 90776 KTN: 383148
//        Add('       (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add( strFiltros );
        Add('       (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('    GROUP BY ');
        Add('       R.NUMCHQBORDERO) TOTLOTE ');

        // WHERE PRINCIPAL
        Add(' WHERE ');
        Add('    (((RTRIM(L.OPERACAO) = ''5'') OR (RTRIM(L.OPERACAO) = ''15'')) AND (L.ESTORNO IS NULL)) AND ');
        Add('    (TOTLOTE.TOTDOCUM             = TOTDOCUM.TOTDOCUM) AND ');
        Add('    (RTRIM(TOTLOTE.NUMCHQBORDERO) = RTRIM(TOTDOCUM.NUMCHQBORDERO)) AND ');
        Add('    (RTRIM(TOTLOTE.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) AND ');
        Add('    (D.RECPAG                     = :RECPAG) AND ');
        Add('    (D.IDPESSOA                   = :IDPESSOA) AND ');
        Add('    (R.IDUSUARIOINCLUSAO          = USUARIO.IDPESSOA) AND ');
        Add( strFiltros );
        Add('    ((L.CODDOCUMENTO = R.CODDOCUMENTO) AND (L.NUMLANCTO = R.NUMLANCTO)) AND ');
        Add('    (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('    (D.IDFORCLI = P.IDPESSOA) ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        //Add('    AND (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) ');

        //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início
        Add('  and not exists (select 1 from documxdocum dxd where dxd.iddocumento = d.coddocumento) ');
        //Bruno Bastos - Sol 129053 - Kintana: 704787 - Fim


        //edilaine SIG114951 : inicio
        // Marilza Colpani SOL 128081 KTN 683707
        //Add('    AND (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO) AND (M.CODLANCFINANC = R.CODLANCFINANC)) ');
        Add('    AND (M.CODLANCFINANC = R.CODLANCFINANC) ');
        //edilaine SIG114951 : fim

        //Bruno Bastos - Pend. 25122
        Add(' AND (R.CODPORTFORMA = PTF.CODPORTFORMA) ');

        Add(' ORDER BY ');
        Add('    R.CODLANCFINANC ');
      end
      else
      begin
        Add(' SELECT ');
        Add('   P.RAZAOSOCIAL AS NOME, ');
        Add('   D.NODOCUMENTO, ');
        Add('   D.COMPLDOCUMENTO, ');
        Add('   L.DATALANCTO, ');
        Add('   L.VALOR, ');
        Add('   L.VALOROUTRAMOEDA, ');
        Add('   D.CODDOCUMENTO, ');
        Add('   L.NUMLANCTO, ');
        Add('   L.PLNCODIGO, ');
        Add('   R.CODLANCFINANC, ');
        Add('   R.NUMCHQBORDERO, ');
        Add('   L.OPERACAO, ');
        Add('   R.NUMLOTE, ');
        Add('   R.DATACFLOAT, ');
        Add('   R.CODLANCNAOIDENT , ');
        Add('   R.NUMCHQBORDERO AS LOTE, ');
        Add('   L.NUMLOTEMANUAL, ');
        Add('   D.FLGTIPODOCUMENTO ');

        //Bruno Bastos - Pend. 25122
        Add('   ,PTF.DESCRICAO ');

        Add(' FROM ');
        Add('   DOCUMENTO D, ');
        Add('   LANCTODOCUM L, ');
        Add('   RECBTOPAGTO R, ');

        //Bruno Bastos - Pend. 25122
        Add('    PORTADORFORMA PTF, ');

        Add('   PESSOA P, ');
        Add('   PESSOA USUARIO, ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        Add('   MOVIMFINANC M, ');

        // TABELA TOTDOCUM
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM, ');
        Add('       R.NUMCHQBORDERO ');
        Add('    FROM ');
        Add('       RECBTOPAGTO R, ');
        Add('       DOCUMENTO D, ');
        Add('       LANCTODOCUM L, ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        Add('       PESSOA USUARIO, ');
        Add('       MOVIMFINANC M ');

        Add('    WHERE ');
        Add('       (D.RECPAG = ''R'')  AND ');
        Add('       (D.IDPESSOA = :IDPESSOA) AND ');
        Add('       (R.IDUSUARIOINCLUSAO = USUARIO.IDPESSOA) AND ');

        //David - 13/02/07 - Resolvendo problema na consulta
        Add('       (L.ESTORNO IS NULL) AND ');

        Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('       (L.CODDOCUMENTO = R.CODDOCUMENTO) AND ');
        Add('       (R.NUMLANCTO    = L.NUMLANCTO) AND ');
        //Add('       (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        //Add('       (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) AND ');

        //edilaine SIG114951 : inicio
        // Ricardo A. SOL 122354 KTN 598743
        //Add('       (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO) AND (M.CODLANCFINANC = R.CODLANCFINANC)) AND ');
        Add('       (M.CODLANCFINANC = R.CODLANCFINANC) AND ');
        //edilaine SIG114951 : fim


        Add( strFiltros );
        Add('       (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('    GROUP BY ');
        Add('        R.NUMCHQBORDERO  ) TOTDOCUM, ');

        // TABELA TOTLOTE
        Add('    (SELECT ');
        Add('        COUNT(*) AS TOTDOCUM, ');
        Add('        R.NUMCHQBORDERO ');
        Add('     FROM ');
        Add('        RECBTOPAGTO R, ');
        Add('        DOCUMENTO D, ');
        Add('        LANCTODOCUM L, ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        Add('        PESSOA USUARIO, ');
        Add('        MOVIMFINANC M ');

        Add('     WHERE ');
        Add('        (D.RECPAG = :RECPAG)  AND ');
        Add('        (D.IDPESSOA = :IDPESSOA)  AND ');
        Add('        (R.IDUSUARIOINCLUSAO = USUARIO.IDPESSOA) AND ');
        Add('        (L.ESTORNO IS NULL) AND ');
        Add('        (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('        (L.CODDOCUMENTO = R.CODDOCUMENTO) AND ');
        Add('        (R.NUMLANCTO    = L.NUMLANCTO) AND ');
//        Add('        (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        //Add('        (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) AND ');

        //edilaine SIG114951 : inicio
        // Ricardo A. SOL 122354 KTN 598743
        //Add('        (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO) AND (M.CODLANCFINANC = R.CODLANCFINANC)) AND ');
        Add('        (M.CODLANCFINANC = R.CODLANCFINANC) AND ');
        //edilaine SIG114951 : fim

        Add( strFiltros );
        Add('        (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('     GROUP BY ');
        Add('        R.NUMCHQBORDERO) TOTLOTE ');

        // WHERE PRINCIPAL
        Add(' WHERE ');
        Add('   (((RTRIM(L.OPERACAO) = ''5'') OR (RTRIM(L.OPERACAO) = ''15'')) AND (L.ESTORNO IS NULL)) AND ');
        Add('   (D.RECPAG = :RECPAG) AND ');
        Add('   (D.IDPESSOA = :IDPESSOA) AND ');
        Add('   (R.IDUSUARIOINCLUSAO = USUARIO.IDPESSOA) AND ');
        Add('   (TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM) AND ');
        Add('   (RTRIM(TOTLOTE.NUMCHQBORDERO) = RTRIM(TOTDOCUM.NUMCHQBORDERO)) AND   RTRIM(TOTLOTE.NUMCHQBORDERO) =  RTRIM(R.NUMCHQBORDERO) AND ');
//        Add('   (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('   ((L.CODDOCUMENTO = R.CODDOCUMENTO) AND (L.NUMLANCTO = R.NUMLANCTO)) AND ');
        Add('   (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');

        // Ricardo A. SOL 121301, 131302 KTN: 581910, 581900
        //Add('   (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO)) AND ');

        //edilaine SIG114951 : inicio
        // Ricardo A. SOL 122354 KTN 598743
        //Add('   (RTRIM(M.NUMCHQBORDERO) = RTRIM(R.NUMCHQBORDERO) AND (M.CODLANCFINANC = R.CODLANCFINANC)) AND ');
        Add('   (M.CODLANCFINANC = R.CODLANCFINANC) AND ');
        //edilaine SIG114951 : fim

        Add( strFiltros );
        Add('   (D.IDFORCLI = P.IDPESSOA) ');

        //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início
        Add('  and not exists (select 1 from documxdocum dxd where dxd.iddocumento = d.coddocumento) ');
        //Bruno Bastos - Sol 129053 - Kintana: 704787 - Fim

        //Bruno Bastos - Pend. 25122
        Add('    AND (R.CODPORTFORMA = PTF.CODPORTFORMA) ');

        Add(' ORDER BY ');
        Add('   R.CODLANCFINANC ');
      end;

      Prepare;
      ParamByName('RECPAG').AsString  := ParamIntegra.RecPag;
      ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

      // Ricardo A. SOL: 90776-90777 KTN: 383148-38151
      if ParamExists( 'pDataInicial' ) then
        ParamByName('pDataInicial').AsDate   := CmpSelLotes.ParamValues[0].AsDateTime;

      if ParamExists( 'pDataFinal' ) then
        ParamByName('pDataFinal').AsDate   := CmpSelLotes.ParamValues[1].AsDateTime;

      if ParamExists( 'pPessoa' ) then
        ParamByName( 'pPessoa' ).AsInteger := CmpSelLotes.ParamValues[ 2 ].AsInteger;

      if ParamExists( 'pDocumento' ) then
        ParamByName( 'pDocumento' ).AsInteger := CmpSelLotes.ParamValues[ 3 ].AsInteger;

      if ParamExists( 'pValor' ) then
        ParamByName( 'pValor' ).AsFloat := CmpSelLotes.ParamValues[ 4 ].AsFloat;

      if ParamExists( 'pLote' ) then
        if ParamIntegra.RecPag = 'P' then
          ParamByName( 'pLote' ).AsString := CmpSelLotes.ParamValues[ 5 ].AsString
        else
          ParamByName( 'pLote' ).AsInteger := CmpSelLotes.ParamValues[ 5 ].AsInteger;

      if ParamExists( 'pForma' ) then
        ParamByName( 'pForma' ).AsInteger := CmpSelLotes.ParamValues[ 6 ].AsInteger;

      if ParamExists( 'pUsuario' ) then
        ParamByName( 'pUsuario' ).AsInteger := CmpSelLotes.ParamValues[ 7 ].AsInteger;

      Open();
    end;


    // verifica se a consulta retornou algum registro
    if CdsPagamentos.IsEmpty then
      MessageDlg('A consulta atual não retornou registro. Altere os critérios' +
        ' e execute a consulta novamente.', mtWarning, [mbOK], 0)
    else
      // busca todos os documentos pertecentes aos lotes dos documentos buscados
      LocalizaLoteDocumento( cdsPagamentos );
  end;
end;

procedure TFrmAlteraExcluiPagto.ActSelecionarExecute(
  Sender: TObject);
var
  strSQL: String;
Begin
  Inherited;
   If Not ChkBx_DesfazerBaixaETL.Checked Then
   Begin
         //Helen - SOL : 156757 Kintana : 1277615
         CdsPagamentos.Filter   := 'NUMCHQBORDERO = ' + QuotedStr(CdsPagamentos.FieldByName('NUMCHQBORDERO').asString);
         CdsPagamentos.Filtered := True;
        //Helen - SOL : 156757 Kintana : 1277615 - Fim
        //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início
        CdsPagamentos.first;
        CdsSelecionados.disableControls;    //edilaine SIG121878
        While Not CdsPagamentos.eof Do
        Begin
             cdsAux.Data := CtrlExcluiEstornaBaixaLote.BuscaDocFilho(CdsPagamentos.FieldByName('CODDOCUMENTO').AsInteger);
             //    cdsAux.First;
             while not cdsAux.eof do
             begin
                MoveFields(cdsAux, CdsSelecionados, OpInserir, True);
             end;

             //edilaine SIG121878 : inicio
             if CdsSelecionados.Locate('CODLANCFINANC', CdsPagamentos.FieldByName('CODLANCFINANC').AsString,[]) then
             begin
               CdsPagamentos.Delete;
               continue;
             end;
             //edilaine SIG121878 : fim

            //  CtrlExcluiEstornaBaixaLote.MoveRegistros(CdsAux, CdsSelecionados);
                //Marcos Luiz SOL 135095 Kintana 815991
             cdsAux2.Data := CtrlExcluiEstornaBaixaLote.BuscaDocEncontroContas(CdsPagamentos.FieldByName('CODDOCUMENTO').AsInteger,
                                                                               //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362
                                                                               CdsPagamentos.FieldByName('NUMLOTE').AsString,
                                                                               CdsPagamentos.FieldByName('CODLANCFINANC').AsString    //edilaine SIG114951
                                                                               );

            //    cdsAux2.First;
            while not cdsAux2.eof do
            begin
              //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362 comentado -
              //if not CdsSelecionados.Locate('CODDOCUMENTO', cdsAux2.FieldByName('CODDOCUMENTO').AsString, []) then //Bruno Bastos - Sol: 140878 - Kintana: 885763

              //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362 - adicionado no campo NUMLOTE no locate
              if not CdsSelecionados.Locate('CODDOCUMENTO;NUMLOTE',
                                            VarArrayOf([cdsAux2.FieldByName('CODDOCUMENTO').AsString,
                                                        //cdsAux2.FieldByName('NUMLOTE').value])        //edilaine SIG121878
                                                        cdsAux2.FieldByName('NUMLOTE').AsInteger])      //edilaine SIG121878
                                            ,[]) then //Bruno Bastos - Sol: 140878 - Kintana: 885763
                MoveFields(cdsAux2, CdsSelecionados, OpInserir, True)
              else
                cdsAux2.Next;
            End;
            CdsPagamentos.Delete;
            //    CdsPagamentos.Next;
        End;
        CdsSelecionados.EnableControls;    //edilaine SIG121878

        //Helen - SOL : 156757 Kintana : 1277615
        CdsPagamentos.Filter   := '';
        CdsPagamentos.Filtered := False;
        //Helen - SOL : 156757 Kintana : 1277615 - Fim
   End
   Else
       //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início
       If cdsSelecionados.IsEmpty then
          CtrlExcluiEstornaBaixaLote.MoveRegistros(CdsPagamentos, CdsSelecionados)
end;

procedure TFrmAlteraExcluiPagto.CdsPagamentosAfterOpen(
  DataSet: TDataSet);
Begin
  Inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
End;




function TFrmAlteraExcluiPagto.ExisteDocumConciliadoFinanceiro: boolean;
var
  sCodFinanc,sCodFinancAnterior: string;

begin
   Result := True;
   CdsSelecionados.DisableControls;
   CdsSelecionados.First;

   while not CdsSelecionados.Eof do
   begin
      if Trim(sCodFinancAnterior) <> CdsSelecionados.FieldByName('CODLANCFINANC').AsString then
      begin
         // Monta o array de Codlancfinanc
         if Trim(sCodFinanc) <> '' then
            sCodFinanc := sCodFinanc + ',' + CdsSelecionados.FieldByName('CODLANCFINANC').AsString
         else
            sCodFinanc := CdsSelecionados.FieldByName('CODLANCFINANC').AsString;
         sCodFinancAnterior := CdsSelecionados.FieldByName('CODLANCFINANC').AsString;
      end;

      CdsSelecionados.Next;
   end;
   
   CdsSelecionados.EnableControls;

   try
      Application.CreateForm(TFrmDocumConcFinan,FrmDocumConcFinan);
      if not FrmDocumConcFinan.BuscaDocumFinanceiro(sCodFinanc) then
      begin
            FrmDocumConcFinan.ShowModal;
            Result := (FrmDocumConcFinan.ModalResult = mrCancel);
      end
      else
         Result := false;

   finally
      FrmDocumConcFinan.Release;
   end;

end;



// 14/06/2008 - 28197 André tavares
procedure TFrmAlteraExcluiPagto.CdsSelecionadosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Bruno Bastos - Sol: 140878 - Kintana: 885763 - LblQtdDocs.Caption := 'Qtd. de Baixas a Processar: '+ intToStr(CdsSelecionados.RecordCount + 1);
  LblQtdDocs.Caption := 'Qtd. de Baixas a Processar: '+ intToStr(CdsSelecionados.RecordCount); //Bruno Bastos - Sol: 140878 - Kintana: 885763
  LblQtdDocs.Repaint;
end;

procedure TFrmAlteraExcluiPagto.DsSelecionadosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  //Bruno Bastos - Sol: 140878 - Kintana: 885763 - LblQtdDocs.Caption := 'Qtd. de Baixas a Processar: '+ intToStr(CdsSelecionados.RecordCount + 1);
  LblQtdDocs.Caption := 'Qtd. de Baixas a Processar: '+ intToStr(CdsSelecionados.RecordCount); //Bruno Bastos - Sol: 140878 - Kintana: 885763
  LblQtdDocs.Repaint;
end;

procedure TFrmAlteraExcluiPagto.LocalizaLoteDocumento(
  var cdsOrigem: TCMClientDataSet);
var
  strSQL, strParam, strCampoLote: string;
  qryTemp: TCMwwQuery;
  dspTemp: TDatasetProvider;
  cdsTemp: TClientDataSet;
  lstLotes, lstDocumentos, lstDatas, lstCodigoPln, lstLancFinan: TStringList;
  I: Integer;
begin
  // Ricardo A. SOL: 90776-90777 KTN: 383148-383151
  if ParamIntegra.RecPag = 'P' then
  begin
    strParam := '(DECODE(R.NUMLOTE,NULL,R.NUMCHQBORDERO,R.NUMLOTE) = :pLote) AND ';
    strCampoLote := 'TO_CHAR(DECODE(R.NUMLOTE,NULL,R.NUMCHQBORDERO,R.NUMLOTE)) AS LOTE, ';
  end
  else
  begin
    strParam := '(RTRIM(R.NUMCHQBORDERO) = :pLote) AND ';
    strCampoLote := 'R.NUMCHQBORDERO AS LOTE, ';
  end;

  strSQL :=
         'SELECT ' +
                 'P.RAZAOSOCIAL AS NOME, ' +
                 'D.NODOCUMENTO, ' +
                 'D.COMPLDOCUMENTO, ' +
                 'L.DATALANCTO, ' +
                 'L.VALOR, ' +
                 'L.VALOROUTRAMOEDA, ' +
                 'D.CODDOCUMENTO, ' +
                 'L.NUMLANCTO, ' +
                 'L.PLNCODIGO, ' +
                 'R.CODLANCFINANC, ' +
                 'R.NUMCHQBORDERO, ' +
                 'L.OPERACAO, ' +
                 'R.NUMLOTE, ' +
                 'R.DATACFLOAT, ' +
                 'R.CODLANCNAOIDENT, ' +
                 strCampoLote +
                 'L.NUMLOTEMANUAL, ' +
                 'D.FLGTIPODOCUMENTO, ' +
                 'PTF.DESCRICAO ' +
         'FROM ' +
              'DOCUMENTO D, ' +
	      'LANCTODOCUM L, ' +
	      'RECBTOPAGTO R, ' +
	      'PESSOA P, ' +
	      'PORTADORFORMA PTF ' +
         'WHERE ' +
	       '(D.RECPAG                     = ''' + ParamIntegra.RecPag + ''') AND ' +
	       '(D.IDPESSOA                   = ' + IntToStr( Sistema.IdEmpresa ) + ') AND ' +
	       strParam +
	       '((L.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
	       '(L.NUMLANCTO = R.NUMLANCTO)) AND ' +
	       '(L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
	       '(D.IDFORCLI = P.IDPESSOA)  AND ' +
	       '(R.CODPORTFORMA = PTF.CODPORTFORMA) AND ' +

               // Ricardo A. SOL 116951, 116952 KTN: 550407, 550408
               '(L.DATALANCTO = :pData) AND' +
               '(L.PLNCODIGO = :pCodigoPln) AND' +
               '(R.CODLANCFINANC = :pLancFinan) AND' +


               '(D.CODDOCUMENTO <> :pDocumento)';

  qryTemp := TCMwwQuery.Create( nil );
  dspTemp := TDataSetProvider.Create( nil );

  // dataset 1 encarregado de ser receber os dados da consulta
  cdsTemp := TCMClientDataSet.Create( nil );

  // encarregado de armazenar os lotes que serão buscados
  lstLotes := TStringList.Create();

  // encarregado de armazenar as datas dos documentos
  lstDatas := TStringList.Create();

  // encarregado de armazenar as códigos pln dos documentos
  lstCodigoPln := TStringList.Create();

  // encarregado de armazenar as código lancfinan dos documentos
  lstLancFinan := TStringList.Create();

  // lista o código do documento para que não se repita
  lstDocumentos := TStringList.Create();
  try
    qryTemp.DatabaseName := 'BaseDados';
    dspTemp.DataSet := qryTemp;
    qryTemp.SQL.Text := strSQL;
    qryTemp.Prepare();

    cdsOrigem.DisableControls();
    try

      // armazena os lotes que serão buscados
      cdsOrigem.First();
      while not cdsOrigem.Eof do
      begin
        if ( lstLotes.IndexOf( Trim( cdsOrigem.FieldByName( 'LOTE' ).AsString ) ) = -1 ) then
          lstLotes.Add( Trim( cdsOrigem.FieldByName( 'LOTE' ).AsString ) )
        else
          lstLotes.Add( '' );

        lstDocumentos.Add( cdsOrigem.FieldByName( 'CODDOCUMENTO' ).AsString );

        // Ricardo A. SOL 116951, 116952 KTN: 550407, 550408
        lstDatas.Add( cdsOrigem.FieldByName( 'DATALANCTO' ).asString );
        lstCodigoPln.Add( cdsOrigem.FieldByName( 'PLNCODIGO' ).asString );
        lstLancFinan.Add( cdsOrigem.FieldByName( 'CODLANCFINANC' ).asString );
        cdsOrigem.Next();
      end;

      for I := 0 to lstLotes.Count -1 do
      begin

        // lstLotes será vazio para lotes que já foram buscados
        if ( lstLotes[ I ] <> '' ) then
        begin

          // prepara a query
          cdsTemp.Close();
          qryTemp.Close();
          cdsTemp.SetProvider( dspTemp );
          qryTemp.ParamByName( 'pLote' ).Value      := lstLotes[ I ];
          qryTemp.ParamByName( 'pDocumento' ).Value := lstDocumentos[ I ];

          // Ricardo A. SOL 116951, 116952 KTN: 550407, 550408
          qryTemp.ParamByName( 'pData' ).AsDate     := StrToDate( lstDatas[ I ] );
          qryTemp.ParamByName( 'pCodigoPln' ).Value := lstCodigoPln[ I ];
          qryTemp.ParamByName( 'pLancFinan' ).Value := lstLancFinan[ I ];
          cdsTemp.Open();

          if not cdsTemp.IsEmpty then
          begin

            cdsTemp.First();
            while not cdsTemp.Eof do
            begin
              if ( lstDocumentos.IndexOf( cdsTemp.FieldByName( 'CODDOCUMENTO' ).AsString  ) = -1 ) then
              begin
                MoveFields( cdsTemp, cdsOrigem, opInserir, False );

                // armazena o documento para que não seja inserido novamente
                lstDocumentos.Add( cdsTemp.FieldByName( 'CODDOCUMENTO' ).AsString );
              end;
              cdsTemp.Next();
            end;
          end;
        end;
      end;
      cdsOrigem.First();
    finally
      cdsOrigem.EnableControls();
    end;
  finally
    qryTemp.UnPrepare();
    FreeAndNil( qryTemp );
    FreeAndNil( dspTemp );
    FreeAndNil( cdsTemp );
    lstLotes.Clear();
    FreeAndNil( lstLotes );
    lstDocumentos.Clear();
    FreeAndNil( lstDocumentos );
    lstDatas.Clear();
    FreeAndNil( lstDatas );
    lstLancFinan.Clear();
    FreeAndNil( lstLancFinan );
    lstCodigoPln.Clear();
    FreeAndNil( lstCodigoPln );
  end;
end;
// Número do SOL: 124570 2982 Kintana 103005 - Desfazer Baixa ETL Início







Function TFrmAlteraExcluiPagto.PegaCaminhoETL(pRECPag: String): String;
Begin
   CdsBaixaETL.Close;
   CMSqlBaixaETL.SQL.Clear;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   //CMSqlBaixaETL.SQL.Add('SELECT P.PATHETL ');
   if Copy(UpperCase(Trim(Sistema.AliasServidor)),1,8) = 'PRODUCAO' then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
     CMSqlBaixaETL.SQL.Add('SELECT P.PATHETLPRODUCAO as PATHETL ')
   else
     CMSqlBaixaETL.SQL.Add('SELECT P.PATHETLHOM as PATHETL ');
   // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

   CMSqlBaixaETL.SQL.Add('FROM PARAMCAP P ');
   CMSqlBaixaETL.SQL.Add('WHERE P.RECPAG = ''' + pRECPag + ''' ');
   CMSqlBaixaETL.Prepare;
   CMSqlBaixaETL.Open;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   //If CdsBaixaETL.IsEmpty Then
   //   Result := 'C:\Planus\temp\ARQUIVO_EXLUI_BAIXA.TXT'
   //Else
   //   Result := CdsBaixaETL.FieldByName('PATHETL').AsString + '\ARQUIVO_EXLUI_BAIXA.TXT'; //CdsETL.FieldByName('PATHETL').AsString + '\ARQUIVO_FAZ_BAIXA.TXT';
   if Trim(CdsBaixaETL.FieldByName('PATHETL').AsString) <> '' then
     Result := CdsBaixaETL.FieldByName('PATHETL').AsString + '\ARQUIVO_EXLUI_BAIXA.TXT'
   else
     Result := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\ARQUIVO_EXLUI_BAIXA.TXT';
   // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   
   CdsBaixaETL.Close;
End;

Function TFrmAlteraExcluiPagto.GerarArquivo: Boolean;
Var
   ArqDadosBaixa: TextFile;
   DadosBaixa: String;
   sNomeArq : String;
   sNomeTmp : String;
Begin
   Try
      sNomeArq := PegaCaminhoETL('R');
      sNomeTmp := StringReplace(sNomeArq,'.TXT','.TMP',[rfReplaceAll,rfIgnoreCase]);
      AssignFile(ArqDadosBaixa, sNomeTmp ); // CAMINHO: \\errai\BaixaAutomatica\EventWait
      Rewrite(ArqDadosBaixa);
      CdsSelecionados.First;
      If ((SequenceBaixaETL = 0) Or (IntToStr(SequenceBaixaETL) = EmptyStr)) Then
         GerarSequenceETL;
      DadosBaixa := IntToStr(SequenceBaixaETL) + ';;'; //2 campos
      WriteLN(ArqDadosBaixa, DadosBaixa);
      While Not CdsSelecionados.EOF Do
         Begin
            DadosBaixa := '';
            DadosBaixa := DadosBaixa + CdsSelecionados.FieldByName('CODDOCUMENTO').AsString;
            DadosBaixa := DadosBaixa + ';' + CdsSelecionados.FieldByName('CODLANCFINANC').AsString;
            WriteLN(ArqDadosBaixa, DadosBaixa);
            CdsSelecionados.Next;
         End;
      CloseFile(ArqDadosBaixa);
      If FileExists(sNomeArq) then
        DeleteFile(sNomeArq);
      RenameFile(sNomeTmp,sNomeArq);
      Result := True;
   Except
      Result := False;
   End;

End;


Function TFrmAlteraExcluiPagto.GerarSequenceETL: Integer;
Begin
   CdsBaixaETL.Close;
   CMSqlBaixaETL.SQL.Clear;
   CMSqlBaixaETL.SQL.Add('SELECT sq_baixauto_ctc_processo.NEXTVAL as Sequence FROM DUAL ');
   CMSqlBaixaETL.Prepare;
   CMSqlBaixaETL.Open;
   SequenceBaixaETL := CdsBaixaETL.FieldValues['Sequence'];

   CdsBaixaETL.Close;


End;


Function TFrmAlteraExcluiPagto.InserirDadosBaixaAutoETL(
   pNomeProcesso: String; pUsuario, pModulo: Integer): Boolean;
Begin
   QryETL.Close;
   QryETL.SQL.Clear;
   QryETL.SQL.Add(' INSERT INTO BAIXAUTO_CTC_PROCESSO( ');
   QryETL.SQL.Add(' IDPROCESSO, IDUSUARIO, DATA_INICIO, ');
   QryETL.SQL.Add(' DATA_FIM, IDMODULO, NOME_PROCESSO) ');
   QryETL.SQL.Add(' VALUES ( ');
   QryETL.SQL.Add('' + IntToStr(SequenceBaixaETL) + ' , ''' + IntToStr(pUsuario) + ''' , '); // + IntToStr(SequenceBaixa) +
   QryETL.SQL.Add(' SYSDATE, ');
   QryETL.SQL.Add(' NULL, ''' + IntToStr(pModulo) + ''' , ''' + pNomeProcesso + ''') ');

   Try
      //QryETL.SQL.SaveToFile('c:\baixa.txt');
      QryETL.ExecSQL;





      If ControleObjects.InTransaction Then
         ControleObjects.Commit();

      Result := True;

   Except
      If ControleObjects.InTransaction Then
         ControleObjects.Rollback;
      Result := False;
   End;
   QryETL.Close;
End;

Function TFrmAlteraExcluiPagto.VerificarBaixaETL(
   pProcesso: Integer): Boolean;
Begin
   CdsBaixaETL.Close;
   CMSqlBaixaETL.SQL.Clear;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   //CMSqlBaixaETL.SQL.Add(' SELECT DATA_FIM FROM BAIXAUTO_CTC_PROCESSO ');
   CMSqlBaixaETL.SQL.Add(' SELECT QTDBAIXA FROM BAIXAUTO_CTC_PROCESSO ');
   // FIm - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

   CMSqlBaixaETL.SQL.Add(' WHERE IDPROCESSO = ' + IntToStr(pProcesso) + '');
   CMSqlBaixaETL.SQL.Add('   AND DATA_FIM IS NOT NULL ');
   CMSqlBaixaETL.Prepare;
   CMSqlBaixaETL.Open;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   QtdeBaixaETL := CdsBaixaETL.FieldByName('QTDBAIXA').AsInteger;

   If CdsBaixaETL.IsEmpty Then
     Result := True
   Else
     Result := False;

   CdsBaixaETL.Close;

End;



Function TFrmAlteraExcluiPagto.GerarArquivoLOG(
   pProcesso: Integer): Boolean;
Var
   TextArquivo: TextFile;
   DadosLOG: String;
   CaminhoLOG: String;

   Procedure pegarCaminhoLOG;
   Begin
      CdsBaixaETL.Close;
      CMSqlBaixaETL.SQL.Clear;
      CMSqlBaixaETL.SQL.Add(' select caminhoarquivo from paramglobal ');
      CMSqlBaixaETL.Open;
      CaminhoLOG := CdsBaixaETL.FieldValues['caminhoarquivo'];
      CdsBaixaETL.Close;
   End;

Begin
   Try
      pegarCaminhoLOG;
      CdsBaixaETL.Close;
      CMSqlBaixaETL.SQL.Clear;
      CMSqlBaixaETL.SQL.Add(' select lp.dsc_processo || '';'' || Erro as dsc_processo  ');
      CMSqlBaixaETL.SQL.Add(' from cm.baixauto_log_processo LP ');
      CMSqlBaixaETL.SQL.Add(' where idprocesso = ' + IntToStr(pProcesso) + '');
      //CMSqlBaixaETL.SQL.Add(' and lp.tipo_processo = ''ERRO'' ');
      CMSqlBaixaETL.SQL.Add(' ORDER BY TIPO_PROCESSO ');
      CMSqlBaixaETL.Open;
      If Not CdsBaixaETL.IsEmpty Then
         Begin
            AssignFile(TextArquivo, CaminhoLOG + '\LogDesfazerBaixaETL.csv');
            Rewrite(TextArquivo);
            While Not CdsBaixaETL.EOF Do
               Begin
                  DadosLOG := '';
                  DadosLOG := CdsBaixaETL.FieldValues['dsc_processo'];
                  WriteLN(TextArquivo, DadosLOG);
                  CdsBaixaETL.Next;
               End;
            CloseFile(TextArquivo);
         End;
      Result := True;
   Except
      Result := False;
   End;
End;
// Número do SOL: 124570 2982 Kintana 103005 - Desfazer Baixa ETL Fim

Procedure TFrmAlteraExcluiPagto.FormShow(Sender: TObject);
Begin
   Inherited;
   If (Sistema.IdModulo <> 4) Then
      Begin
         ChkBx_DesfazerBaixaETL.Checked := false;
         ChkBx_DesfazerBaixaETL.Visible := false;
      End;
End;

End.

