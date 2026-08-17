{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************
{--------------------------------------------------------------------------------------------------
rotinas     : *.dfm (CkbSemEspecial, CkbSoCxAltaClick)
Pendência   : SOL 161550 KTN 1717512
Responsável : Edilaine
Data        : 26/08/2014
Descrição   : Implantar flags para permitir apenas letras e numeros no campo de filtro e flag para
              considerar textos em maiusculo nos filtros
--------------------------------------------------------------------------------------------------
Data     : 23.01.2007
Analista : Antonio Marcos (amf)
Pendência: 21376
Descrição: correção de bug envolvendo o método setfocus.
---------------------------------------------------------------------------------
Data     : 22.01.2007
Analista : Antonio Marcos (amf)
Pendência: 21376
Descrição: Implementação de LookUp no MontaSelect
--------------------------------------------------------------------------------}


unit MSParamsEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, dbTables,
  Db, wwQuery, Spin, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, CmDock, ComCtrls{andre tavares};

type
  TfrmMSParamsEditor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qryColunas: TwwQuery;
    GroupBox1: TGroupBox;
    lstTabelas: TListBox;
    cmbTabelas: TComboBox;
    btnIncluiTabela: TSpeedButton;
    btnExcluiTabela: TSpeedButton;
    GroupBox2: TGroupBox;
    btnIncluiColuna: TSpeedButton;
    btnExcluiColuna: TSpeedButton;
    cmbColunas: TComboBox;
    lstColunas: TListBox;
    qryTeste: TwwQuery;
    dsTeste: TwwDataSource;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    btnIncluiCamposChave: TSpeedButton;
    btnExcluiCamposChave: TSpeedButton;
    lstCamposChave: TListBox;
    cmbCamposChave: TComboBox;
    GroupBox4: TGroupBox;
    btnIncluiFiltro: TSpeedButton;
    btnExcluiFiltro: TSpeedButton;
    lstFiltros: TListBox;
    edFiltros: TEdit;
    Panel4: TPanel;
    CkbDistinct: TCheckBox;
    Label2: TLabel;
    EdtTitulo: TEdit;
    CkbRepete: TCheckBox;
    Bevel1: TBevel;
    CMOkCancelar1: TCMOkCancelar;
    PnlSalvar: TPanel;
    BitBtn1: TBitBtn;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    lblmascara: TLabel;
    Label3: TLabel;
    edMascara: TEdit;
    edDescricao: TEdit;
    cmbTipoDeDado: TComboBox;
    spnLargura: TSpinEdit;
    GroupBox5: TGroupBox;
    pnlSQL: TPanel;
    MemoSQL: TMemo;
    grdTeste: TwwDBGrid;
    CkbCase: TCheckBox;
    CmbOperDefault: TComboBox;
    CmbOperDefaultN: TComboBox;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    edtSql: TEdit;
    Label5: TLabel;
    edtIdTabela: TEdit;
    Label8: TLabel;
    edtCampoLkp: TEdit;
    CkbSemEspecial: TCheckBox;
    CkbSoCxAlta: TCheckBox;
    procedure btnIncluiTabelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluiabelaClick(Sender: TObject);
    procedure lstTabelasClick(Sender: TObject);
    procedure btnIncluiColunaClick(Sender: TObject);
    procedure btnExcluiColunaClick(Sender: TObject);
    procedure btnIncluiCamposChaveClick(Sender: TObject);
    procedure btnExcluiCamposChaveClick(Sender: TObject);
    procedure lstCamposChaveClick(Sender: TObject);
    procedure lstFiltrosClick(Sender: TObject);
    procedure edDescricaoChange(Sender: TObject);
    procedure lstColunasClick(Sender: TObject);
    procedure cmbTipoDeDadoChange(Sender: TObject);
    procedure edMascaraChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure grdTesteExit(Sender: TObject);
    procedure spnLarguraChange(Sender: TObject);
    procedure CkbCaseClick(Sender: TObject);
    procedure CkbDistinctClick(Sender: TObject);
    procedure CkbRepeteClick(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure CmbOperDefaultChange(Sender: TObject);
    procedure CmbOperDefaultNChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSqlChange(Sender: TObject);
    procedure edtIdTabelaChange(Sender: TObject);
    procedure edtCampoLkpChange(Sender: TObject);
    procedure CkbSemEspecialClick(Sender: TObject);
    procedure CkbSoCxAltaClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtuTabelas(iTabela:integer);
    procedure AtuColunas(iColuna:integer);
    procedure AtuCampos( Campo:string; iIndex:integer);
    procedure AtuTipoDeDado(sTipo:string);
    function SemPonto(sTexto : string) : string;
  public
    { Public declarations }
    Componente : TMontaSelect;
  end;

var
  frmMSParamsEditor: TfrmMSParamsEditor;

implementation
{$R *.DFM}

procedure TfrmMSParamsEditor.btnIncluiTabelaClick(Sender: TObject);
var iPonto : integer;
    sTabela : string;
begin
     iPonto := Pos('.', cmbtabelas.text);
     if iPonto > 0 then
        sTabela := Copy(cmbTabelas.text, iPonto+1, 50)
     else
         sTabela := cmbTabelas.text;
     Componente.Tabelas.Append(AnsiUpperCase(sTabela));
     lstTabelas.Items := Componente.Tabelas;
     lstTabelas.ItemIndex := lstTabelas.Items.Count-1;
     lstTabelas.SetFocus ;
     AtuTabelas(lstTabelas.ItemIndex);
end;

procedure TfrmMSParamsEditor.FormActivate(Sender: TObject);
begin
     while Componente.TipoDeDado.count < Componente.Colunas.Count do
           Componente.TipoDeDado.Add('');
     while Componente.Descricao.count < Componente.Colunas.Count do
           Componente.Descricao.Add('');
     while Componente.Mascaras.count < Componente.Colunas.Count do
           Componente.Mascaras.Add('');
     while Componente.Larguras.count < Componente.Colunas.Count do
           Componente.Larguras.Add('0');
     while Componente.SensivelACaixa.count < Componente.Colunas.Count do
           Componente.SensivelACaixa.Add('N');


     while Componente.OperComparador.count < Componente.Colunas.Count do
           Componente.OperComparador.Add('-1');

     while Componente.OperComparador.count > Componente.Colunas.Count do
           Componente.OperComparador.Delete(Componente.OperComparador.Count-1);

     while Componente.LookupSQL.count < Componente.Colunas.Count do
           Componente.LookupSQL.Add('');

     while Componente.LookupSQL.count > Componente.Colunas.Count do
           Componente.LookupSQL.Delete(Componente.LookUpSQL.Count-1);

     while Componente.LookupCampoChave.count < Componente.Colunas.Count do
           Componente.LookupCampoChave.Add('');

     while Componente.LookupCampoChave.count > Componente.Colunas.Count do
           Componente.LookupCampoChave.Delete(Componente.LookupCampoChave.Count-1);

     while Componente.LookupCampoExibe.count < Componente.Colunas.Count do
           Componente.LookupCampoExibe.Add('');

     while Componente.LookupCampoExibe.count > Componente.Colunas.Count do
           Componente.LookupCampoExibe.Delete(Componente.LookupCampoExibe.Count-1);


     // Inicio - edilaine - SOL 161550 KIN 1717512
     while Componente.ApenasLetraENum.count < Componente.Colunas.Count do
           Componente.ApenasLetraENum.Add('N');
     while Componente.ComparaMaiuscula.count < Componente.Colunas.Count do
           Componente.ComparaMaiuscula.Add('');

     while Componente.ApenasLetraENum.count > Componente.Colunas.Count do
           Componente.ApenasLetraENum.Delete(Componente.ApenasLetraENum.Count-1);
     while Componente.ComparaMaiuscula.count > Componente.Colunas.Count do
           Componente.ComparaMaiuscula.Delete(Componente.ComparaMaiuscula.Count-1);
     // Termino - edilaine - SOL 161550 KIN 1717512


     while Componente.TipoDeDado.count > Componente.Colunas.Count do
           Componente.TipoDeDado.Delete(Componente.TipoDeDado.Count-1);
     while Componente.Descricao.count > Componente.Colunas.Count do
           Componente.Descricao.Delete(Componente.Descricao.Count-1);
     while Componente.Mascaras.count > Componente.Colunas.Count do
           Componente.Mascaras.Delete(Componente.Mascaras.Count-1);
     while Componente.Larguras.count > Componente.Colunas.Count do
           Componente.Larguras.Delete(Componente.Larguras.Count-1);
     while Componente.SensivelACaixa.count > Componente.Colunas.Count do
           Componente.SensivelACaixa.Delete(Componente.SensivelACaixa.Count-1);


     lstTabelas.Items := Componente.Tabelas ;
     if lstTabelas.Items.Count > 0 then
     begin
          lstTabelas.ItemIndex := 0;
          AtuTabelas(0);
     end
     else
          AtuTabelas(-1);

     lstColunas.Items := Componente.Colunas;
     if lstColunas.Items.Count > 0 then
     begin
          lstColunas.ItemIndex := 0;
          AtuColunas(0);
     end
     else
          AtuColunas(-1);

    lstCamposChave.Items := Componente.CamposChave;
     if lstCamposChave.Items.Count > 0 then
        lstCamposChave.ItemIndex := 0;
     AtuCampos('CamposChave', lstCamposChave.ItemIndex);

     lstFiltros.Items := Componente.Filtro;
     if lstFiltros.Items.Count > 0 then
        lstFiltros.ItemIndex := 0;
     AtuCampos('Filtros', lstFiltros.ItemIndex);

     Session.GetTableNames('BaseDados','',false,true,cmbtabelas.Items);

     CkbDistinct.Checked := Componente.UsaDistinct;
     CkbRepete.Checked := Componente.RepeteConsulta;
     EdtTitulo.Text := Componente.Caption;
end;

procedure TfrmMSParamsEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caHide;
end;

procedure TfrmMSParamsEditor.btnExcluiabelaClick(Sender: TObject);
var ItemIndexAnt : integer;
begin
     if lstTabelas.ItemIndex >= 0 then
     begin
          ItemIndexAnt := lstTabelas.ItemIndex ;
          lstTabelas.Items.Delete(lstTabelas.ItemIndex);
          Componente.Tabelas := lstTabelas.Items;

          while (ItemIndexAnt >= lstTabelas.Items.Count) do
                Dec(ItemIndexAnt);
          if ItemIndexAnt >= 0 then
          begin
               lstTabelas.ItemIndex := ItemIndexAnt;
               lstTabelas.SetFocus;
          end;
          AtuTabelas(lstTabelas.ItemIndex);
     end;
end;

procedure TfrmMSParamsEditor.lstTabelasClick(Sender: TObject);
begin
     AtuTabelas(lstTabelas.ItemIndex);
end;

procedure TfrmMSParamsEditor.AtuTabelas(iTabela:integer);
var i : integer;
begin
     if iTabela >= 0 then
     begin
          cmbTabelas.Text := lstTabelas.Items[iTabela];

          with qryColunas do
          begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT * FROM '+cmbTabelas.Text+' WHERE 1=2');

               GetfieldNames(cmbColunas.Items);
               for i := 0 to cmbColunas.Items.Count-1 do
                   cmbColunas.Items[i] := AnsiUpperCase(cmbTabelas.Text+'.'+cmbColunas.Items[i]);

               GetfieldNames(cmbCamposChave.Items);
               for i := 0 to cmbCamposChave.Items.Count-1 do
                   cmbCamposChave.Items[i] := AnsiUpperCase(cmbTabelas.Text+'.'+cmbCamposChave.Items[i]);

               Open;
               for i := 0 to Componente.Larguras.Count-1 do
                   if (Componente.Larguras[i] = '0') or
                      (Componente.Larguras[i] = '') then
                        Componente.Larguras[i] := IntToStr(TField(FieldByName( SemPonto(cmbColunas.Items[i]))).DisplayWidth);
          end;
     end
     else
     begin
          cmbTabelas.Text := '';
          cmbColunas.Items.Clear ;
          cmbCamposChave.Items.Clear ;
     end;
end;

procedure TfrmMSParamsEditor.AtuColunas(iColuna:integer);
begin
     if iColuna >= 0 then
     begin
          cmbColunas.Text := lstColunas.Items[iColuna];
          edDescricao.Text := Componente.Descricao[iColuna];
          edMascara.Text := Componente.Mascaras[iColuna];
          spnLargura.Text := Componente.Larguras[iColuna];
          CkbCase.Checked := (Componente.SensivelACaixa[iColuna] = 'S');
          AtuTipoDeDado(Componente.TipoDeDado[iColuna]);

          // Inicio - edilaine - SOL 161550 KIN 1717512
          CkbSemEspecial.Checked := (Componente.ApenasLetraENum[iColuna] = 'S');
          CkbSoCxAlta.Checked    := (Componente.ComparaMaiuscula[iColuna] = 'S');
          // Termino - edilaine - SOL 161550 KIN 1717512

          edtSql.Text      := Componente.LookUpSQL[iColuna];

          edtIdTabela.Text := Componente.LookupCampoChave[iColuna];
          edtCampoLkp.Text := Componente.LookupCampoExibe[icoluna];


          if trim(Componente.OperComparador[iColuna]) = '' then //aqui eu atualizo o combo do operador default
          begin
            if Componente.TipoDeDado[iColuna] = 'C' then
              CmbOperDefault.ItemIndex := -1
            else
              CmbOperDefaultN.ItemIndex := -1;
          end
          else begin
            if Componente.TipoDeDado[iColuna] = 'C' then
            begin
              CmbOperDefault.ItemIndex := strToIntDef(Componente.OperComparador[iColuna], -1);
              CmbOperDefaultN.Visible := false;
              CmbOperDefault.Visible := true;
            end
            else begin
              CmbOperDefaultN.ItemIndex := strToIntDef(Componente.OperComparador[iColuna], -1);
              CmbOperDefaultN.Visible := true;
              CmbOperDefault.Visible := false;
            end;
          end;

     end
     else
     begin
          cmbColunas.Text := '';
          edDescricao.Text := '';

          // Inicio - edilaine - SOL 161550 KIN 1717512
          CkbSemEspecial.Checked := false;
          CkbSoCxAlta.Checked    := false;
          // Termino - edilaine - SOL 161550 KIN 1717512

          edMascara.Text := '';
          spnLargura.Text := '0';
          CkbCase.Checked := false;

          CmbOperDefault.ItemIndex := -1;
          CmbOperDefaultN.ItemIndex := -1;
          AtuTipoDeDado('C');
     end;

     MemoSql.Lines.Text := Componente.MontaSQL;
     cmbTipoDeDadoChange(Self);
end;

procedure TfrmMSParamsEditor.btnIncluiColunaClick(Sender: TObject);
var sTipo : string;
begin
     Componente.Colunas.Append(AnsiUpperCase(cmbColunas.Text));
     lstColunas.Items := Componente.Colunas;

     Componente.Descricao.Append('');
     Componente.Mascaras.Append('');


     Componente.LookUpSQL.Append('');
     Componente.LookupCampoChave.Append('');
     Componente.LookupCampoExibe.Append('');

     Componente.Larguras.Append(IntToStr(TField(qryColunas.FieldByName(SemPonto(cmbColunas.Text))).DisplayWidth));
     Componente.SensivelACaixa.Append('N');

     case qryColunas.FieldByName(SemPonto(cmbColunas.Text)).DataType of
          ftString : sTipo := 'C';
          ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency : sTipo := 'N';
          ftDate, ftDateTime : sTipo := 'D';
     else
         sTipo := 'C';
     end;
     Componente.TipodeDado.Append(sTipo);

     // Inicio - edilaine - SOL 161550 KIN 1717512
     Componente.ApenasLetraENum.Append('N');
     Componente.ComparaMaiuscula.Append('');
     // Termino - edilaine - SOL 161550 KIN 1717512

     if sTipo = 'C' then
       Componente.OperComparador.Append(intToStr(CmbOperDefault.ItemIndex))
     else
       Componente.OperComparador.Append(intToStr(CmbOperDefaultN.ItemIndex));

     lstColunas.ItemIndex := lstColunas.Items.Count-1 ;
     lstColunas.SetFocus;
     AtuColunas(lstColunas.ItemIndex);
end;

procedure TfrmMSParamsEditor.btnExcluiColunaClick(Sender: TObject);
var ItemIndexAnt : integer;
begin
     if lstColunas.ItemIndex >= 0 then
     begin
          Componente.Descricao.Delete(lstColunas.ItemIndex);
          Componente.TipoDeDado.Delete(lstColunas.ItemIndex);

          Componente.OperComparador.Delete(lstColunas.ItemIndex);


          Componente.LookupSQL.Delete(lstColunas.ItemIndex);
          Componente.LookupCampoChave.Delete(lstColunas.ItemIndex);
          Componente.LookupCampoExibe.Delete(lstColunas.ItemIndex);

          Componente.Mascaras.Delete(lstColunas.ItemIndex);
          Componente.Larguras.Delete(lstColunas.ItemIndex);
          Componente.SensivelACaixa.Delete(lstColunas.ItemIndex);

          // Inicio - edilaine - SOL 161550 KIN 1717512
          Componente.ApenasLetraENum.Delete(lstColunas.ItemIndex);
          Componente.ComparaMaiuscula.Delete(lstColunas.ItemIndex);
          // Termino - edilaine - SOL 161550 KIN 1717512

          ItemIndexAnt := lstColunas.ItemIndex;
          lstColunas.Items.Delete(lstColunas.ItemIndex);
          Componente.Colunas := lstColunas.Items;

          while (ItemIndexAnt >= lstColunas.Items.Count) do
                Dec(ItemIndexAnt);
          if ItemIndexAnt >= 0 then
          begin
               lstColunas.ItemIndex := ItemIndexAnt;
               lstColunas.SetFocus;
          end;
          AtuColunas(ItemIndexAnt);
     end;
end;

procedure TfrmMSParamsEditor.btnIncluiCamposChaveClick(Sender: TObject);
begin
     if CompareText(TSpeedButton(Sender).Name, 'btnIncluiCamposChave')=0 then
     begin
          Componente.CamposChave.Append(AnsiUpperCase(cmbCamposChave.Text));
          lstCamposChave.Items := Componente.CamposChave;
          lstCamposChave.ItemIndex := lstCamposChave.Items.Count-1;
          lstCamposChave.SetFocus;
          AtuCampos('CamposChave', lstCamposChave.Items.Count-1);
     end;
     if CompareText(TSpeedButton(Sender).Name, 'btnIncluiFiltro')=0 then
     begin
          Componente.Filtro.Append(AnsiUpperCase(edFiltros.Text));
          lstFiltros.Items := Componente.Filtro;
          lstFiltros.ItemIndex := lstFiltros.Items.Count-1;
          lstFiltros.SetFocus;
          AtuCampos('Filtro', lstFiltros.Items.Count-1);
     end;
end;

procedure TfrmMSParamsEditor.btnExcluiCamposChaveClick(Sender: TObject);
var ItemIndexAnt : integer;
begin
     if CompareText(TSpeedButton(Sender).Name, 'btnExcluiCamposChave')=0 then
     begin
          ItemIndexAnt := lstCamposChave.ItemIndex;
          lstCamposChave.Items.Delete(lstCamposChave.ItemIndex);
          Componente.CamposChave := lstCamposChave.Items;
          while (ItemIndexAnt >= lstCamposChave.Items.Count) do
                Dec(ItemIndexAnt);
          if ItemIndexAnt >= 0 then
          begin
               lstCamposChave.ItemIndex := ItemIndexAnt;
               lstCamposChave.SetFocus;
          end;
          AtuCampos('CamposChave',ItemIndexAnt);
     end;

     if CompareText(TSpeedButton(Sender).Name, 'btnExcluiFiltro')=0 then
     begin
          ItemIndexAnt := lstFiltros.ItemIndex;
          lstFiltros.Items.Delete(lstFiltros.ItemIndex);
          Componente.Filtro := lstFiltros.Items;
          while (ItemIndexAnt >= lstFiltros.Items.Count) do
                Dec(ItemIndexAnt);
          if ItemIndexAnt >= 0 then
          begin
               lstFiltros.ItemIndex := ItemIndexAnt;
               lstFiltros.SetFocus;
          end;
          AtuCampos('Filtro',ItemIndexAnt);
     end;

end;

procedure TfrmMSParamsEditor.AtuCampos( Campo:string; iIndex:integer);
begin
     if CompareText(Campo, 'CamposChave')=0 then
     begin
          if iIndex >= 0 then
             cmbCamposChave.Text := lstCamposChave.Items[iIndex]
          else
              cmbCamposChave.Text := '';
     end;

     if CompareText(Campo, 'Filtros')=0 then
     begin
          if iIndex >= 0 then
             edFiltros.Text := lstFiltros.Items[iIndex]
          else
              edFiltros.Text := '';
     end;

     MemoSql.Lines.Text := Componente.MontaSQL ;
end;

procedure TfrmMSParamsEditor.lstCamposChaveClick(Sender: TObject);
begin
     AtuCampos('CamposChave',lstCamposChave.ItemIndex);
end;

procedure TfrmMSParamsEditor.lstFiltrosClick(Sender: TObject);
begin
     AtuCampos('Filtro',lstCamposChave.ItemIndex);
end;

procedure TfrmMSParamsEditor.edDescricaoChange(Sender: TObject);
begin
     if lstColunas.ItemIndex >= 0 then
        Componente.Descricao[lstColunas.ItemIndex] := edDescricao.Text;
end;

procedure TfrmMSParamsEditor.lstColunasClick(Sender: TObject);
begin
   AtuColunas(lstColunas.ItemIndex);
end;

procedure TfrmMSParamsEditor.AtuTipoDeDado(sTipo:string);
begin
     if sTipo = 'C' then
        cmbTipoDeDado.ItemIndex := 0
     else if sTipo = 'N' then
        cmbTipoDeDado.ItemIndex := 1
     else if sTipo = 'D' then
        cmbTipoDeDado.ItemIndex := 2

     else if sTipo = 'L' then
        cmbTipoDeDado.ItemIndex := 3
     else
        cmbTipoDeDado.ItemIndex := -1;
end;
procedure TfrmMSParamsEditor.cmbTipoDeDadoChange(Sender: TObject);
var sTipo : string;
begin
     if lstColunas.ItemIndex >= 0 then
     begin
          case cmbTipoDeDado.ItemIndex of
               0 : begin
                        sTipo := 'C';
                        lblMascara.Caption := '(EditMask)';
                   end;
               1 : begin
                        sTipo := 'N';
                        lblMascara.Caption := '(DisplayFormat)';
                   end;
               2 : begin
                        sTipo := 'D';
                        lblMascara.Caption := '(DisplayFormat)';
                   end;

               3: begin
                     sTipo := 'L';
                     lblMascara.Caption := '(Lookup)';
                  end;


          else
          begin
               sTipo := 'C';
               lblMascara.Caption := '(EditMask)';
          end;
          end;
          Componente.TipodeDado[lstColunas.ItemIndex] := sTipo;


          if trim(Componente.OperComparador[lstColunas.ItemIndex]) = '' then //aqui eu atualizo o combo do operador default
          begin
            if Componente.TipoDeDado[lstColunas.ItemIndex] = 'C' then
              CmbOperDefault.ItemIndex := -1
            else
              CmbOperDefaultN.ItemIndex := -1;
          end
          else begin
            if Componente.TipoDeDado[lstColunas.ItemIndex] = 'C' then
            begin
              CmbOperDefault.ItemIndex := strToIntDef(Componente.OperComparador[lstColunas.ItemIndex], -1);
              CmbOperDefaultN.Visible := false;
              CmbOperDefault.Visible := true;
            end
            else begin
              CmbOperDefaultN.ItemIndex := strToIntDef(Componente.OperComparador[lstColunas.ItemIndex], -1);
              CmbOperDefaultN.Visible := true;
              CmbOperDefault.Visible := false;
            end;
          end;


     end;
end;

procedure TfrmMSParamsEditor.edMascaraChange(Sender: TObject);
begin
     if lstColunas.ItemIndex >= 0 then
        Componente.Mascaras[lstColunas.ItemIndex] := edMascara.Text;
end;

procedure TfrmMSParamsEditor.BitBtn1Click(Sender: TObject);
var i : integer;
begin
     qryTeste.SQL.Assign(MemoSql.Lines);
     qryTeste.Open;
     for i := 0 to Componente.Colunas.Count-1 do
     begin
          TField(qryTeste.Fields[i]).DisplayLabel := Componente.Descricao[i];
          TField(qryTeste.Fields[i]).DisplayWidth := StrToInt(Componente.Larguras[i]);

          if AnsiUpperCase(Componente.TipodeDado[i]) = 'C' then  // TStringField
             TField(qryTeste.Fields[i]).EditMask := Componente.Mascaras[i];
          if AnsiUpperCase(Componente.TipodeDado[i]) = 'N' then  // TNumericField
             TNumericField(qryTeste.Fields[i]).DisplayFormat := Componente.Mascaras[i];
          if AnsiUpperCase(Componente.TipodeDado[i]) = 'D' then  // TDateField
             TDateTimeField(qryTeste.Fields[i]).DisplayFormat := Componente.Mascaras[i];

     end;
     grdTeste.Visible := true;


     if (grdTeste.CanFocus) then
        grdTeste.SetFocus;
end;

procedure TfrmMSParamsEditor.grdTesteExit(Sender: TObject);
begin
     grdTeste.Visible := false;
     qryTeste.Close;
end;

procedure TfrmMSParamsEditor.spnLarguraChange(Sender: TObject);
begin
     if lstColunas.ItemIndex >= 0 then
        Componente.Larguras[lstColunas.ItemIndex] := spnLargura.Text;
end;

function TfrmMSParamsEditor.SemPonto(sTexto : string) : string;
begin
     Result := Copy(sTexto, Pos('.', sTexto)+1,100);
end;

procedure TfrmMSParamsEditor.CkbCaseClick(Sender: TObject);
begin
     if lstColunas.ItemIndex >= 0 then
     Begin
        If CkbCase.Checked Then
           Componente.SensivelACaixa[lstColunas.ItemIndex] := 'S'
        Else
           Componente.SensivelACaixa[lstColunas.ItemIndex] := 'N';
     End;
end;

procedure TfrmMSParamsEditor.CkbDistinctClick(Sender: TObject);
begin
  Componente.UsaDistinct := CkbDistinct.Checked;
end;

procedure TfrmMSParamsEditor.CkbRepeteClick(Sender: TObject);
begin
  Componente.RepeteConsulta := CkbRepete.Checked;
end;

procedure TfrmMSParamsEditor.CMOkCancelar1OkClick(Sender: TObject);
begin
  Componente.Caption := EdtTitulo.Text;
  ModalResult := MrOk;
end;

procedure TfrmMSParamsEditor.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;


procedure TfrmMSParamsEditor.CmbOperDefaultChange(Sender: TObject);
begin
  if trim(CmbOperDefault.text) = '' then
    CmbOperDefault.ItemIndex := -1;

  Componente.OperComparador[lstColunas.ItemIndex] := intToStr(CmbOperDefault.ItemIndex);
end;

procedure TfrmMSParamsEditor.CmbOperDefaultNChange(Sender: TObject);
begin
  if trim(CmbOperDefaultN.text) = '' then
    CmbOperDefaultN.ItemIndex := -1;

  Componente.OperComparador[lstColunas.ItemIndex] := intToStr(CmbOperDefaultN.ItemIndex);
end;

procedure TfrmMSParamsEditor.FormCreate(Sender: TObject);
begin
  CmbOperDefault.Items.Clear;
  CmbOperDefault.Items.Add('começa com');
  CmbOperDefault.Items.Add('é igual a');
  CmbOperDefault.Items.Add('possui o texto');
  CmbOperDefault.Items.Add('é maior que ');
  CmbOperDefault.Items.Add('é maior ou igual que ');
  CmbOperDefault.Items.Add('é menor que ');
  CmbOperDefault.Items.Add('é menor ou igual que ');
  CmbOperDefault.Items.Add('é diferente de ');

  CmbOperDefaultN.Items.Clear;
  CmbOperDefaultN.Items.Add('é igual a');
  CmbOperDefaultN.Items.Add('é maior que ');
  CmbOperDefaultN.Items.Add('é maior ou igual que ');
  CmbOperDefaultN.Items.Add('é menor que ');
  CmbOperDefaultN.Items.Add('é menor ou igual que ');
  CmbOperDefaultN.Items.Add('é diferente de ');


  PageControl.ActivePageIndex := 0;
end;




procedure TfrmMSParamsEditor.edtSqlChange(Sender: TObject);
begin
   if lstColunas.ItemIndex >= 0 then
      Componente.LookupSQL[lstColunas.ItemIndex] := edtSql.Text;

end;

procedure TfrmMSParamsEditor.edtIdTabelaChange(Sender: TObject);
begin
   if lstColunas.ItemIndex >= 0 then
      Componente.LookupCampoChave[lstColunas.ItemIndex] := edtIdTabela.Text;
end;

procedure TfrmMSParamsEditor.edtCampoLkpChange(Sender: TObject);
begin
   if lstColunas.ItemIndex >= 0 then
      Componente.LookupCampoExibe[lstColunas.ItemIndex] := edtCampoLkp.Text;
end;

// Inicio - edilaine - SOL 161550 KIN 1717512
procedure TfrmMSParamsEditor.CkbSemEspecialClick(Sender: TObject);
begin
  if lstColunas.ItemIndex >= 0 then
  Begin
     If CkbsemEspecial.Checked Then
        Componente.ApenasLetraENum[lstColunas.ItemIndex] := 'S'
     Else
        Componente.ApenasLetraENum[lstColunas.ItemIndex] := 'N';
  End;
end;

procedure TfrmMSParamsEditor.CkbSoCxAltaClick(Sender: TObject);
begin
  if lstColunas.ItemIndex >= 0 then
  Begin
     If CkbSoCxAlta.Checked Then
        Componente.ComparaMaiuscula[lstColunas.ItemIndex] := 'S'
     Else
        Componente.ComparaMaiuscula[lstColunas.ItemIndex] := 'N';
  End;
end;
// Termino - edilaine - SOL 161550 KIN 1717512

end.

