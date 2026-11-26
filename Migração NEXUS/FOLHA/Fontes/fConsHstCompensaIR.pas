// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 13/03/2006
// Rotina      : Form
// Pendência   : 24728
// Descricao   : Coloquei com a propriedade align = alclient para o painel do grid.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 08/06/2006
// Rotina      : Form
// Pendência   : 20652
// Descricao   : Colocar descrição do histórico da compensação de IR.
//------------------------------------------------------------------------------
unit fConsHstCompensaIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, MontaSelect, Mask, DBCtrls, TREdit, DBGrids,uAdmPrevFB;

type
  TfrmConsHstCompIR = class(TfrmSairAjuda)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    btnProcurar: TBitBtn;
    Panel2: TPanel;
    dbgDetalhe: TwwDBGrid;
    qryCompensacao: TwwQuery;
    dsCompensacao: TwwDataSource;
    MontaSelect: TMontaSelect;
    Label2: TLabel;
    Label8: TLabel;
    edtNome: TEdit;
    edtMatricula: TEdit;
    edtCPF: TEdit;
    edtSituacao: TEdit;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedMesInicio: TDBEdit;
    dbEdCompTotal: TDBRealEdit;
    dbEdSaldo: TDBRealEdit;
    DBGrid1: TDBGrid;
    dbedMesFim: TDBEdit;
    pnlSaldo: TPanel;
    Label9: TLabel;
    qryCompensacaoMESINICIO: TStringField;
    qryCompensacaoMESFIM: TStringField;
    qryCompensacaoCOMPTOTAL: TFloatField;
    qryCompensacaoSALDOCOMP: TFloatField;
    qryCompensacaoHISTORICO: TStringField;
    qryCompensacaoMESREFERENCIA: TStringField;
    qryCompensacaoVLRCOMPMES: TFloatField;
    qryCompensacaoDESCRICAO: TStringField;
    dbeUltMesAtualiza: TDBEdit;
    Label10: TLabel;
    qryCompensacaoULTMESATUALIZA: TStringField;
    qryCompensacaoENTSAI: TStringField;
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsHstCompIR: TfrmConsHstCompIR;

implementation

{$R *.DFM}

procedure TfrmConsHstCompIR.btnProcurarClick(Sender: TObject);
Var qryTmp: TwwQuery;
    sTipo : String;
begin
  inherited;
  sTipo:='';
  MontaSelect.Executar;
  If MontaSelect.RetornouValor then
  begin
    EdtNome.Text      := MontaSelect.ValoresChave[1];
    edtMatricula.Text := MontaSelect.ValoresChave[9];
    edtCPF.Text       := MontaSelect.ValoresChave[3];
    qryCompensacao.Close;
    qryCompensacao.ParambyName('IDPESSOA').ASInteger:= StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryCompensacao.Open;

    dbedMesInicio.Text := MontaSelect.ValoresChave[5];
    dbedMesFim.Text    := MontaSelect.ValoresChave[6];
    dbEdCompTotal.Text := MontaSelect.ValoresChave[8];
    dbedSaldo.Text     := MontaSelect.ValoresChave[7];
    pnlsaldo.Caption   := Floattostrf(Strtofloat(clientenumero(dbEdCompTotal.Text))-Strtofloat(Clientenumero(dbedSaldo.Text)),ffnumber,15,2);

    qryTmp:=TwwQuery.Create(Application);
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add(
      'SELECT PP.IDPESSOA , SP.FLGINTERNO '+
      ' FROM PARTPREVPLAN PP, SITPART SP   '+
      ' WHERE PP.IDPESSOA = '+ MontaSelect.ValoresChave[0]+
      ' AND PP.FLGDESATIVADO = 0 '+
      ' AND PP.IDSITPART = SP.IDSITPART');
    qryTmp.Open;
    If Not qryTmp.IsEmpty Then
    Begin
      If qryTmp.Fields[1].AsString = 'AS' Then
        sTipo := 'Assistido'
      Else
        If qryTmp.Fields[1].AsString = 'AT' Then
          sTipo := 'Participante';
    End
    Else
    Begin
      // BENEFICIARIO
      qryTmp.Close;
      qryTmp.Sql.Clear;
      qryTmp.Sql.Add(
        'SELECT IDRESPONSAVEL '+
        ' FROM BFCIARIOTITPLAN '+
        ' WHERE IDPESSOA = '+MontaSelect.ValoresChave[0]);
      qryTmp.Open;
      If Not qryTmp.IsEmpty Then sTipo := 'Beneficiario';
    End;
    qryTmp.Free;
  end; {MontaSelect.RetornouValor}
  edtSituacao.Text:=sTipo;
end;

end.
