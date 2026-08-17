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
  uCtrlFinanc;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  Private
    { Private declarations }
    CtrlExcluiEstornaBaixaLote : TCtrlExcluiEstornaBaixaLote;

    //  Rodolpho da Silva - P: 19995 - 17/08/2005
    CtrlFinanc: TCtrlFinanc;

    sTipoDoc : String;

    Procedure LimpaDocumentos;


    //  Rodolpho da Silva - P: 19422 - 10/06/2005
    function ExisteDocumConciliadoFinanceiro : boolean;



  Public
    { Public declarations }
  End;

Var
  FrmAlteraExcluiPagto: TFrmAlteraExcluiPagto;




Implementation

Uses
  uDataBase, uCtrlParamIntegra, uSistema, uModulo, uCMTypes, uMensErro,
  FDocumConcFinan;

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

  CtrlExcluiEstornaBaixaLote.CdsExcluidos := CdsSelecionados;

  CtrlExcluiEstornaBaixaLote.InitializeAs(ParamIntegra);

  CmpSelLotes.ParamValues[0].AsDateTime := Date;
  CmpSelLotes.ParamValues[1].AsDateTime := Date;

  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
  CtrlFinanc.InitializeAs(ParamIntegra);
                                                 
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
  FreeAndNil(CtrlFinanc);
  Inherited;
End;




