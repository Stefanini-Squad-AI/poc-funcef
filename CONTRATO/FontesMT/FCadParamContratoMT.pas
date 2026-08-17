{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: *.dfm
N. Sol..........: 191844
N. Kintana......: 1822119
Data............: 15/07/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: adicionado seleção de Plano e Patro na parametrizacao de medicao
ALteração DFM...: alterado aba Medicao, incluindo Plano e Patro
--------------------------------------------------------------------------------
Rotina..........: Aba Alçadas
N. Sol..........: 142171
N. Kintana......: 913629
Data............: 20/09/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Foi adicionada uma aba ao formulário para controle de dias
                  parametrizados.
ALteração DFM...: Foi adicionado uma aba formulário
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27582
Responsável : Daniel Simões
Data        : 12/03/2008
Descrição   : Ajuste do Help Context.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadParamContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, TREdit, DBCtrls, ComCtrls,
  uCtrlParamContrato, Mask, wwdbedit, wwdblook, CMDBLookupCombo;

type
  TfrmCadParamContratoMT = class(TFrmCadastroMT)
    dsDisponiveis: TwwDataSource;
    dsSelecionados: TwwDataSource;
    pcParametros: TPageControl;
    tsParametrosGerais: TTabSheet;
    Label1: TLabel;
    dbcbUtilizaTRD: TDBCheckBox;
    dbcbEngItens: TDBCheckBox;
    edrNumDiasAvisoCorr: TDBRealEdit;
    dbcbImpNFImpFis: TDBCheckBox;
    tbsImpostosNF: TTabSheet;
    pnlDisponiveis: TPanel;
    pnlTitDisponiveis: TPanel;
    dbgDisponiveis: TwwDBGrid;
    Panel2: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    pnlSelecionados: TPanel;
    pnlTitSelecionados: TPanel;
    dbgSelecionados: TwwDBGrid;
    spTeste: TCMSqlParams;
    cdsDisponiveis: TCMClientDataSet;
    cdsSelecionados: TCMClientDataSet;
    dbcbIntegraOrca: TDBCheckBox;
    tsParametrosMedicao: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    tsAlcadas: TTabSheet;
    Label2: TLabel;
    dbQntDiasAlcada: TwwDBEdit;
    gbPlanoPatro: TGroupBox;
    CmbPlano: TCMDBLookupCombo;
    Label11: TLabel;
    Label12: TLabel;
    CmbPatro: TCMDBLookupCombo;
    cdsPlano: TCMClientDataSet;
    dsPlano: TwwDataSource;
    cdsPatro: TCMClientDataSet;
    dsPatro: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CtrlParamContrato : TCtrlParamContrato;
  public
    { Public declarations }
  end;

var
  frmCadParamContratoMT: TfrmCadParamContratoMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadParamContratoMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlParamContrato:=TCtrlParamContrato.Create;
   CtrlParamContrato.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlParamContrato.cdsParamContrato:=Cds;
   CtrlParamContrato.cdsImpostoImpNF:=cdsSelecionados;

   Cds.Data:=CtrlParamContrato.ListParamContrato(Sistema.IdEmpresa);
   cdsSelecionados.Data:=CtrlParamContrato.ListImpostosImpNF(Sistema.IdEmpresa,False);
   cdsDisponiveis.Data:=CtrlParamContrato.ListImpostosImpNF(Sistema.IdEmpresa,True);

   // Edilaine - SOL 191844 / KTN 1822119
   cdsPlano.Data := CtrlParamContrato.ListaPlanoPrev;
   cdsPatro.Data := CtrlParamContrato.ListaPatrocionadora;

   cdsPlano.locate('IDPLANOPREV', Cds.FieldByName('IDPLANOPREV').AsString, []);
   cdsPatro.locate('IDPATRO', Cds.FieldByName('IDPATRO').AsString, []);

   CmbPlano.lookupValue := Cds.FieldByName('IDPLANOPREV').AsString;
   CmbPatro.lookupValue := Cds.FieldByName('IDPATRO').AsString;
   // Edilaine - SOL 191844 / KTN 1822119

   pcParametros.ActivePageIndex:=0;
end;

procedure TfrmCadParamContratoMT.FormShow(Sender: TObject);
begin
   inherited;
   if Cds.IsEmpty then
    begin
       sbtnInserir.Click;
       bbtnConfirmar.Click;
       sbtnAlterar.Click;
    end;
end;

procedure TfrmCadParamContratoMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   cds.FieldByName('FLGINTEGRAORCA').AsString := 'N';
   cds.FieldByName('FLGENGLOBA').AsString     := 'N';
   cds.FieldByName('FLGTIPODESEMB').AsString  := 'N';
   cds.FieldByName('FLGNFIMPFISCAL').AsString := 'N';
   cds.FieldByName('IDPESSOA').AsFloat        := Sistema.IdEmpresa;
   // Início pendência 19333 - Marcos Topini
   cds.FieldByName('FLGPERMITEMED').AsString   := 'N';
   cds.FieldByName('IDPARAMCONTRATO').AsString := 'N';
   // Fim pendência 19333
end;

procedure TfrmCadParamContratoMT.CmeCadastroConfirma(Sender: TObject);
begin
   if not(CtrlParamContrato.AplicaAtualParamContrato) then
    begin
       MsgDlg(CtrlParamContrato.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
   else
    begin
       inherited;
       cds.Close;
       Cds.Data:=CtrlParamContrato.ListParamContrato(Sistema.IdEmpresa);
    end;
end;

procedure TfrmCadParamContratoMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled:=not(Cds.IsEmpty);
end;

end.
