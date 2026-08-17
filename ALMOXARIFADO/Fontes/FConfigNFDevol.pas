unit FConfigNFDevol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, wwdblook,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, Menus,uConfigNfDevol,uCMTypes;
Const
   MaxCampo = 34;
type
  TFrmConfigNFDevol = class(TfrmCadastroCS)
    qryIDTEMPLNFDEVOL: TFloatField;
    qryDESCTEMPLNFDEVOL: TStringField;
    qryICMSNOTA: TFloatField;
    qryICMSITEM: TFloatField;
    qryICMSSUBSTITUICAO: TFloatField;
    qryIPIITEM: TFloatField;
    qryFRETE: TFloatField;
    qrySEGURO: TFloatField;
    qryOUTRASDESP: TFloatField;
    qryFLGCONDENSADO: TStringField;
    Label1: TLabel;
    edDesc: TDBEdit;
    chkImpCond: TDBCheckBox;
    Label2: TLabel;
    dblcAgreICMSAgre: TCMDBLookupCombo;
    qryAgreICMSNota: TwwQuery;
    qryAgreICMSItem: TwwQuery;
    Label3: TLabel;
    dblcAgreICMSItem: TCMDBLookupCombo;
    qryAgreICMSSubst: TwwQuery;
    Label4: TLabel;
    dblcICMSSubst: TCMDBLookupCombo;
    qryAgreIPI: TwwQuery;
    Label5: TLabel;
    dblcAgreIPI: TCMDBLookupCombo;
    qryAgreSeguro: TwwQuery;
    qryAgreOutros: TwwQuery;
    Label6: TLabel;
    dblcAgreSeguro: TCMDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    dblcAgreOutros: TCMDBLookupCombo;
    QryDet: TwwQuery;
    DsDet: TwwDataSource;
    UpdDet: TUpdateSQL;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    MnuImprimir: TPopupMenu;
    MnuNotateste: TMenuItem;
    MnuMapa: TMenuItem;
    BtnImprime: TToolbarButton97;
    QryDetIDCONFIGNFDEVOL: TFloatField;
    QryDetIDTEMPLNFDEVOL: TFloatField;
    QryDetIDCAMPONFDEVOL: TFloatField;
    QryDetLINHA: TFloatField;
    QryDetCOLUNA: TFloatField;
    QryDetTAMANHO: TFloatField;
    QryDetFLGALINHAMENTO: TStringField;
    QryDetDESCCAMPO: TStringField;
    qryIDDOCUMENTO: TFloatField;
    Label9: TLabel;
    qryTipoDoc: TwwQuery;
    dblcTipoDoc: TCMDBLookupCombo;
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure QryDetCalcFields(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormCreate(Sender: TObject);
    procedure MnuMapaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnuNotatesteClick(Sender: TObject);
  private
    { Private declarations }
    ConfigNota : TConfigNfDevol;

    procedure SetItensNota(var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer);
  public
    { Public declarations }
  end;

var
  FrmConfigNFDevol: TFrmConfigNFDevol;

implementation

{$R *.DFM}

Uses uDataBase, uSistema;

procedure TFrmConfigNFDevol.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  BtnImprime.Enabled := not bbtnConfirmar.Enabled;
end;

procedure TFrmConfigNFDevol.QryDetCalcFields(DataSet: TDataSet);
begin
  inherited;
    Case QryDetIDCAMPONFDEVOL.AsInteger Of
       1 : QryDetDESCCAMPO.AsString := 'Indicador de Entrada/Saída';
       2 : QryDetDESCCAMPO.AsString := 'Numero da Nota';
       3 : QryDetDESCCAMPO.AsString := 'Natureza da Operação';
       4 : QryDetDESCCAMPO.AsString := 'C.F.O.P.';
       5 : QryDetDESCCAMPO.AsString := 'Razão Social';
       6 : QryDetDESCCAMPO.AsString := 'C.G.C./C.P.F.';
       7 : QryDetDESCCAMPO.AsString := 'Endereço';
       8 : QryDetDESCCAMPO.AsString := 'Bairro/Distrito';
       9 : QryDetDESCCAMPO.AsString := 'C.E.P.';
       10: QryDetDESCCAMPO.AsString := 'Município';
       11: QryDetDESCCAMPO.AsString := 'Fone ou Fax';
       12: QryDetDESCCAMPO.AsString := 'U.F.';
       13: QryDetDESCCAMPO.AsString := 'Inscrição Estadual';
       14: QryDetDESCCAMPO.AsString := 'Data da Emissão';
       15: QryDetDESCCAMPO.AsString := 'Data de Entrada/Saída';
       16: QryDetDESCCAMPO.AsString := 'Código do Produto';
       17: QryDetDESCCAMPO.AsString := 'Descrição do Produto';
       18: QryDetDESCCAMPO.AsString := 'Unidade de Medida';
       19: QryDetDESCCAMPO.AsString := 'Quantidade';
       20: QryDetDESCCAMPO.AsString := 'Valor Unitário';
       21: QryDetDESCCAMPO.AsString := 'Valor Total' ;
       22: QryDetDESCCAMPO.AsString := 'ICMS';
       23: QryDetDESCCAMPO.AsString := 'IPI';
       24: QryDetDESCCAMPO.AsString := 'Valor do IPI';
       25: QryDetDESCCAMPO.AsString := 'Base de Cáclulo do ICMS';
       26: QryDetDESCCAMPO.AsString := 'Valor do I.C.M.S.';
       27: QryDetDESCCAMPO.AsString := 'Base de Cáclulo do ICMS Substituição';
       28: QryDetDESCCAMPO.AsString := 'Valor do ICMS Substituição';
       29: QryDetDESCCAMPO.AsString := 'Valor Total dos Produtos';
       30: QryDetDESCCAMPO.AsString := 'Valor do Frete';
       31: QryDetDESCCAMPO.AsString := 'Valor do Seguro';
       32: QryDetDESCCAMPO.AsString := 'Outras Despesas';
       33: QryDetDESCCAMPO.AsString := 'Valor Total do IPI';
       34: QryDetDESCCAMPO.AsString := 'Valor Total da Nota';
    End;
end;

procedure TFrmConfigNFDevol.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Begin
        qry.CLose;
        qry.ParamByName('IDTEMPLNFDEVOL').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
        qry.Open;
        //
        qryDet.Close;
        qryDet.ParamByName('IDTEMPLNFDEVOL').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
        qryDet.Open;
     End;
end;

procedure TFrmConfigNFDevol.CmeCadastroInsert(Sender: TObject);
Var
  X: Integer;
begin
  inherited;
  qryIDTEMPLNFDEVOL.AsInteger := LeultRegistro(nil, 'TEMPLNFFATURA');
  qryFLGCONDENSADO.AsString := 'N';
  //
  QryDet.Close;
  QryDet.Params[0].AsInteger := qryIDTEMPLNFDEVOL.AsInteger;
  QryDet.Open;
  //
  For X := 1 to MaxCampo do
  begin
    qryDet.Append;
    qryDetIDCONFIGNFDEVOL.AsInteger := LeultRegistro(nil, 'CONFIGNFDEVOL');
    qryDetIDTEMPLNFDEVOL.AsInteger  := qryIDTEMPLNFDEVOL.AsInteger;
    qryDetLINHA.AsInteger           := 0;
    qryDetCOLUNA.AsInteger          := 0;
    qryDetTAMANHO.AsInteger         := 0;
    qryDetIDCAMPONFDEVOL.AsInteger  := X;
    qryDet.Post;
  end;
  qryDet.First;
end;

procedure TFrmConfigNFDevol.CmeCadastroConfirma(Sender: TObject);
begin
  Case CmeCadastro.Operacao Of
    OpInserir,
    OpAlterar: begin AplicaAlteracoes([qry, qryDet]) end;
    OpApagar : Begin
                  qryDet.First;
                  while not qryDet.EOF do
                    qryDet.Delete;
                  AplicaAlteracoes([qryDet, qry]);
              End
  else
    inherited;
  End;
end;

procedure TFrmConfigNFDevol.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
if (Field.FieldName = 'DESCCAMPO') and (not highlight) then
    ABrush.COLOR := $00DDFBDB;
end;

procedure TFrmConfigNFDevol.FormCreate(Sender: TObject);
begin
  inherited;
  Qry.CLose;
  Qry.ParamByName('IDTEMPLNFDEVOL').AsInteger  := -1;
  Qry.Open;
  //
  QryDet.Close;
  QryDet.ParamByName('IDTEMPLNFDEVOL').AsInteger := -1;
  QryDet.Open;
  //
  ConfigNota := TConfigNFDevol.Create(Self);
  ConfigNota.DataBaseName := 'BaseDados';
  ConfigNota.BeforePrintLinhas := SetItensNota;
  //
  qryAgreICMSNota.Close;
  qryAgreICMSNota.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAgreICMSNota.Open;
  //
  qryAgreICMSItem.Close;
  qryAgreICMSItem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAgreICMSItem.Open;
  //
  qryAgreICMSSubst.Close;
  qryAgreICMSSubst.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAgreICMSSubst.Open;
  //
  qryAgreIPI.Close;
  qryAgreIPI.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAgreIPI.Open;
  //
  qryAgreSeguro.Close;
  qryAgreSeguro.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAgreSeguro.Open;
  //
  qryAgreOutros.Close;
  qryAgreOutros.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAgreOutros.Open;
  //
  qryTipoDoc.Open;
end;

procedure TFrmConfigNFDevol.MnuMapaClick(Sender: TObject);
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

procedure TFrmConfigNFDevol.SetItensNota(var CodProduto, DescProduto,
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

procedure TFrmConfigNFDevol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConfigNota.Free;
end;

procedure TFrmConfigNFDevol.MnuNotatesteClick(Sender: TObject);
begin
  inherited;
  With ConfigNota Do
     if (not qry.IsEmpty) and Inicializar then
         try
            ModeloNota       := qryIDTEMPLNFDEVOL.AsInteger;
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

end.