procedure TFrmAlteraExcluiPagto.btnRecuperarClick(Sender: TObject);
Begin
  Inherited;
  CtrlExcluiEstornaBaixaLote.MoveRegistros(CdsSelecionados, CdsPagamentos);
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
Begin

  try
    bbtnConfirmar.Enabled := false; //andré tavares - pendência 24378 - 05/02/2007

    // Início - Rodolpho da Silva - P: 19422 - 10/06/2005
    if not ExisteDocumConciliadoFinanceiro then
    begin
    // Fim    - Rodolpho da Silva - P: 19422 - 10/06/2005

       Try
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
         if CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,CdsSelecionados.FieldByName('DATALANCTO').AsDateTime) then
         //  Fim - Rodolpho da Silva - P: 19995 - 17/08/2005
            CtrlExcluiEstornaBaixaLote.bbtnConfirmarClick( sTipoDoc,
                                                           SbtEstorna.Down,
                                                           ParamIntegra.EstornaContab )
         // Início - Rodolpho da Silva - P: 19995 - 17/08/2005
         else
            MsgDlg(CtrlFinanc.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         // Fim - Rodolpho da Silva - P: 19995 - 17/08/2005

       Finally
         if (not CdsSelecionados.IsEmpty) and (Trim(CtrlExcluiEstornaBaixaLote.MessageInfo) <> '') then
            MsgDlg( CtrlExcluiEstornaBaixaLote.MessageInfo, 'Aviso', mtInformation, [ mbOk ], 0 );

         bbtnCancelarClick(Self );
         FuncaoGeral.TiraIcone;
         CdsSelecionados.EnableControls;

       End;
    end;

  finally
    bbtnConfirmar.Enabled := true;//andré tavares - pendência 24378 - 05/02/2007
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
Begin
  Inherited;
  LimpaDocumentos;

  If CmpSelLotes.Execute Then Begin
    With SQLPagamentos, Sql Do
    Begin
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
        Add('    DECODE(D.RECPAG,''R'',R.NUMCHQBORDERO,TO_CHAR(DECODE(R.NUMLOTE,NULL,R.NUMCHQBORDERO,R.NUMLOTE))) AS LOTE, ');
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

        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM , ');
        Add('       NUMCHQBORDERO ');
        Add('    FROM ');
        Add('       RECBTOPAGTO RB, ');
        Add('       DOCUMENTO D, ');
        Add('       LANCTODOCUM L ');
        Add('    WHERE ');
        Add('       (D.RECPAG = ''P'')  AND ');
        Add('       (D.IDPESSOA = :IDPESSOA) AND ');

        //David - 13/02/07 - Resolvendo problema na consulta
        Add('       (L.ESTORNO IS NULL) AND ');

        Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('       (L.CODDOCUMENTO = RB.CODDOCUMENTO)  AND ');
        Add('       (RB.NUMLANCTO=L.NUMLANCTO) AND ');
        Add(' (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('       (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('    GROUP BY ');
        Add('       NUMCHQBORDERO) TOTDOCUM, ');
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM , ');
        Add('       NUMCHQBORDERO ');
        Add('    FROM ');
        Add('       RECBTOPAGTO RB, ');
        Add('       DOCUMENTO D, ');
        Add('       LANCTODOCUM L ');
        Add('    WHERE ');
        Add('       (D.RECPAG = ''P'')  AND ');
        Add('       (D.IDPESSOA = :IDPESSOA) AND ');
        Add('       (L.ESTORNO IS NULL) AND ');
        Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('       (L.CODDOCUMENTO = RB.CODDOCUMENTO) AND ');
        Add('       (RB.NUMLANCTO=L.NUMLANCTO) AND ');
        Add(' (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('       (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('    GROUP BY ');
        Add('       NUMCHQBORDERO) TOTLOTE ');
        Add(' WHERE ');
        Add('    (((RTRIM(L.OPERACAO) = ''5'') OR (RTRIM(L.OPERACAO) = ''15'')) AND (L.ESTORNO IS NULL)) AND ');
        Add('    (TOTLOTE.TOTDOCUM=TOTDOCUM.TOTDOCUM) AND ');
        Add('    (RTRIM(TOTLOTE.NUMCHQBORDERO) = RTRIM(TOTDOCUM.NUMCHQBORDERO)) AND ');
        Add('    (RTRIM(TOTLOTE.NUMCHQBORDERO) =  RTRIM(R.NUMCHQBORDERO)) AND ');
        Add('    (D.RECPAG = :RECPAG) AND ');
        Add('    (D.IDPESSOA = :IDPESSOA) AND ');
        Add(' (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('    ((L.CODDOCUMENTO = R.CODDOCUMENTO) AND (L.NUMLANCTO = R.NUMLANCTO)) AND ');
        Add('    (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('    (D.IDFORCLI = P.IDPESSOA) ');

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
        Add('   DECODE(D.RECPAG,''R'',R.NUMCHQBORDERO,TO_CHAR(DECODE(R.NUMLOTE,NULL,R.NUMCHQBORDERO,R.NUMLOTE))) AS LOTE, ');
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
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM, ');
        Add('       NUMCHQBORDERO ');
        Add('    FROM ');
        Add('       RECBTOPAGTO RB, ');
        Add('       DOCUMENTO D, ');
        Add('       LANCTODOCUM L ');
        Add('    WHERE ');
        Add('       (D.RECPAG = ''R'')  AND ');
        Add('       (D.IDPESSOA = :IDPESSOA) AND ');

        //David - 13/02/07 - Resolvendo problema na consulta
        Add('       (L.ESTORNO IS NULL) AND ');

        Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('       (L.CODDOCUMENTO = RB.CODDOCUMENTO) AND ');
        Add('       (RB.NUMLANCTO=L.NUMLANCTO) AND ');
        Add(' (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('       (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('    GROUP BY ');
        Add('        NUMCHQBORDERO  ) TOTDOCUM, ');
        Add('    (SELECT ');
        Add('        COUNT(*) AS TOTDOCUM, ');
        Add('        NUMCHQBORDERO ');
        Add('     FROM ');
        Add('        RECBTOPAGTO RB, ');
        Add('        DOCUMENTO D, ');
        Add('        LANCTODOCUM L ');
        Add('     WHERE ');
        Add('        (D.RECPAG = :RECPAG)  AND ');
        Add('        (D.IDPESSOA = :IDPESSOA)  AND ');
        Add('        (L.ESTORNO IS NULL) AND ');
        Add('        (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('        (L.CODDOCUMENTO = RB.CODDOCUMENTO) AND ');
        Add('        (RB.NUMLANCTO=L.NUMLANCTO) AND ');
        Add(' (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('        (RTRIM(L.OPERACAO) IN (''5'',''15'')) ');
        Add('     GROUP BY ');
        Add('        NUMCHQBORDERO) TOTLOTE ');
        Add(' WHERE ');
        Add('   (((RTRIM(L.OPERACAO) = ''5'') OR (RTRIM(L.OPERACAO) = ''15'')) AND (L.ESTORNO IS NULL)) AND ');
        Add('   (D.RECPAG = :RECPAG) AND ');
        Add('   (D.IDPESSOA = :IDPESSOA) AND ');
        Add('   (TOTLOTE.TOTDOCUM=TOTDOCUM.TOTDOCUM) AND ');
        Add('   (RTRIM(TOTLOTE.NUMCHQBORDERO) = RTRIM(TOTDOCUM.NUMCHQBORDERO)) AND   RTRIM(TOTLOTE.NUMCHQBORDERO) =  RTRIM(R.NUMCHQBORDERO) AND ');
        Add(' (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIN) AND ');
        Add('   ((L.CODDOCUMENTO = R.CODDOCUMENTO) AND (L.NUMLANCTO = R.NUMLANCTO)) AND ');
        Add('   (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
        Add('   (D.IDFORCLI = P.IDPESSOA) ');

        //Bruno Bastos - Pend. 25122
        Add(' AND (R.CODPORTFORMA = PTF.CODPORTFORMA) ');

        Add(' ORDER BY ');
        Add('   R.CODLANCFINANC ');
      end;

      Prepare;
      ParamByName('RECPAG').AsString  := ParamIntegra.RecPag;
      ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      ParamByName('DATAINI').AsDate   := CmpSelLotes.ParamValues[0].AsDateTime;
      ParamByName('DATAFIN').AsDate   := CmpSelLotes.ParamValues[1].AsDateTime;
      Open;
    End;
  End;
end;




procedure TFrmAlteraExcluiPagto.ActSelecionarExecute(
  Sender: TObject);
Begin
  Inherited;
  CtrlExcluiEstornaBaixaLote.MoveRegistros(CdsPagamentos, CdsSelecionados);
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




end.
