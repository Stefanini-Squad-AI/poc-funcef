// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 03.02.2004
// Pendência   : 16044
// Rotina      : qrySubTipo e Tela
// Alteração   : Criação do parametro FLGGERACAR
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/10/2003
// Pendência   : 15152
// Alteração   : Inserir na tela o campo Mascara da Matrícula
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
// Rotina    : qryRubrica
// Autor(a)  : Gleyber
// Data      : 10/10/2002
// Alteração : Permitir a associação de rubricas cadastradas no InterfacePrev com finalidade
//             igual a OUTROS (FLGDESCONTO = 2)
// Pendência : 9682
// -----------------------------------------------------------------------------
unit FCadPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask, wwdbedit,  ExtDlgs, Spin, Wwdbspin, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CMDBLookupCombo, Wwdotdot, Wwdbcomb, CmEventosCadastro,
  ImgList, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, TREdit;

type
  TfrmCadPatro = class(TfrmPessoa)
    tbsPatro: TTabSheet;
    Panel3: TPanel;
    qryFundacao: TwwQuery;
    qryRegra: TwwQuery;
    qryRubrica: TwwQuery;
    qryMoeda: TwwQuery;
    Label26: TLabel;
    pgctrlPatrocinadora: TPageControl;
    tbsInfGerais: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lblFundacao: TLabel;
    lblRegraMatricula: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblkpcmbFundacao: TwwDBLookupCombo;
    dblkpcmbRegra: TwwDBLookupCombo;
    sbtnOpcoes: TBitBtn;
    dbchkAceitaNaoID: TDBCheckBox;
    dbchkAlteraDados: TDBCheckBox;
    dbeMascMat: TwwDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label18: TLabel;
    dblkpcmbRubRemTotal: TwwDBLookupCombo;
    Label17: TLabel;
    dblkpcmbRegRemTotal: TwwDBLookupCombo;
    Label14: TLabel;
    dblkpcmbRubSalPartic: TwwDBLookupCombo;
    lblRegraCalcSalPart: TLabel;
    dblkpcmbRegraSalPart: TwwDBLookupCombo;
    Label13: TLabel;
    dblkpcmbRubSalBeneficio: TwwDBLookupCombo;
    Label15: TLabel;
    dblkpcmbRegraSalBeneficio: TwwDBLookupCombo;
    Label23: TLabel;
    dblkpcmbRubManut: TwwDBLookupCombo;
    Label24: TLabel;
    dblkpcmbManutParc: TwwDBLookupCombo;
    Label20: TLabel;
    dblkpcmbSalBenefAuxDoenca: TwwDBLookupCombo;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qrySubTipoBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure sbtnOpcoesClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     bTelaOpcoesPatro: boolean;
     sNumOpcoes : string;
     sNomeValorBase1Contrib, sNomeValorBase2Contrib, sNomeValorBase3Contrib,
     sNomeValorBase4Contrib, sNomeValorBase5Contrib, sNomeValorBase6Contrib: string;
     iIdRegraOp1, iIdRegraOp2, iIdRegraOp3,iIdRegraOp4, iIdRegraOp5, iIdRegraOp6,
     iIdRegraCalcOp1, iIdRegraCalcOp2, iIdRegraCalcOp3,
     iIdRegraCalcOp4, iIdRegraCalcOp5, iIdRegraCalcOp6 : integer;

  public
    { Public declarations }
  end;

var
  frmCadPatro: TfrmCadPatro;

implementation

uses UAdmPrev, FPedeOpcoesPatro, FPedeOpcoesContrib, Usistema;

{$R *.DFM}

procedure TfrmCadPatro.FormActivate(Sender: TObject);
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.Open;

  qryFundacao.Locate('IDPESSOA',iIdFundacao,[]);
  dblkpcmbFundacao.Text := qryFundacao.FieldByName('NOME').AsString;

  qryRegra.Close;
  qryRegra.Open;
  qryRubrica.Close;
  qryRubrica.ParamByName('piIdPessoa').AsINTEGER := qry.FieldByName('IDPESSOA').ASINTEGER;
  qryRubrica.Open;
  qryMoeda.Close;
  qryMoeda.Open;

  bTelaOpcoesPatro := false;
