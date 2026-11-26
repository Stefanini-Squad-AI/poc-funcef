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
{*******************************************************}
{--------------------------------------------------------------------------------------------------
rotinas     : SoLetraENum, EditLetraKeyPress, CreateTipo
Pendência   : SOL 161550 KTN 1717512
Responsável : Edilaine
Data        : 26/08/2014
Descrição   : Implantar flags para permitir apenas letras e numeros no campo de filtro
--------------------------------------------------------------------------------------------------
Data     : 15.05.2007
Analista : Antonio Marcos (amf)
Pendência: 24746
Descrição: O ClientDataSet de Lookup agora é criado em tempo de execução associado a
          quantidade de lookups encontrados.
--------------------------------------------------------------------------------
Data     : 22.01.2007
Analista : Antonio Marcos (amf)
Pendência: 21376
Descrição: Implementação de LookUp no MontaSelect
--------------------------------------------------------------------------------
Analista : Antonio Marcos (amf)
Pendência: 23709
Descrição : Aceita valores do clipboard do windows. (Ctrl+V)
            adicionado aos combos (do tipo caracter) os testes de IS NULL e IS NOT NULL p/ tipos caracter
--------------------------------------------------------------------------------
Analista  : Alex e Turon
Método    : FormActivate
Pendência : 16482 - pte da pendência
Descrição : Corrigir a passagem de valor default ITEMSBUSCA quando passado data
===============================================================================}

unit MSFMontaSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Db, Wwdatsrc, DBTables, wwQuery, ComCtrls, DBCtrls, Spin, TB97, CMDateTimePicker, TB97Tlbr,
  TB97Ctls, MAHlpBtn, IvDictio, IvMulti, IvEMulti, Menus, CmDock, DBClient,
  Provider, ImgList, mconnect, wwdblook, CMDBLookupCombo;

type
  TfrmMontaSelect = class(TForm)
    PageControl: TPageControl;
    tbsEscolha: TTabSheet;
    tbsLista: TTabSheet;
    dbgLista: TwwDBGrid;
    Panel1: TPanel;
    ToolbarButton971: TToolbarButton97;
    sbEscolha: TScrollBox;
    pnlEscolha: TPanel;
    ivTradutor: TIvExtendedTranslator;
    ImgBotaoC: TImage;
    ImgBotaoD: TImage;
    ImgBotao: TImage;
    DlgSalvar: TSaveDialog;
    CMOkCancelar: TCMOkCancelar;
    PnlSalvar: TPanel;
    BtnSalvar: TBitBtn;
    PnlBusca: TPanel;
    bbtnBusca: TBitBtn;
    CdsSeleciona: TClientDataSet;
    ImlTitle: TImageList;
    DsSeleciona: TwwDataSource;
    procedure dbgListaTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure bbtnBuscaClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgListaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure CMOkCancelarSairClick(Sender: TObject);
    procedure CMOkCancelarOkClick(Sender: TObject);
    procedure CMOkCancelarCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgListaCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
  private
    { Private declarations }
    FPaineis : TList;
    _OldBotaTag :Integer;
    Function Spc (QTD:Integer):String;
    Function AE(S:string; T:Integer):String;
    Function AD(S:string; T:Integer):String;
  protected

  public
    { Public declarations }
    destructor Destroy;override;
    property Paineis : TList read FPaineis write FPaineis;
    procedure ClickBotao(Sender: TObject);
    Function BuscaFieldName:string;
  end;

    TPainelCampo = class(TDock97)
    private
           Painel : TToolBar97;
           FDescCampo : TLabel;
           FcmbCompara : TComboBox;
           FedCompara : TEdit;
           FDateCompara : TCMDateTimePicker;
           FCheckCase : TCheckBox;
           fBotao :TSpeedButton;
           FPanelCase : TPanel;
           FNomeCampo,
           FTipoDado,
           FCaseSensitive,
           FSoLetraENum : string;   // edilaine - SOL 161550 KIN 1717512

           FlkpCompara: TwwDBLookupCombo;
           FCdsLookUp: TClientDataSet;
           function GetTableLookup(sTexto: string): string;
           procedure EditKeyPress(Sender: TObject; var Key: Char);
           procedure EditLetraKeyPress(Sender : TObject; var Key : Char);  // edilaine - SOL 161550 KIN 1717512
    protected

    public
          constructor CreateTipo(AOwner:TComponent; TipoData, SensivelACaixa :string; iIndice :Integer;
          IndiceOperDefault: integer; ApenasLetraENum : string);   // edilaine - SOL 161550 KIN 1717512
          destructor Destroy; override;
          property DescCampo   : TLabel read FDescCampo write FDescCampo;
          property NomeCampo   : string read FNomeCampo write FNomeCampo;
          property TipoDado    : string read FTipoDado write FTipoDado;
          property CaseSensitive    : string read FCaseSensitive write FCaseSensitive;
          property DateCompara : TCMDateTimePicker read FDateCompara write FDateCompara;
          property edCompara   : TEdit read FedCompara write FedCompara;
          property cmbCompara  : TComboBox read FcmbCompara write FcmbCompara;
          property CheckCase   : TCheckBox read FCheckCase Write fCheckCase;
          property Botao   : TSpeedButton read fBotao Write fBotao;
          property PanelCase   : TPanel read FPanelCase Write FPanelCase;
          property SoLetraENum : string read FSoLetraENum write FSoLetraENum;  // edilaine - SOL 161550 KIN 1717512

          property LkpCompara  : TwwDbLookupCombo read FLkpCompara write FlkpCompara;
   published

   end;
