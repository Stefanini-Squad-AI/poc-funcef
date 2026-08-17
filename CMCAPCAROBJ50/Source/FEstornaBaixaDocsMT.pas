{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - FEstornaBaixaDocsMT                                               }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{ -----------------------------------------------------------------------------}
{===============================================================================
Rotina    : bbtnConfirmarclick
Data      : 17/08/2005
Autor     : Rodolpho da Silva
Pendência : 19995
Descrição : Não permitir exclusão de baixa de documento quando a disponibilidade
            estiver bloqueada
================================================================================

  Data      : 10/06/2005
  Pendência : 19422
  Autor     : Rodolpho da Silva
  Descrição : Não permitir que documentos conciliados no Controle Financeiro sejam
              exluidos no CAR/CAP sem antes desfazer a regularização dos mesmos
              no Controle Financeiro.
 ===============================================================================}
//------------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Data      : 15/03/2004 (término)
// Autor     : David Ayrolla
// Descrição : Apagar relacionamentos do documento estornado com o lote e o
//             "portador-forma".
// Pendência : 16135
//------------------------------------------------------------------------------


Unit
  FEstornaBaixaDocsMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  MontaSelect, CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlEstornaBaixaDocs,

  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  uCtrlFinanc;

type
  TFrmEstornaBaixaDocsMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    GrdSelecionados: TwwDBGrid;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DsDocsBaixados: TwwDataSource;
    bbtnSelecionaDoc: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    SqlDocsBaixados: TCMSqlParams;
    CdsDocsBaixados: TCMClientDataSet;
    CmpBaixa: TCmParamReport;
    MsDoc: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure GrdSelecionadosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CdsDocsBaixadosAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlEstornaBaixaDocs : TCtrlEstornaBaixaDocs;

    //  Rodolpho da Silva - P: 19995 - 17/08/2005
    CtrlFinanc : TCtrlFinanc;

    procedure LimpaDocumentos;


  public
    { Public declarations }
  end;

var
  FrmEstornaBaixaDocsMT: TFrmEstornaBaixaDocsMT;

implementation

{$R *.DFM}




Uses
  uCtrlParamIntegra, uSistema, uMensErro, uCMTypes, CMProcuraSubTipo,
  uCMDialogs, uCtrlDocumento, uModulo, FDocumConcFinan;

Procedure TFrmEstornaBaixaDocsMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlEstornaBaixaDocs := TCtrlEstornaBaixaDocs.Create;

  CtrlEstornaBaixaDocs.CdsDocsBaixados := CdsDocsBaixados;
  CtrlEstornaBaixaDocs.IdEmpresa    := Sistema.IdEmpresa;
  CtrlEstornaBaixaDocs.IdModulo     := Sistema.IdModulo;
  CtrlEstornaBaixaDocs.IdUsuario    := Sistema.IdUsuario;
  CtrlEstornaBaixaDocs.UsaPlanoPatro:= Sistema.UsaPlanoPatro;
  CtrlEstornaBaixaDocs.IdEspAcesso  := Sistema.IdEspAcesso;
  CtrlEstornaBaixaDocs.PlanoConta   := ParamIntegra.Plano;

  CtrlEstornaBaixaDocs.InitializeAs( ParamIntegra );
                                  

  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
  CtrlFinanc.InitializeAs(ParamIntegra);

  MsDoc.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));

  If ParamIntegra.RecPag = 'P' Then Begin
     CmpBaixa.ParamValues[2].Caption := 'Fornecedor';
     CmpBaixa.ParamValues[2].ProcuraFCSettings.ForCli := fcFornecedor;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
     HelpContext           := 30037;
     bbtnAjuda.HelpContext := 30037;
  End Else Begin
     MsDoc.Colunas.Add('DOCUMENTO.NOSSONUMERO');
     MsDoc.Larguras.Add('20');
     MsDoc.Mascaras.Add('');
     MsDoc.Descricao.Add('Nosso Número');
     MsDoc.TipoDeDado.Add('C');
     MsDoc.SensivelACaixa.Add('S');

     CmpBaixa.ParamValues[2].Caption := 'Cliente';
     CmpBaixa.ParamValues[2].ProcuraFCSettings.ForCli := fcCliente;

    HelpContext           := 40057;
    bbtnAjuda.HelpContext := 40057;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  End;

  LimpaDocumentos;
end;



Procedure TFrmEstornaBaixaDocsMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  FreeAndNil(CtrlEstornaBaixaDocs);
  //  Rodolpho da Silva - P: 19995 - 17/08/2005
  FreeAndNil(CtrlFinanc);
  Inherited;
End;