end;

procedure TfrmCadPatro.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryRubrica.Close;
  qryRubrica.ParamByName('piIdPessoa').AsINTEGER := qry.FieldByName('IDPESSOA').ASINTEGER;
  qryRubrica.Open;
end;

procedure TfrmCadPatro.qrySubTipoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not prmflgMultiFundacao
  then qrySubTipo.FieldByName('IdFundacao').AsInteger := iIdFundacao;

  if bTelaOpcoesPatro
  then begin
     qrysubtipo.FieldByName('NUMOPCOES').AsString         := Trim(sNumOpcoes);
     qrysubtipo.FieldByName('IDREGRAVALIDAOP1').AsInteger := iIdRegraOp1;
     qrysubtipo.FieldByName('IDREGRAVALIDAOP2').AsInteger := iIdRegraOp2;
     qrysubtipo.FieldByName('IDREGRAVALIDAOP3').AsInteger := iIdRegraOp3;
     qrysubtipo.FieldByName('IDREGRAVALIDAOP4').AsInteger := iIdRegraOp4;
     qrysubtipo.FieldByName('IDREGRAVALIDAOP5').AsInteger := iIdRegraOp5;
     qrysubtipo.FieldByName('IDREGRAVALIDAOP6').AsInteger := iIdRegraOp6;
     qrysubtipo.FieldByName('IDREGRACALCOP1').AsInteger   := iIdRegraCalcOp1;
     qrysubtipo.FieldByName('IDREGRACALCOP2').AsInteger   := iIdRegraCalcOp2;
     qrysubtipo.FieldByName('IDREGRACALCOP3').AsInteger   := iIdRegraCalcOp3;
     qrysubtipo.FieldByName('IDREGRACALCOP4').AsInteger   := iIdRegraCalcOp4;
     qrysubtipo.FieldByName('IDREGRACALCOP5').AsInteger   := iIdRegraCalcOp5;
     qrysubtipo.FieldByName('IDREGRACALCOP6').AsInteger   := iIdRegraCalcOp6;

     

     if iIdRegraOp1 <= 0 then
       
        qrysubtipo.FieldByName('IDREGRAVALIDAOP1').Clear;

     if iIdRegraOp2 <= 0 then
      
        qrysubtipo.FieldByName('IDREGRAVALIDAOP2').Clear;

     if iIdRegraOp3 <= 0 then
       
         qrysubtipo.FieldByName('IDREGRAVALIDAOP3').Clear;

     if iIdRegraOp4 <= 0 then
       
        qrysubtipo.FieldByName('IDREGRAVALIDAOP4').Clear;

     if iIdRegraOp5 <= 0 then
      
        qrysubtipo.FieldByName('IDREGRAVALIDAOP5').Clear;

     if iIdRegraOp6 <= 0 then
       
         qrysubtipo.FieldByName('IDREGRAVALIDAOP6').Clear;


     if iIdRegraCalcOp1 <= 0 then
        
        qrysubtipo.FieldByName('IDREGRACALCOP1').Clear;

     if iIdRegraCalcOp2 <= 0 then
        
        qrysubtipo.FieldByName('IDREGRACALCOP2').Clear;

     if iIdRegraCalcOp3 <= 0 then
        
        qrysubtipo.FieldByName('IDREGRACALCOP3').Clear;

     if iIdRegraCalcOp4 <= 0 then
        
        qrysubtipo.FieldByName('IDREGRACALCOP4').Clear;

     if iIdRegraCalcOp5 <= 0 then
        
        qrysubtipo.FieldByName('IDREGRACALCOP5').Clear;

     if iIdRegraCalcOp6 <= 0 then
        
        qrysubtipo.FieldByName('IDREGRACALCOP6').Clear;

     qrysubtipo.FieldByName('NOMEVALORBASE1').AsString := Trim(sNomeValorBase1Contrib);
     qrysubtipo.FieldByName('NOMEVALORBASE2').AsString := Trim(sNomeValorBase2Contrib);
     qrysubtipo.FieldByName('NOMEVALORBASE3').AsString := Trim(sNomeValorBase3Contrib);
     qrysubtipo.FieldByName('NOMEVALORBASE4').AsString := Trim(sNomeValorBase4Contrib);
     qrysubtipo.FieldByName('NOMEVALORBASE5').AsString := Trim(sNomeValorBase5Contrib);
     qrysubtipo.FieldByName('NOMEVALORBASE6').AsString := Trim(sNomeValorBase6Contrib);
   end;
