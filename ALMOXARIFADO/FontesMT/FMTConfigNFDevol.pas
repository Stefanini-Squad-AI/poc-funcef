unit FMTConfigNFDevol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Menus, wwdblook, CMDBLookupCombo, DBCtrls, Mask,
  uCmSqlParams, uMTConfigNFDevol,uCtrlConfigNFDevol;

Const
    MAX_CAMPOS = 34;

    DESCRICAO : Array[1..MAX_CAMPOS] of String = ('Indicador de Entrada/Saída',
                                                  'Numero da Nota',
                                                  'Natureza da Operação',
                                                  'C.F.O.P.',
                                                  'Razão Social',
                                                  'C.G.C./C.P.F.',
                                                  'Endereço',
                                                  'Bairro/Distrito',
                                                  'C.E.P.',
                                                  'Município',
                                                  'Fone ou Fax',
                                                  'U.F.',
                                                  'Inscrição Estadual',
                                                  'Data da Emissão',
                                                  'Data de Entrada/Saída',
                                                  'Código do Produto',
                                                  'Descrição do Produto',
                                                  'Unidade de Medida',
                                                  'Quantidade',
                                                  'Valor Unitário',
                                                  'Valor Total',
                                                  'ICMS',
                                                  'IPI',
                                                  'Valor do IPI',
                                                  'Base de Cáclulo do ICMS',
                                                  'Valor do I.C.M.S.',
                                                  'Base de Cáclulo do ICMS Substituição',
                                                  'Valor do ICMS Substituição',
                                                  'Valor Total dos Produtos',
                                                  'Valor do Frete',
                                                  'Valor do Seguro',
                                                  'Outras Despesas',
                                                  'Valor Total do IPI',
                                                  'Valor Total da Nota');
type

  TFrmMTConfigNFDevol = class(TFrmCadastroMT)
    MnuImprimir: TPopupMenu;
    MnuNotateste: TMenuItem;
    MnuMapa: TMenuItem;
    BtnImprime: TToolbarButton97;
    DsDet: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edDesc: TDBEdit;
    chkImpCond: TDBCheckBox;
    dblcAgreICMSAgre: TCMDBLookupCombo;
    dblcAgreICMSItem: TCMDBLookupCombo;
    dblcICMSSubst: TCMDBLookupCombo;
    dblcAgreIPI: TCMDBLookupCombo;
    dblcAgreSeguro: TCMDBLookupCombo;
    dblcAgreOutros: TCMDBLookupCombo;
    dblcTipoDoc: TCMDBLookupCombo;
    CdsDet: TCMClientDataSet;
    CdsAgreICMSNota: TCMClientDataSet;
    CdsAgreICMSSubst: TCMClientDataSet;
    CdsAgreSeguro: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    CdsAgreICMSItem: TCMClientDataSet;
    CdsAgreIPI: TCMClientDataSet;
    CdsAgreOutros: TCMClientDataSet;
    spAgreICMSNota: TCMSqlParams;
    spAgreICMSSubst: TCMSqlParams;
    spAgreSeguro: TCMSqlParams;
    spAgreICMSItem: TCMSqlParams;
    spAgreIPI: TCMSqlParams;
    spAgreOutros: TCMSqlParams;
    spTipoDoc: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure MnuMapaClick(Sender: TObject);
    procedure MnuNotatesteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
    ConfigNota    : TMTConfigNFDevol;
    ConfigNFDevol : TCtrlConfigNFDevol;

    procedure SetItensNota(var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer);
    Procedure Sel( n : Double);
  public
    { Public declarations }
  end;

var
  FrmMTConfigNFDevol: TFrmMTConfigNFDevol;

implementation

{$R *.DFM}

Uses uSistema, uMensErro,DBaseDados;

procedure TFrmMTConfigNFDevol.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigNota := TMTConfigNfDevol.Create(Self);
  ConfigNota.BeforePrintLinhas := SetItensNota;
  
  ConfigNFDevol := TCtrlConfigNFDevol.Create;
  ConfigNFDevol.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ConfigNFDevol.Cds    := Cds;
  ConfigNFDevol.CdsDet := CdsDet;

  spAgreICMSNota.Prepare;
  spAgreICMSNota.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  spAgreICMSNota.Open;

  spAgreICMSSubst.Prepare;
  spAgreICMSSubst.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  spAgreICMSSubst.Open;

  spAgreSeguro.Prepare;
  spAgreSeguro.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  spAgreSeguro.Open;

  spAgreICMSItem.Prepare;
  spAgreICMSItem.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  spAgreICMSItem.Open;

  spAgreIPI.Prepare;
  spAgreIPI.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  spAgreIPI.Open;

  spAgreOutros.Prepare;
  spAgreOutros.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  spAgreOutros.Open;

  spTipoDoc.Prepare;
  spTipoDoc.Open;

  Sel(-1);

end;