procedure TFrmEstornaBaixaDocsMT.LimpaDocumentos;
begin
  With SqlDocsBaixados, Sql Do
  Begin
    Clear;

    Add(' SELECT ');
    Add('   D.IDFORCLI,  ');
    Add('   L.OPERACAO, ');
    Add('   L.CODDOCUMENTO, ');
    Add('   L.VALOR, ');
    Add('   L.VALOROUTRAMOEDA, ');
    Add('   L.NUMLANCTO, ');
    Add('   L.DEBCRE, ');
    Add('   RP.CODPORTFORMA, ');
    Add('   LTRIM(RTRIM(RP.NUMCHQBORDERO)) AS NUMCHQBORDERO, ');
    Add('   (0) AS ESTORNA, ');
    Add('   D.NODOCUMENTO, ');
    Add('   D.COMPLDOCUMENTO, ');
    Add('   D.DATAPROGRAMADA, ');
    Add('   P.RAZAOSOCIAL AS NOME, ');
    Add('   RP.CODLANCFINANC, ');
    Add('   PF.DMAIS, ');
    Add('   PF.LANCAFINANC ');
    Add(' FROM ');
    Add('   LANCTODOCUM L, ');
    Add('   RECBTOPAGTO RP, ');
    Add('   DOCUMENTO D, ');
    Add('   PESSOA P, ');
    Add('   PORTADORFORMA PF ');
    Add(' WHERE ');
    Add('    1=2 ');

    Open;
  End;

  bbtnConfirmar.Enabled := False;
end;




Procedure TFrmEstornaBaixaDocsMT.bbtnConfirmarClick(Sender: TObject);
Var
  dDataPagto: TDateTime;
Begin
  Inherited;
  
  If Not CdsDocsBaixados.IsEmpty Then
  Begin
    dDataPagto := Date;
    If InputDate('Estorno de Baixas', 'Indique a Data Para estorno das baixas indicadas', dDataPagto) Then
    Begin
       Try
          // Início - Rodolpho da Silva - P: 19995 - 17/08/2005
          if CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,dDataPagto) then
          // Fim - Rodolpho da Silva - P: 19995 - 17/08/2005
          begin
             If not CtrlEstornaBaixaDocs.bbtnConfirmarClick(dDataPagto, TSistemaLancto(Sistema.IdModulo - 3),
                Modulo.LancaBaixaFloat, Sistema.IdUsuario, Sistema.IdEspAcesso, ParamIntegra.Plano,
                Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada,
                //DAVID - Pendência 16135
                //Parâmetro que indica que os relacionamentos do documento com o lote e o "portador-forma" devem ser excluídos.
                True ) then
                MsgDlg( CtrlEstornaBaixaDocs.MessageInfo, 'Aviso', mtError, [ mbOk ], 0 )
             else
               MsgDlg( 'Estorno Efetuado com Sucesso', 'Aviso', mtInformation, [ mbOk ], 0 );
          end

          // Início - Rodolpho da Silva - P: 19995 - 17/08/2005
          else
             MsgDlg(CtrlFinanc.MessageInfo,'Aviso',mtWarning,[mbOk],0);
          // Fim - Rodolpho da Silva - P: 19995 - 17/08/2005

       Finally
          CdsDocsBaixados.Close;
          SqlDocsBaixados.Open;
       End;
    End;
  End;
End;




procedure TFrmEstornaBaixaDocsMT.GrdSelecionadosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName='ESTORNA') Or (Field.FieldName='VALOR') then
  begin
    AFont.Color:=clNavy;
    ABrush.Color:=$0080FFFF;{Amarelo claro}
  end;
end;




procedure TFrmEstornaBaixaDocsMT.bbtnSelecionaDocClick(Sender: TObject);
Var
  bSelForCli, bSelDataIni, bSelDadtaFin, bSelDocumento: Boolean;