end;

procedure TfrmCadPatro.FormCreate(Sender: TObject);
begin
  Pessoa.SQLFiltro.Clear; 
  inherited;
  Pessoa.FormCaption  := 'Patrocinadora';
  lblFundacao.Caption := 'Fundação';
  tbcDetalhe.Tabs.Add('Patrocinadora');
  dblkpcmbFundacao.Visible := prmflgMultiFundacao;
  lblFundacao.Visible      := prmflgMultiFundacao;
end;

procedure TfrmCadPatro.sbtnOpcoesClick(Sender: TObject);
var
  sRegraOp1, sRegraOp2, sRegraOp3, sRegraOp4, sRegraOp5, sRegraOp6: string;
  sRegraCalcOp1, sRegraCalcOp2, sRegraCalcOp3,
  sRegraCalcOp4, sRegraCalcOp5, sRegraCalcOp6: string;

  ilFlgObrigaOp1, ilFlgObrigaOp2, ilFlgObrigaOp3,
  ilFlgAlteraOp1, ilFlgAlteraOp2, ilFlgAlteraOp3,
  ilFlgObrigaOp4, ilFlgObrigaOp5, ilFlgObrigaOp6,
  ilFlgAlteraOp4, ilFlgAlteraOp5, ilFlgAlteraOp6 : integer;