var
  frmMontaSelect: TfrmMontaSelect;

const
      TamTextoCompara = 9;

      TamNumCompara = 7;
      ListaTextoCompara : array[0..TamTextoCompara] of string = (
                          'começa com',                         {ivlm}
                          'é igual a',                          {ivlm}
                          'possui o texto',                     {ivlm}
                          'é maior que ',                       {ivlm}
                          'é maior ou igual que ',              {ivlm}
                          'é menor que ',                       {ivlm}
                          'é menor ou igual que ',              {ivlm}
                          'é diferente de ',                    {ivlm}
                          'é nulo         ',
                          'não é nulo     '
                          );
      ListaOperCharCompara : array[0..TamTextoCompara] of string = (
                             'LIKE ''%s%%''',
                             '= ''%s''',
                             'LIKE ''%%%s%%''',
                             '> ''%s''',
                             '>= ''%s''',
                             '< ''%s''',
                             '<= ''%s''',
                             '<> ''%s''',
                             'IS NULL  ',
                             'IS NOT NULL '
                             );

      ListaNumCompara : array[0..TamNumCompara] of string = (
                        'é igual a',                        {ivlm}
                        'é maior que ',                     {ivlm}
                        'é maior ou igual que ',            {ivlm}
                        'é menor que ',                     {ivlm}
                        'é menor ou igual que ',            {ivlm}
                        'é diferente de ',                  {ivlm}
                        'é nulo         ',
                        'não é nulo     '
                        );
      ListaOperNumCompara : array[0..TamNumCompara] of string = (
                            '= %s',
                            '> %s',
                            '>= %s',
                            '< %s',
                            '<= %s',
                            '<> %s',
                             'IS NULL  ',
                             'IS NOT NULL '
                            );

implementation

uses MontaSelect, uMensErro, uCMTypes, dBaseDados, uCtrlPadroes;

{$R *.DFM}

constructor TPainelCampo.CreateTipo(AOwner:TComponent; TipoData, SensivelACaixa :string; iIndice :Integer;
                                    IndiceOperDefault: integer;
                                    ApenasLetraENum : string);    // edilaine - SOL 161550 KIN 1717512