procedure TFrmMTConfigNFDevol.Sel(n: Double);
begin
   Cds.Data    := ConfigNFDevol.GetModelo(n);
   CdsDet.Data := ConfigNFDevol.GetItensModelo(n);

   If Not CdsDet.IsEmpty Then
      Begin
          CdsDet.DisableControls;
          Try
          CdsDet.First;
          While Not CdsDet.Eof Do
             Begin
                CdsDet.Edit;
                CdsDet.FieldByName('DESCCAMPO').AsString := DESCRICAO[CdsDet.FieldByName('IDCAMPONFDEVOL').AsInteger];
                CdsDet.Post;
                CdsDet.Next;
             End;
          Finally
             CdsDet.First;
             CdsDet.EnableControls;
          End;
      End;
end;

procedure TFrmMTConfigNFDevol.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  BtnImprime.Enabled := not bbtnConfirmar.Enabled;
end;

procedure TFrmMTConfigNFDevol.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmMTConfigNFDevol.CmeCadastroInsert(Sender: TObject);
Var
   x : Integer;
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FLGCONDENSADO').AsString := 'N';

  For x := 1 To MAX_CAMPOS Do
   Begin
      CdsDet.Append;
      CdsDet.FieldByName('IDCAMPONFDEVOL').AsInteger := x;
      CdsDet.FieldByName('DESCCAMPO').AsString := DESCRICAO[x];
      CdsDet.Post;
   End;
   CdsDet.First;

end;

procedure TFrmMTConfigNFDevol.MnuMapaClick(Sender: TObject);
begin
  inherited;
 if ConfigNota.Inicializar then
      Try
        ConfigNota.ImprimeMapa;
      Finally
        BtnImprime.Down := False;
        ConfigNota.finalizar;
      End;
end;

procedure TFrmMTConfigNFDevol.MnuNotatesteClick(Sender: TObject);
begin
  inherited;
  With ConfigNota Do
     if (not Cds.IsEmpty) and Inicializar then
         try
            ModeloNota       := Cds.FieldByName('IDTEMPLNFDEVOL').AsInteger;
            IndEntSai        := 'X';
            NumNota          := '000000';
            NaturezaOp       := 'XXXXXXXXXXXX';
            CFOP             := 'XXXXX';
            RazaoSocial      := 'FORNECEDOR DE MERCADORIA';
            CGC_Cpf          := '00.000.000/0000-0';
            Endereco         := 'RUA DO FORNECEDOR';
            Bairro           := 'BAIRRO DO FORNECEDOR';
            CEP              := '00000-000';
            Municipio        := 'MUNICIPO';
            Fone_Fax         := 'XXXX-XXXX';
            UF               := 'XX';
            InscEstadual     := '000.000.000';
            DataEmissao      := DateToStr(Date);
            DataEntSai       := DateToStr(Date);
            BaseICMS         := '0,00';
            ValorICMS        := '0,00';
            BaseICMSSubst    := '0,00';
            ValorICMSSubst   := '0,00';
            ValorTotProduto  := '0,00';
            ValorFrete       := '0,00';
            ValorSeguro      := '0,00';
            OutrasDesp       := '0,00';
            ValorTotIPI      := '0,00';
            ValorTotNota     := '0,00';
            ImprimeNota;
         finally
           BtnImprime.Down := False;
           finalizar;
         end;
end;

procedure TFrmMTConfigNFDevol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConfigNFDevol.Free;
  ConfigNota.Free;
end;

procedure TFrmMTConfigNFDevol.SetItensNota(var CodProduto, DescProduto,
  UnidMedida: String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI,
  ValorIPI: Double; var CanPrint: Boolean; iItemDet: Integer);
begin
   CanPrint := True;
   Case iItemDet Of
      0: Begin
            CodProduto  := IntToStr(iItemDet);
            DescProduto := 'Descrição do produto '+intToStr(iItemDet);
            UnidMedida  := 'UN';
            Quantidade  := iItemDet;
            ValorUnit   := iItemDet;
            ValorTotal  := iItemDet;
            ICMS        := iItemDet;
            IPI         := iItemDet;
            ValorIPI    := iItemDet;
         End;
      1: Begin
            CodProduto  := IntToStr(iItemDet);
            DescProduto := 'Descrição do produto '+intToStr(iItemDet);
            UnidMedida  := 'UN';
            Quantidade  := iItemDet;
            ValorUnit   := iItemDet;
            ValorTotal  := iItemDet;
            ICMS        := iItemDet;
            IPI         := iItemDet;
            ValorIPI    := iItemDet;
         End;
      2: Begin
            CodProduto  := IntToStr(iItemDet);
            DescProduto := 'Descrição do produto '+intToStr(iItemDet);
            UnidMedida  := 'UN';
            Quantidade  := iItemDet;
            ValorUnit   := iItemDet;
            ValorTotal  := iItemDet;
            ICMS        := iItemDet;
            IPI         := iItemDet;
            ValorIPI    := iItemDet;
         End;
   Else
       CanPrint := False;
   End;
end;

procedure TFrmMTConfigNFDevol.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ConfigNFDevol.Gravar;
end;

procedure TFrmMTConfigNFDevol.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ConfigNFDevol.Gravar;
end;

procedure TFrmMTConfigNFDevol.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ConfigNFDevol.Excluir;
end;

procedure TFrmMTConfigNFDevol.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName = 'DESCCAMPO') and (not highlight) then
     ABrush.COLOR := $00DDFBDB;

end;

end.