begin
  inherited;

  If CmpBaixa.Execute Then
  Begin
    bSelForCli := (CmpBaixa.ParamValues[2].AsInteger > 0);
    bSelDataIni := Not CmpBaixa.ParamValues[0].IsNull;
    bSelDadtaFin := Not CmpBaixa.ParamValues[1].IsNull;
    bSelDocumento := Trim(CmpBaixa.ParamValues[3].AsString) <> '';

    With SqlDocsBaixados, Sql Do
    Begin
       Clear;
       Add('SELECT L.OPERACAO, L.CODDOCUMENTO, L.VALOR, L.VALOROUTRAMOEDA, ');
       Add('       L.NUMLANCTO, L.DEBCRE, RP.CODPORTFORMA, (LTRIM(RTRIM(RP.NUMCHQBORDERO))) AS NUMCHQBORDERO, ');
       Add('       to_number(LTRIM(RTRIM(RP.NUMCHQBORDERO))) AS NUMCHQBORDERO2, (0) AS ESTORNA,  ');
       Add('       D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAPROGRAMADA, P.RAZAOSOCIAL AS NOME,     ');
       Add('       NVL(RP.CODLANCFINANC,LP.CODLANCFINANC) AS CODLANCFINANC, ');

       Add('       D.IDFORCLI, D.OPERACAO AS OPERORI, D.CODTIPDOC, D.IDMODULO, D.IDPESSOA, D.DATAVENCTO, D.RECPAG,      ');
       Add('       P.NOME AS NOMETABCLI, D.STATUS, D.MOECODIGO, D.PLANO, D.PLACONTA, D.CODSUBCONTA, ');
       Add('       D.CODCENTROCUSTO, D.CODGRUPOCNAB, D.NOSSONUMERO, L.VLRLIQUIDO,                   ');
       Add('       DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO                       ');
       Add('FROM                                                                                 ');
       Add('   DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO RP, PESSOA P, PORTADORFORMA PF,           ');

       // Rodolpho da Silva - P: 19422
       Add('    LOTEXDOCUM LD, LOTEPAGTO LP ');


       Add('WHERE                                                                                ');
       Add('   d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a                             ');
       Add('                   WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and                ');
       Add('                         not exists  (select 1 from UsuarioxTpdocto b                ');
       Add('                                      where recpag = '''+ParamIntegra.recpag+''' and ');
       Add('                                            b.idusuario='+inttostr(sistema.IdUsuario)+') ');
       Add('                                      union                                              ');
       Add('                                      SELECT CODTIPDOC  FROM TIPODOCRECPAG a             ');
       Add('                                      WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and ');
       Add('                                            exists (select 1 from UsuarioxTpdocto b      ');
       Add('                                                    where recpag= '''+ParamIntegra.recpag+''' and ');
       Add('                                                          a.codtipdoc=b.codtipdoc and             ');
       Add('                                                          b.idusuario='+inttostr(sistema.idusuario)+')) ');
       Add('   and ');

       If bSelForCli Then
          Add('   (D.IDFORCLI = ' + IntToStr(CmpBaixa.ParamValues[2].AsInteger) + ') AND ');
       If bSelDocumento Then
          Add('   (D.CODDOCUMENTO = ' + CmpBaixa.ParamValues[3].AsString + ') AND ');
       If bSelDataIni Then
          Add('   (L.DATALANCTO >= TO_DATE(''' + DateToStr(CmpBaixa.ParamValues[0].AsDateTime) + ''',''DD/MM/YYYY'')) AND ');
       If bSelDadtaFin Then
          Add('   (L.DATALANCTO <= TO_DATE(''' + DateToStr(CmpBaixa.ParamValues[1].AsDateTime) + ''',''DD/MM/YYYY'')) AND ');

       Add('    (L.ESTORNO IS NULL)                AND ');
       Add('    (RTRIM(L.OPERACAO) = ''5'')        AND ');
       Add('    (D.RECPAG = ''' + ParamIntegra.RecPag+ ''')    AND ');
       Add('    (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)+ ') AND ');
       Add('    (P.IDPESSOA = D.IDFORCLI)          AND ');
       Add('    (L.CODDOCUMENTO = RP.CODDOCUMENTO) AND ');
       Add('    (L.NUMLANCTO    = RP.NUMLANCTO)    AND ');
       Add('    (PF.CODPORTFORMA= RP.CODPORTFORMA) AND ');

       // Rodolpho da Silva - P: 19422
       Add('    (D.CODDOCUMENTO = LD.CODDOCUMENTO (+)) AND ');
       Add('    (LD.NUMLOTE     = LP.NUMLOTE(+))       AND ');
       Add('    LD.FLGBAIXA(+) <> ''C'' AND '); //andré tavares - 11/05/2006 - O documento não pode estar num lote cancelado

       //DAVID - Pendência 25569 - 22/06/07
       Add('    ( ( LD.FLGESTORNO IS NULL ) OR ( TRIM( LD.FLGESTORNO ) = ''N'' ) ) AND ' );
       

       Add('    (L.CODDOCUMENTO = D.CODDOCUMENTO) order by NUMCHQBORDERO2 ');

       Open;
    End;

    bbtnConfirmar.Enabled := Not CdsDocsBaixados.IsEmpty;
  End;
end;



procedure TFrmEstornaBaixaDocsMT.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  CdsDocsBaixados.First;
  While Not CdsDocsBaixados.Eof Do
  Begin
     CdsDocsBaixados.Edit;
     CdsDocsBaixados.FieldByName('ESTORNA').AsInteger := 1;
     CdsDocsBaixados.Post;
     CdsDocsBaixados.Next;
  End;
end;




procedure TFrmEstornaBaixaDocsMT.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  CdsDocsBaixados.First;
  While Not CdsDocsBaixados.Eof Do
  Begin
    CdsDocsBaixados.Edit;
    If CdsDocsBaixados.FieldByName('ESTORNA').AsInteger = 1 Then
      CdsDocsBaixados.FieldByName('ESTORNA').AsInteger := 0
    Else
      CdsDocsBaixados.FieldByName('ESTORNA').AsInteger := 1;
    CdsDocsBaixados.Post;
    CdsDocsBaixados.Next;
  End;
end;




procedure TFrmEstornaBaixaDocsMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaDocumentos;
end;




procedure TFrmEstornaBaixaDocsMT.CdsDocsBaixadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;







end.