var i : integer;
begin
     inherited Create(AOwner);

     AllowDrag := false;
     Parent := TfrmMontaSelect(AOwner).pnlEscolha;
     Painel := TToolBar97.Create(AOwner);
     Painel.DockedTo := Self;

     TipoDado := TipoData;
     CaseSensitive := SensivelACaixa;
     SoLetraENum := ApenasLetraENum;  // edilaine - SOL 161550 KIN 1717512

     with TToolBarSep97.Create(AOwner) do
     begin
          Blank := true;
          Parent := Painel;
     end;

     DescCampo := TLabel.Create(AOwner);
     with DescCampo do
     begin
          Parent := Painel;
          Font.Style := [fsBold];
          Width := 140;
          AutoSize := false;
     end;

     with TToolBarSep97.Create(AOwner) do
     begin
          Blank := true;
          Parent := Painel;
     end;

     cmbCompara := TComboBox.Create(AOwner);
     with cmbCompara do
     begin
          Parent := Painel;
          width := 150;
          Font.Style := [fsBold];


          style := Stdctrls.csDropDownList;
          Items.Clear;
          if TipoDado = 'C' then
             for i := 0 to TamTextoCompara do
                 Items.Add(ListaTextoCompara[i])
          else
             for i := 0 to TamNumCompara do
                 Items.Add(ListaNumCompara[i]);



          if IndiceOperDefault < 0 then
            ItemIndex := 0
          else
            ItemIndex := IndiceOperDefault;

     end;

     with TToolBarSep97.Create(AOwner) do
     begin
          Blank := true;
          Parent := Painel;
     end;

     if FTipoDado = 'D' then
     begin
          FDateCompara := TCMDateTimePicker.Create(AOwner);
          with FDateCompara do
          begin
               Parent := Painel;
               Text := '';
               width := 200;
          end;
     end
     else
     begin

          if FTipoDado = 'L' then
          begin
            FlkpCompara        := TwwDBLookupCombo.Create(Aowner);
            FlkpCompara.Parent := Painel;
            FlkpCompara.Text   := '';
            FlkpCompara.width  := 200;
            FCdsLookUp         := TClientDataSet.Create(Aowner);


            flkpCompara.Font.Style := [fsBold];
            flkpCompara.style := wwDbLook.csDropDownList;


            cmbCompara.ItemIndex := 0;
            cmbCompara.Enabled := False;
          end
          else
          begin
            FedCompara := TEdit.Create(AOwner);
            with edCompara do
            begin
                 Parent := Painel;
                 Text := '';
                 width := 200;

                 if FTipoDado = 'N' then
                    OnKeyPress := EditKeyPress;

                 // Inicio - edilaine - SOL 161550 KIN 1717512
                 if SoLetraENum = 'S' then
                    OnKeyPress := EditLetraKeyPress;
                 // Termino - edilaine - SOL 161550 KIN 1717512
            end;
          end;
     end;

     with TToolBarSep97.Create(AOwner) do
     begin
          Blank := true;
          Parent := Painel;
     end;

     //*******

     fBotao := TSpeedButton.Create(AOwner);
     with fBotao do
     begin
          Parent := Painel;
          Caption := '';
          Hint := 'Indique a Ordenação';
          ShowHint := True;
          fBotao.Tag := iIndice;
          GroupIndex := 2;
          Glyph := TfrmMontaSelect(AOwner).ImgBotao.Picture.Bitmap;
          OnClick := TfrmMontaSelect(AOwner).ClickBotao;
          AllowAllUp := True;


          if (FTipoDado = 'L') then
             fBotao.Enabled := False;
     end;

     with TToolBarSep97.Create(AOwner) do
     begin
          Blank := true;
          Parent := Painel;
     end;


     If ((FTipoDado = 'C') or (FTipoDado = 'L')) Then
     Begin
        fCheckCase := TCheckBox.Create(AOwner);
        with fCheckCase do
        begin
             Parent := Painel;
             Caption := 'A=a';
             width := 45;
             Hint := 'Diferenciar MAIÚSCULAS de minúsculas na pesquisa';
             ShowHint := True;
             Checked := (CaseSensitive <> 'S');



             if (FTipoDado = 'L') then
                Enabled := False;

        end;
     End
     Else
     Begin
        FPanelCase := TPanel.Create(AOwner);
        with FPanelCase do
        begin
             Parent := Painel;
             Caption := '';
             Height := 20;
             width := 45;
             Bevelinner := bvNone;
             Bevelouter := bvNone;
        end;
     End;

     with TToolBarSep97.Create(AOwner) do
     begin
          Blank := true;
          Parent := Painel;
     end;



     TfrmMontaSelect(AOwner).pnlEscolha.Height := TfrmMontaSelect(AOwner).pnlEscolha.Height+ Height;
end;

destructor TPainelCampo.Destroy ;
var i : integer;
begin
     for i := 0 to Painel.ComponentCount-1 do
         Painel.Components[i].free;

     for i := 0 to ComponentCount-1 do
         Components[i].free;
     inherited;
end;

destructor TfrmMontaSelect.Destroy;
var i : integer;
begin
     inherited;
     for i := 0 to ComponentCount-1 do
         Components[i].free;
end;