begin
  inherited;
  bTelaOpcoesPatro := True;

  ilFlgObrigaOp1 := 0;
  ilFlgObrigaOp2 := 0;
  ilFlgObrigaOp3 := 0;

  ilFlgAlteraOp1 := 0;
  ilFlgAlteraOp2 := 0;
  ilFlgAlteraOp3 := 0;

  ilFlgObrigaOp4 := 0;
  ilFlgObrigaOp5 := 0;
  ilFlgObrigaOp6 := 0;

  ilFlgAlteraOp4 := 0;
  ilFlgAlteraOp5 := 0;
  ilFlgAlteraOp6 := 0;

  
  if qrysubtipo.FieldByName('IdRegraValidaOp1').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qrysubtipo.Fieldbyname('IdRegraValidaOp1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp1 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp1 := '';
  end;

  if qrysubtipo.FieldByName('IdRegraValidaOp2').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qrysubtipo.Fieldbyname('IdRegraValidaOp2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp2 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp2 := '';
  end;

  if qrysubtipo.FieldByName('IdRegraValidaOp3').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qrysubtipo.Fieldbyname('IdRegraValidaOp3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp3 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp3 := '';
  end;

  if qrysubtipo.FieldByName('IdRegraValidaOp4').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qrysubtipo.Fieldbyname('IdRegraValidaOp4').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp4 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp4 := '';
  end;

  if qrysubtipo.FieldByName('IdRegraValidaOp5').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qrysubtipo.Fieldbyname('IdRegraValidaOp5').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp5 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp5 := '';
  end;

  if qrysubtipo.FieldByName('IdRegraValidaOp6').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qrysubtipo.Fieldbyname('IdRegraValidaOp6').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp6 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp6 := '';
  end;

  // Preencher regras de Calculo se já houverem
  if qrysubtipo.FieldByName('IDREGRACALCOP1').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qrysubtipo.Fieldbyname('IDREGRACALCOP1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp1 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp1 := '';
  end;

  if qrysubtipo.FieldByName('IDREGRACALCOP2').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qrysubtipo.Fieldbyname('IDREGRACALCOP2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp2 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp2 := '';
  end;

  if qrysubtipo.FieldByName('IDREGRACALCOP3').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qrysubtipo.Fieldbyname('IDREGRACALCOP3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp3 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp3 := '';
  end;

  if qrysubtipo.FieldByName('IDREGRACALCOP4').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qrysubtipo.Fieldbyname('IDREGRACALCOP4').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp4 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp4 := '';
  end;

  if qrysubtipo.FieldByName('IDREGRACALCOP5').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qrysubtipo.Fieldbyname('IDREGRACALCOP5').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp5 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp5 := '';
  end;

  if qrysubtipo.FieldByName('IDREGRACALCOP6').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qrysubtipo.Fieldbyname('IDREGRACALCOP6').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp6 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp6 := '';
  end;

  frmPedeOpcoesPatro := TfrmPedeOpcoesPatro.Create(Application);
  with frmPedeOpcoesPatro do
  begin

    if qrysubtipo.state in [dsinsert,dsedit] then
    begin
       pnlFundo.enabled := true;
    end
    else
    begin
       pnlFundo.enabled := false;
    end;

    edPatro.Text := dbedNomeFantasia.Text;


    if qrysubtipo.FieldByName('NUMOPCOES').AsString <> '' then
       spedNumOpcoes.Text  := qrysubtipo.FieldByName('NUMOPCOES').AsString
    else
       spedNumOpcoes.Text  := '1';

    lcsRegraOp1 := sRegraOp1;
    lcsRegraOp2 := sRegraOp2;
    lcsRegraOp3 := sRegraOp3;
    lcsRegraOp4 := sRegraOp4;
    lcsRegraOp5 := sRegraOp5;
    lcsRegraOp5 := sRegraOp6;

    stRegraCalcOp1 := sRegraCalcOp1;
    stRegraCalcOp2 := sRegraCalcOp2;
    stRegraCalcOp3 := sRegraCalcOp3;
    stRegraCalcOp4 := sRegraCalcOp4;
    stRegraCalcOp5 := sRegraCalcOp5;
    stRegraCalcOp6 := sRegraCalcOp6;

    iFlgObrigaOp1  := qrysubtipo.FieldByName('FLGOBRIGAOP1').AsInteger;
    iFlgObrigaOp2  := qrysubtipo.FieldByName('FLGOBRIGAOP2').AsInteger;
    iFlgObrigaOp3  := qrysubtipo.FieldByName('FLGOBRIGAOP3').AsInteger;

    iFlgAlteraOp1  := qrysubtipo.FieldByName('FLGEDITAOP1').AsInteger;
    iFlgAlteraOp2  := qrysubtipo.FieldByName('FLGEDITAOP2').AsInteger;
    iFlgAlteraOp3  := qrysubtipo.FieldByName('FLGEDITAOP3').AsInteger;

    iFlgObrigaOp4  := qrysubtipo.FieldByName('FLGOBRIGAOP4').AsInteger;
    iFlgObrigaOp5  := qrysubtipo.FieldByName('FLGOBRIGAOP5').AsInteger;
    iFlgObrigaOp6  := qrysubtipo.FieldByName('FLGOBRIGAOP6').AsInteger;

    iFlgAlteraOp4  := qrysubtipo.FieldByName('FLGEDITAOP4').AsInteger;
    iFlgAlteraOp5  := qrysubtipo.FieldByName('FLGEDITAOP5').AsInteger;
    iFlgAlteraOp6  := qrysubtipo.FieldByName('FLGEDITAOP6').AsInteger;

    if qrysubtipo.FieldByName('NOMEVALORBASE1').AsString <> '' then
       edNomeValorBase1.Text := qrysubtipo.FieldByName('NOMEVALORBASE1').AsString;

    if qrysubtipo.FieldByName('NOMEVALORBASE2').AsString <> '' then
       edNomeValorBase2.Text := qrysubtipo.FieldByName('NOMEVALORBASE2').AsString;

    if qrysubtipo.FieldByName('NOMEVALORBASE3').AsString <> '' then
       edNomeValorBase3.Text := qrysubtipo.FieldByName('NOMEVALORBASE3').AsString;

    if qrysubtipo.FieldByName('NOMEVALORBASE4').AsString <> '' then
       edNomeValorBase4.Text := qrysubtipo.FieldByName('NOMEVALORBASE4').AsString;

    if qrysubtipo.FieldByName('NOMEVALORBASE5').AsString <> '' then
       edNomeValorBase5.Text := qrysubtipo.FieldByName('NOMEVALORBASE5').AsString;

    if qrysubtipo.FieldByName('NOMEVALORBASE6').AsString <> '' then
       edNomeValorBase6.Text := qrysubtipo.FieldByName('NOMEVALORBASE6').AsString;

    ShowModal;

    sNumOpcoes  := spedNumOpcoes.Text;

    sNomeValorBase1Contrib := edNomeValorBase1.Text;
    sNomeValorBase2Contrib := edNomeValorBase2.Text;
    sNomeValorBase3Contrib := edNomeValorBase3.Text;
    sNomeValorBase4Contrib := edNomeValorBase4.Text;
    sNomeValorBase5Contrib := edNomeValorBase5.Text;
    sNomeValorBase6Contrib := edNomeValorBase6.Text;

    iIdRegraOp1 := lcRegraOp1;
    iIdRegraOp2 := lcRegraOp2;
    iIdRegraOp3 := lcRegraOp3;

    iIdRegraOp4 := lcRegraOp4;
    iIdRegraOp5 := lcRegraOp5;
    iIdRegraOp6 := lcRegraOp6;

    iIdRegraCalcOp1 := iRegraCalcOp1;
    iIdRegraCalcOp2 := iRegraCalcOp2;
    iIdRegraCalcOp3 := iRegraCalcOp3;

    iIdRegraCalcOp4 := iRegraCalcOp4;
    iIdRegraCalcOp5 := iRegraCalcOp5;
    iIdRegraCalcOp6 := iRegraCalcOp6;

    ilFlgObrigaOp1  := iFlgObrigaOp1;
    ilFlgObrigaOp2  := iFlgObrigaOp2;
    ilFlgObrigaOp3  := iFlgObrigaOp3;

    ilFlgObrigaOp4  := iFlgObrigaOp4;
    ilFlgObrigaOp5  := iFlgObrigaOp5;
    ilFlgObrigaOp6  := iFlgObrigaOp6;

    ilFlgAlteraOp1  := iFlgAlteraOp1;
    ilFlgAlteraOp2  := iFlgAlteraOp2;
    ilFlgAlteraOp3  := iFlgAlteraOp3;

    ilFlgAlteraOp4  := iFlgAlteraOp4;
    ilFlgAlteraOp5  := iFlgAlteraOp5;
    ilFlgAlteraOp6  := iFlgAlteraOp6;
  end;

  frmPedeOpcoesPatro.Free;

  if qrysubtipo.state in [dsinsert,dsedit] then
  begin
     qrysubtipo.FieldByName('NUMOPCOES').AsString         := sNumOpcoes;

     qrysubtipo.FieldByName('NOMEVALORBASE1').AsString    := sNomeValorBase1Contrib;
     qrysubtipo.FieldByName('NOMEVALORBASE2').AsString    := sNomeValorBase2Contrib;
     qrysubtipo.FieldByName('NOMEVALORBASE3').AsString    := sNomeValorBase3Contrib;
     qrysubtipo.FieldByName('NOMEVALORBASE4').AsString    := sNomeValorBase4Contrib;
     qrysubtipo.FieldByName('NOMEVALORBASE5').AsString    := sNomeValorBase5Contrib;
     qrysubtipo.FieldByName('NOMEVALORBASE6').AsString    := sNomeValorBase6Contrib;

     if iIdRegraOp1 < 0  then
       
          qrysubtipo.FieldByName('IDREGRAVALIDAOP1').Clear
     else qrysubtipo.FieldByName('IDREGRAVALIDAOP1').AsInteger := iIdRegraOp1;

     if iIdRegraOp2 < 0  then
     
        qrysubtipo.FieldByName('IDREGRAVALIDAOP2').Clear
     else qrysubtipo.FieldByName('IDREGRAVALIDAOP2').AsInteger := iIdRegraOp2;

     if iIdRegraOp3 < 0 then
     
        qrysubtipo.FieldByName('IDREGRAVALIDAOP3').Clear
     else qrysubtipo.FieldByName('IDREGRAVALIDAOP3').AsInteger := iIdRegraOp3;

     if iIdRegraOp4 < 0  then
          qrysubtipo.FieldByName('IDREGRAVALIDAOP4').Clear
     else qrysubtipo.FieldByName('IDREGRAVALIDAOP4').AsInteger := iIdRegraOp4;

     if iIdRegraOp5 < 0  then
        qrysubtipo.FieldByName('IDREGRAVALIDAOP5').Clear
     else qrysubtipo.FieldByName('IDREGRAVALIDAOP5').AsInteger := iIdRegraOp5;

     if iIdRegraOp6 < 0 then
        qrysubtipo.FieldByName('IDREGRAVALIDAOP6').Clear
     else qrysubtipo.FieldByName('IDREGRAVALIDAOP6').AsInteger := iIdRegraOp6;

     if iIdRegraCalcOp1 < 0 then
     
         qrysubtipo.FieldByName('IDREGRACALCOP1').Clear
     else qrysubtipo.FieldByName('IDREGRACALCOP1').AsInteger := iIdRegraCalcOp1;

     if iIdRegraCalcOp2 < 0 then
     
        qrysubtipo.FieldByName('IDREGRACALCOP2').Clear
     else qrysubtipo.FieldByName('IDREGRACALCOP2').AsInteger := iIdRegraCalcOp2;

     if iIdRegraCalcOp3 < 0 then
     
         qrysubtipo.FieldByName('IDREGRACALCOP3').Clear
     else qrysubtipo.FieldByName('IDREGRACALCOP3').AsInteger := iIdRegraCalcOp3;


     if iIdRegraCalcOp4 < 0 then
         qrysubtipo.FieldByName('IDREGRACALCOP4').Clear
     else qrysubtipo.FieldByName('IDREGRACALCOP4').AsInteger := iIdRegraCalcOp4;

     if iIdRegraCalcOp5 < 0 then
        qrysubtipo.FieldByName('IDREGRACALCOP5').Clear
     else qrysubtipo.FieldByName('IDREGRACALCOP5').AsInteger := iIdRegraCalcOp5;

     if iIdRegraCalcOp6 < 0 then
         qrysubtipo.FieldByName('IDREGRACALCOP6').Clear
     else qrysubtipo.FieldByName('IDREGRACALCOP6').AsInteger := iIdRegraCalcOp6;


     qrysubtipo.FieldByName('FLGOBRIGAOP1').AsInteger   := ilFlgObrigaOp1;
     qrysubtipo.FieldByName('FLGOBRIGAOP2').AsInteger   := ilFlgObrigaOp2;
     qrysubtipo.FieldByName('FLGOBRIGAOP3').AsInteger   := ilFlgObrigaOp3;

     qrysubtipo.FieldByName('FLGEDITAOP1').AsInteger    := ilFlgAlteraOp1;
     qrysubtipo.FieldByName('FLGEDITAOP2').AsInteger    := ilFlgAlteraOp2;
     qrysubtipo.FieldByName('FLGEDITAOP3').AsInteger    := ilFlgAlteraOp3;

     qrysubtipo.FieldByName('FLGOBRIGAOP4').AsInteger   := ilFlgObrigaOp4;
     qrysubtipo.FieldByName('FLGOBRIGAOP5').AsInteger   := ilFlgObrigaOp5;
     qrysubtipo.FieldByName('FLGOBRIGAOP6').AsInteger   := ilFlgObrigaOp6;

     qrysubtipo.FieldByName('FLGEDITAOP4').AsInteger    := ilFlgAlteraOp4;
     qrysubtipo.FieldByName('FLGEDITAOP5').AsInteger    := ilFlgAlteraOp5;
     qrysubtipo.FieldByName('FLGEDITAOP6').AsInteger    := ilFlgAlteraOp6;
  end;

end;

procedure TfrmCadPatro.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  bTelaOpcoesPatro := false;
end;

procedure TfrmCadPatro.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadPatro.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PATRO.IDFUNDACAO = '+IntToStr(iIdFundacao));
end;

end.