procedure TfrmMontaSelect.dbgListaTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   TMontaSelect(Owner).CampoParaOrdenacao := '';
   TMontaSelect(Owner).MudaOrdem(AFieldName);
end;

procedure TfrmMontaSelect.bbtnBuscaClick(Sender: TObject);
begin
     TMontaSelect(Owner).Busca;
end;

procedure TfrmMontaSelect.PageControlChange(Sender: TObject);
begin
     If (PageControl.ActivePage = tbsLista) Then
     Begin
        PnlBusca.Visible := False;
        PnlSalvar.Visible := (TMontaSelect(Owner).Salvaconsulta);

        CMOkCancelar.Buttons.BtnOk.Visible := True;


        dbgLista.Visible := True;
        If dbgLista.CanFocus Then dbgLista.SetFocus;
     End
     Else
     Begin
        PnlSalvar.Visible := False;
        PnlBusca.Visible := True;

        CMOkCancelar.Buttons.BtnOk.Visible := False;


        dbgLista.Visible := False;
     End;
end;

procedure TfrmMontaSelect.FormDestroy(Sender: TObject);
begin
   Paineis.free;
   If UpperCase(TMontaSelect(Owner).DataBaseName) <> 'BASEDADOS' Then
      Padroes.Free;
end;

procedure TfrmMontaSelect.FormActivate(Sender: TObject);
var i : integer;
begin

     for i := 0 to TMontaSelect(Owner).ItemsBusca.count-1 do begin

       if TPainelCampo(FPaineis[i]).TipoDado = 'D' then begin
         try
           TPainelCampo(Paineis[i]).DateCompara.Date := StrToDate(trim(TMontaSelect(Owner).ItemsBusca[i]));
         except
           TPainelCampo(Paineis[i]).DateCompara.Clear;
         end;

       end else
         TPainelCampo(Paineis[i]).edCompara.Text := trim(TMontaSelect(Owner).ItemsBusca[i]);
     end;

     if CdsSeleciona.Active then
     begin
       If TMontaSelect(Owner).RepeteConsulta Then
       Begin
          TMontaSelect(Owner).CampoParaOrdenacao := BuscaFieldName;
          TMontaSelect(Owner).OrderAscendente    := (ImgBotao.Tag = 1);
          TMontaSelect(Owner).Busca;
          PageControl.ActivePage := tbsLista;
       End
       Else
          PageControl.ActivePage := tbsEscolha;
     end
     else
     begin
       PageControl.ActivePage := tbsEscolha;
       If TMontaSelect(Owner).RepeteConsulta Then
       Begin
          if TMontaSelect(Owner).ItemsBusca.count > 0 then
          Begin
             TMontaSelect(Owner).CampoParaOrdenacao := BuscaFieldName;
             TMontaSelect(Owner).OrderAscendente    := (ImgBotao.Tag = 1);
             TMontaSelect(Owner).Busca;
          End;
       End;
     end;

     PageControlChange(Self);

     If TPainelCampo(FPaineis[0]).TipoDado = 'D' Then
     Begin
        If (TPainelCampo(FPaineis[0]).DateCompara <> nil) And
           (TPainelCampo(FPaineis[0]).DateCompara.CanFocus) Then TPainelCampo(FPaineis[0]).DateCompara.SetFocus;
     End
     Else
     Begin
        If (TPainelCampo(FPaineis[0]).edCompara <> nil) And
           (TPainelCampo(FPaineis[0]).edCompara.CanFocus) Then TPainelCampo(FPaineis[0]).edCompara.SetFocus;
     End;
end;

procedure TfrmMontaSelect.dbgListaDblClick(Sender: TObject);
begin
   If CdsSeleciona.Active Then ModalResult := mrOk ;
end;

procedure TfrmMontaSelect.FormCreate(Sender: TObject);
begin
   pnlEscolha.Height := 2;
   TMontaSelect(Owner).CriaForm(Self);

   If UpperCase(TMontaSelect(Owner).DataBaseName) <> 'BASEDADOS' Then
   Begin
      Padroes := TCtrlPadroes.Create;
      Padroes.Initialize(Session.FindDatabase(TMontaSelect(Owner).DataBaseName),false);
   End;

end;

Function TfrmMontaSelect.BuscaFieldName:String;
Var
   x:Integer;
Begin
    For X:=0 To ComponentCount - 1 Do
    Begin
       If (Components[x] is TSpeedButton) Then
       Begin
           If (Components[x] as TSpeedButton).Down Then
           Begin
               Result := TMontaSelect(Owner).Colunas[(Components[x] as TSpeedButton).Tag];
               Break;
           End
           Else
               Result := '';
       End
       Else
         Result := '';
    End;
End;


procedure TfrmMontaSelect.ClickBotao(Sender: TObject);
Var
  X:Integer;
Begin
   If _OldBotaTag <> TSpeedButton(Sender).Tag Then
   Begin
      ImgBotao.Tag := 0;
      _OldBotaTag  := TSpeedButton(Sender).Tag;
      For X:=0 To ComponentCount - 1 Do
      Begin
         If (Components[x] is TSpeedButton) Then
         Begin
             If (Components[x] as TSpeedButton).Parent <> dbgLista Then
             Begin
               ImgBotao.Tag := 0;
               (Components[x] as TSpeedButton).glyph := ImgBotao.Picture.Bitmap;
               (Components[x] as TSpeedButton).Down := False;
               (Components[x] as TSpeedButton).Hint  := 'Indique a Ordenação';
             End;
         End;
      End;
   End;

   Case ImgBotao.Tag Of
   0:
   Begin
     TSpeedButton(Sender).glyph := ImgBotaoC.Picture.Bitmap;
     TSpeedButton(Sender).Hint  := 'Ordenação Crescente';
   End;
   1:
   Begin
     TSpeedButton(Sender).glyph := ImgBotaoD.Picture.Bitmap;
     TSpeedButton(Sender).Hint  := 'Ordenação Decrescente';
   End;
   End;

   ImgBotao.Tag := ImgBotao.Tag + 1;

   If ImgBotao.Tag > 2 Then
   Begin
     ImgBotao.Tag := 0;
     TSpeedButton(Sender).glyph := ImgBotao.Picture.Bitmap;
     TSpeedButton(Sender).Down := False;
     TSpeedButton(Sender).Hint  := 'Indique a Ordenação';
   End
   Else
     TSpeedButton(Sender).Down := True;
End;

procedure TfrmMontaSelect.BtnSalvarClick(Sender: TObject);
Var
  MsExecutar :TMontaSelect;
  T: TextFile;
  Slinha :String;
  X :Integer;
begin
     MsExecutar := TMontaSelect(Owner);
     DlgSalvar.Title := 'Salvar Consulta';

     If DlgSalvar.Execute Then
     Begin
        CdsSeleciona.First;

        Try
           Screen.Cursor := CrHourGlass;

           If DlgSalvar.FilterIndex = 1 Then
           Begin

              AssignFile(T,DlgSalvar.FileName);
              Rewrite(T);

              Slinha := '';

              For X:=0 To MsExecutar.Colunas.Count - 1 Do
                  If CdsSeleciona.Fields[x].DataType = ftFloat Then
                     SLinha := sLinha + AD(MsExecutar.Descricao[x],
                               StrToIntDef(MsExecutar.Larguras[x],CdsSeleciona.Fields[x].Size)) + ' '
                  Else
                     SLinha := sLinha + AE(MsExecutar.Descricao[x],
                                               StrToIntDef(MsExecutar.Larguras[x],CdsSeleciona.Fields[x].Size)) + ' ';

              WriteLn(T,Slinha);

              WriteLn(T,'');

              While Not CdsSeleciona.Eof Do
              Begin
                 Slinha := '';

                 For X:=0 To MsExecutar.Colunas.Count - 1 Do
                     If CdsSeleciona.Fields[x].DataType = ftFloat Then
                        SLinha := sLinha + AD(CdsSeleciona.Fields[x].AsString,StrToIntDef(MsExecutar.Larguras[x],CdsSeleciona.Fields[x].Size)) + ' '
                     Else
                        SLinha := sLinha + AE(CdsSeleciona.Fields[x].AsString,StrToIntDef(MsExecutar.Larguras[x],CdsSeleciona.Fields[x].Size)) + ' ';

                 WriteLn(T,Slinha);

                 CdsSeleciona.Next;
              End;

              CdsSeleciona.First;
              CloseFile(T);

              Application.MessageBox('Término da Gravação','Salvar Consulta',Mb_Ok + Mb_IconInformation);
           End
           Else
           Begin

           End;
        finally
           Screen.Cursor := CrDefault;
        End;
     End;
end;

Function TfrmMontaSelect.AD(S:string; T:Integer):String;
var temp:string;
    tam, cont:Integer;
Begin
     If S <> '' Then
     Begin
          temp := Trim(s);

          If length(Temp) > T Then
             temp := Copy(Temp,1,T);

          tam := length(temp);

          for cont:=1 to t - tam do
             temp:=' '+temp;

          result := temp;
     End
     Else
          result := Spc(T);
end;

Function TfrmMontaSelect.AE(S:string; T:Integer):String;
var temp:string;
    cont, tam:Integer;
Begin
   If S <> '' Then
   Begin
     temp := Trim(s);

     If length(Temp) > T Then
          temp := Copy(Temp,1,T);

     tam := length(temp);

     for cont:=1 to t - tam do
     temp:=temp+' ';
     result := temp;
   End
     Else
          result := Spc(T);
end;

Function TfrmMontaSelect.Spc (QTD:Integer):String;
var cont: Integer;
    t:string;
begin
   t:='';
   for cont:=1 to qtd do
   t:=t+' ';
   result := t;
end;


procedure TfrmMontaSelect.CMOkCancelarSairClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmMontaSelect.CMOkCancelarOkClick(Sender: TObject);
begin
   If CdsSeleciona.Active Then ModalResult := mrOk;
end;

procedure TfrmMontaSelect.CMOkCancelarCancelarClick(Sender: TObject);
begin
     TMontaSelect(Owner).Cancela;
end;

procedure TfrmMontaSelect.FormShow(Sender: TObject);
Var
  X: Integer;
  i: integer;
begin
   For X:=0 To FPaineis.Count - 1 Do
   begin
       try
       TPainelCampo(FPaineis[x]).DescCampo.Caption := TMontaSelect(Owner).Descricao[x];


       if (TPainelCampo(FPaineis[x]).FlkpCompara <> nil) then
       begin
         TPainelCampo(FPaineis[x]).FlkpCompara.AllowClearKey := True;
         TPainelCampo(FPaineis[x]).FlkpCompara.ShowMatchText := True;
         TPainelCampo(FPaineis[x]).FlkpCompara.Style         := csDropDownList;




         TPainelCampo(FPaineis[x]).FCdsLookUp.Data := TMontaSelect(Owner).GetResultLookup(TMontaSelect(Owner).LookupSQL[x]);

         TPainelCampo(FPaineis[x]).FlkpCompara.LookupField := TMontaSelect(Owner).LookupCampoChave[x];
         TPainelCampo(FPaineis[x]).FlkpCompara.LookupTable := TPainelCampo(FPaineis[x]).FCdsLookUp;

         TPainelCampo(FPaineis[x]).flkpCompara.Selected.add(TMontaSelect(owner).LookupCampoExibe[x] + #9 + '25' + #9 + 'Descrição');
       end;
       except
          on E:Exception do
             ShowMessage(E.Message);
       end;

   end;

   BringToFront;
end;

procedure TfrmMontaSelect.dbgListaCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  If UpperCase(Field.FieldName) = UpperCase(TMontaSelect(Owner).CampoParaOrdenacao) Then
  Begin
     TitleImageAttributes.Alignment := taRightJustify;

     If TMontaSelect(Owner).AscOrderBy Then
        TitleImageAttributes.ImageIndex := 1
     ELse
        TitleImageAttributes.ImageIndex := 0;
  End
  Else
     TitleImageAttributes.ImageIndex := -1;
end;

procedure TPainelCampo.EditKeyPress(Sender: TObject; var Key: Char);
begin
  
  if (Key = Chr(VK_CONTROL)) then
     exit;

  case key of
    '0'..'9', '-', #8: ;
    '.':
    begin
      if pos(',', TEdit(Sender).Text) > 0 then
         key := #0
      else
         Key := ',';
    end;
    ',': if pos(',', TEdit(Sender).Text) > 0 then key := #0;
  Else
    Key := #0;
  End;

end;

procedure TPainelCampo.EditLetraKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_CONTROL)) then
     exit;

  if not (Key in ['A'..'Z', 'a'..'z', '0'..'9', ' ', #08]) then
     key := #0;
end;

function TPainelCampo.GetTableLookup(sTexto: string): string;
begin
   Result := Copy(sTexto, (Pos('FROM', sTexto) + 5), 20);
end;


end.
