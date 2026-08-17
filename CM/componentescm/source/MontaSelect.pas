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

{-------------------------------------------------------------------------------
N. SIG.............: 50898
Data da Alteração..: 10/12/2019
Responsável........: Everson Cunha
Descrição..........: FAscOrderBy True / False
--------------------------------------------------------------------------------
Pendência   : SOL 161550 KTN 1717512
Responsável : William Santana - FHBS - Edilaine
Data        : 29/07/2014
Descrição   : Implantar flag para marcação da informação "Curatela Extinta".
              Essa opção deverá constar na tela de cadastro de data inicio e
              data fim de curatela.
--------------------------------------------------------------------------------
Data     : 15.05.2007
Analista : Antonio Marcos (amf)
Pendência: 24746
Descrição: - Corrigi o access violation que ocorria ao tentar cancelar
           - Implementada pesquisa com mais de um lookup.
--------------------------------------------------------------------------------
Data     : 22.01.2007
Analista : Antonio Marcos (amf)
Pendência: 21376
Descrição: Implementação de LookUp no MontaSelect
--------------------------------------------------------------------------------
Analista : Antonio Marcos (amf)
Pendência: 23709
Descrição: adicionado aos combos (do tipo caracter) os testes de IS NULL e IS NOT NULL
           adicionado aos combos (do tipo numero) os teste de IS NULL e IS NOT NULL
----------------------------------------------------------------------------------
Desenvolvedor: Alex Pereira
Data         : 02/03/2004
Pendência    : 15094
Solução      : Implementar os métodos AfterOpen e BeforeOpen no MontaSelect.
               Para manipular o texto do sql da query antes abrí-la e editar
               registros do clientdataset após abri-la
*******************************************************************************}

unit MontaSelect;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls, MSFMontaSelect, db, DsgnIntf, typinfo, UMensErro, dbclient,
  JclStrings, Wwdbigrd;


type
  TParams = class(TPersistent);

  TAfterOpenCds = Procedure (oCds: TClientDataSet) of object;
	TBeforeOpenCds = procedure (var sqlText: string; strListParams: TStringList) of object;

  TMontaSelect = class;

  TMsTemplate = Class(Tpersistent)
  private
    fIdConsulta :LongInt;
    fDataBaseSettings :TParams;
    fOwner :TMontaSelect;
    bAtribuiId :Boolean;
    Procedure SetDataBaseSettings(Value :TParams);
    Procedure SetIdConsulta(Value :LongInt);
  protected

  Public
    constructor Create(Aowner:TMontaSelect);
    property Owner :TMontaSelect read fOwner;
  published
    property IdConsulta :LongInt read fIdConsulta write SetIdConsulta;
    property DataBaseSettings  :TParams read fDataBaseSettings write SetDataBaseSettings;
  End;

  TMsDataBaseSettings = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TMontaSelect = class(TComponent)
  private
    { Private declarations }
    _RegistroAtual: Integer;

    FColunas,
    FTabelas,
    FTipodeDado,
    FDescricao,
    FOperComparador,
    FCamposChave,
    FValoresChave,
    FFiltro,
    FNomesCampos,
    FNomesColunas,
    FMascaras,
    FLarguras,
    FSensivelACaixa,
    FBusca : TStrings;
    FFormSeleciona : TfrmMontaSelect;
    FText,
    FDataBaseName,
    FCaption,
    FCampoOrderBy : string;
    FParams : TParams;
    FLinhaOrderBy,
    FCamposVisiveis : integer;
    FAscOrderBy : boolean;
    FRetornouValor : boolean;
    fRepeteConsulta :Boolean;
    fCampoParaOrdenacao :String;
    fOrderAscendente :Boolean;
    fUsaDistinct :Boolean;
    fTemplate :TMsTemplate;
    fSalvaConsulta :Boolean;
    fExibePergunta :Boolean;
    bExisteFiltro :Boolean;
    FMultiSelect: Boolean;
    FAfterOpenCds: TAfterOpenCds;
    FBeforeOpenCds: TBeforeOpenCds;

    FSelectedParams: TStringList;


    FLookupSQL       : TStrings;
    FLookupCampoChave: TStrings;
    FLookupCampoExibe: TStrings;

    FForcaValoresChave: Boolean;  // edilaine - SOL 161550 KIN 1717512
    FApenasLetraENum: TStrings;   // edilaine - SOL 161550 KIN 1717512
    FComparaMaiuscula: TStrings;  // FHBS - SOL 161550 KIN 1717512


    procedure SetAscOrderBy(const Value: boolean);
    function GetDataForComponentState(sSql: String): OleVariant;
    function GetSelCount: Integer;
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetAfterOpenCds(const Value: TAfterOpenCds);
    procedure SetBeforeOpenCds(const Value: TBeforeOpenCds);

    procedure DoAfterOpenCds(lCds: TClientDataSet);
    procedure DoBeforeOpenCds(var sqlText: String; strListParams: TStringList);

  protected
    { Protected declarations }
    procedure SetColunas(s:TStrings);
    procedure SetMascaras(s:TStrings);
    procedure SetLarguras(s:TStrings);
    procedure SetBusca(s:TStrings);
    procedure SetTipoDeDado(s:TStrings);
    procedure SetTabelas(s:TStrings);
    procedure SetDescricao(s:TStrings);
    procedure SetSensivelACaixa(s:TStrings);
    procedure SetFiltro(s:TStrings);
    procedure SetCamposChave(s:TStrings);
    procedure SetParams(p:TParams);
    procedure SetDataBaseName(s:string);
    procedure SetOperComparador(s: TStrings);
    procedure SetLookupSQL(Value: TStrings);
    procedure SetLookupCampoChave(Value: TStrings);
    procedure SetLookupCampoExibe(Value: TStrings);
    procedure SetApenasLetraENum(s: TStrings);
    procedure SetComparaMaiuscula(s: TStrings);
  public
    { Public declarations }

    property Text : String read FText write FText;
    property ValoresChave : TStrings read FValoresChave;
    property RetornouValor : Boolean read FRetornouValor;
    property AscOrderBy : boolean read FAscOrderBy write SetAscOrderBy;

    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    function Executar : TModalResult;
    procedure Busca;
    procedure Cancela;
    procedure AbreQuery;
    procedure MudaOrdem(AFieldName: String);
    procedure CriaForm(FFormSeleciona:TfrmMontaSelect);
    function MontaSQL : string;
    property ItemsBusca : TStrings read FBusca  write SetBusca;
    property CampoParaOrdenacao: String  read fCampoParaOrdenacao write fCampoParaOrdenacao;
    property OrderAscendente: Boolean  read fOrderAscendente write fOrderAscendente;

    property SelCount: Integer read GetSelCount;


    function GetResultLookup(sSql: String): OleVariant;

    function GetNextSelected: Boolean;

    procedure ForcaValoresChave(aValores: array of Variant);

  published
    { Published declarations }
    property Params      : TParams read FParams   write SetParams;
    property Template    : TMsTemplate read fTemplate write fTemplate;

    property Caption          : String read FCaption write FCaption;
    property Colunas          : TStrings read FColunas write SetColunas;
    property TipodeDado       : TStrings read FTipoDeDado write SetTipoDeDado;
    property Descricao        : TStrings read FDescricao write SetDescricao;
    property SensivelACaixa   : TStrings read FSensivelACaixa write SetSensivelACaixa;
    property Tabelas          : TStrings read FTabelas write SetTabelas;
    property CamposChave      : TStrings read FCamposChave write SetCamposChave;
    property Filtro           : TStrings read FFiltro write SetFiltro;
    property Mascaras         : TStrings read FMascaras write SetMascaras;
    property Larguras         : TStrings read FLarguras write SetLarguras;

    property OperComparador   : TStrings read FOperComparador write SetOperComparador;

    property ApenasLetraENum  : TStrings read FApenasLetraENum write SetApenasLetraENum;      // edilaine - SOL 161550 KIN 1717512
    property ComparaMaiuscula : TStrings read FComparaMaiuscula write SetComparaMaiuscula;    // edilaine - SOL 161550 KIN 1717512

    property DataBaseName     : string read FDataBaseName write SetDataBaseName;
    property RepeteConsulta   : Boolean read fRepeteConsulta write fRepeteConsulta;
    property UsaDistinct      : Boolean read fUsaDistinct write fUsaDistinct;
    property SalvaConsulta    : Boolean read fSalvaConsulta write fSalvaConsulta;
    property ExibePergunta    : Boolean read fExibePergunta write fExibePergunta;
    property MultiSelect      : Boolean read FMultiSelect write SetMultiSelect;


		property AfterOpenCds: TAfterOpenCds read FAfterOpenCds write SetAfterOpenCds;
		property BeforeOpenCds: TBeforeOpenCds read FBeforeOpenCds write SetBeforeOpenCds;


    property LookupSQL: TStrings read FLookupSQL write SetLookUpSQL;
    property LookupCampoChave: TStrings read FLookupCampoChave write SetLookupCampoChave;
    property LookupCampoExibe: TStrings read FLookupCampoExibe write SetLookupCampoExibe;

  end;

  TParamsProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TMontaEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(PropertyEditor: TPropertyEditor;
      var Continue, FreeEditor: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

uses MSParamsEditor, MsDataBaseSetings, uCtrlPadroes, wwQuery, provider;

constructor TMontaSelect.Create(AOwner:TComponent);
begin
   inherited;
   FColunas := TStringList.Create;
   FTipoDeDado := TStringList.Create;
   FDescricao := TStringList.Create;
   FSensivelACaixa := TStringList.Create;
   FTabelas := TStringList.Create;
   FFiltro := TStringList.Create;
   FCamposChave := TStringList.Create;
   FValoresChave := TStringList.Create;
   FNomesCampos := TStringList.Create;
   FNomesColunas := TStringList.Create;
   FMascaras := TStringList.Create;
   FLarguras := TStringList.Create;
   FBusca := TStringList.Create;

   FApenasLetraENum  := TStringList.Create;    // edilaine - SOL 161550 KIN 1717512
   FComparaMaiuscula := TStringList.Create;    // edilaine - SOL 161550 KIN 1717512

   FSelectedParams := TStringList.Create;

   FOperComparador := TStringList.Create;


   FLookUpSQL          := TStringList.Create;
   FLookupCampoChave   := TStringList.Create;
   FLookupCampoExibe   := TStringList.Create;

   FText := '';
   FCaption := 'Seleciona';
   FDataBaseName := 'BaseDados';
   FParams := TParams.Create;
   fTemplate := TMsTemplate.Create(Self);
   FRetornouValor := false;
   fRepeteConsulta := false;
   fCampoParaOrdenacao := '';
   fOrderAscendente := True;
   fUsaDistinct := false;
   fSalvaConsulta := false;
   fExibePergunta := True;
   FMultiSelect := false;
   _RegistroAtual := 0;

   FForcaValoresChave := False; //FHBS - SOL 161550 KIN 1717512
   FAscOrderBy        := True;  //Everson Cunha - SIG50898
end;

destructor TMontaSelect.Destroy;
begin
     if (FFormSeleciona <> nil) then  FFormSeleciona.Free;
     FColunas.free;
     FTipoDeDado.free;
     FDescricao.free;
     FSenSivelACaixa.free;
     FTabelas.free;
     FFiltro.free;
     FCamposChave.free;
     FValoresChave.free;
     FNomesCampos.Free;
     FNomesColunas.Free;
     FMascaras.Free ;
     FLarguras.Free ;
     FBusca.Free ;
     Params.Free;
     fTemplate.Free;

     FApenasLetraENum.free;     // edilaine - SOL 161550 KIN 1717512
     FComparaMaiuscula.free;    // edilaine - SOL 161550 KIN 1717512

     FSelectedParams.Free;

     FOperComparador.Free;

     FLookupSQL.Free;
     FLookupCampoChave.Free;
     FLookupCampoExibe.Free;

     inherited;
end;

procedure TMontaSelect.SetColunas(s:TStrings);
begin
     FColunas.Assign(s);
end;

procedure TMontaSelect.SetParams(p:TParams);
begin
     FParams.Assign(p);
end;

procedure TMontaSelect.SetDataBaseName(s:string);
begin
     if s <> FDataBaseName then
        FDataBaseName := s;
end;

procedure TMontaSelect.SetMascaras(s:TStrings);
begin
     FMascaras.Assign(s);
end;

procedure TMontaSelect.SetLarguras(s:TStrings);
begin
     FLarguras.Assign(s);
end;

procedure TMontaSelect.SetBusca(s:TStrings);
begin
     FBusca.Assign(s);
end;

procedure TMontaSelect.SetDescricao(s:TStrings);
begin
     FDescricao.Assign(s);
end;

procedure TMontaSelect.SetSensivelACaixa(s:TStrings);
begin
     FSensivelACaixa.Assign(s);
end;


procedure TMontaSelect.SetTabelas(s:TStrings);
begin
     FTabelas.Assign(s);
end;

procedure TMontaSelect.SetFiltro(s:TStrings);
begin
     FFiltro.Assign(s);
end;

procedure TMontaSelect.SetCamposChave(s:TStrings);
begin
     FCamposChave.Assign(s);
end;

procedure TMontaSelect.SetTipoDeDado(s:TStrings);
begin
     FTipoDeDado.Assign(s);
end;

function TMontaSelect.Executar : TModalResult;
var i : integer;
begin

     If FOperComparador.Count = 0 Then
        for i := 0 To FColunas.Count - 1 Do FOperComparador.Add('-1');

     If FSensivelACaixa.Count = 0 Then
        for i := 0 To FTipodeDado.Count - 1 Do FSensivelACaixa.Add('N');


     if FLookupSQL.Count = 0 then
        for i := 0 to FColunas.Count - 1 do FLookupSQL.Add('');

     if FLookupCampoChave.Count = 0 then
        for i := 0 to FColunas.Count - 1 do FLookupCampoChave.Add('');

     if FLookupCampoExibe.Count = 0 then
        for i := 0 to FColunas.Count - 1 do FLookupCampoExibe.Add('');

     // Inicio - edilaine - SOL 161550 KIN 1717512
     if FApenasLetraENum.Count = 0 then
        for i := 0 to FColunas.Count - 1 do FApenasLetraENum.Add('N');

     if FComparaMaiuscula.Count = 0 then
        for i := 0 to FColunas.Count - 1 do FComparaMaiuscula.Add('');
     // Termino - edilaine - SOL 161550 KIN 1717512

     if (FFormSeleciona = nil) then
     begin
        FFormSeleciona := TfrmMontaSelect.Create(Self);
     end;

     if FMultiSelect then begin
        if not (dgMultiSelect in FFormSeleciona.dbgLista.Options) then begin
           FFormSeleciona.dbgLista.Options := FFormSeleciona.dbgLista.Options + [dgMultiSelect];
           FFormSeleciona.dbgLista.MultiSelectOptions := [msoAutoUnselect, msoShiftSelect];
        end;
     end else begin

        if dgMultiSelect in FFormSeleciona.dbgLista.Options then begin
           FFormSeleciona.dbgLista.Options := FFormSeleciona.dbgLista.Options - [dgMultiSelect];
           FFormSeleciona.dbgLista.MultiSelectOptions := [];
        end;
     end;


     FFormSeleciona.Caption := FCaption;

     //Início - FHBS - SOL 161550 KIN 1717512
     if FForcaValoresChave then
     begin
       Result := mrOk;
       FForcaValoresChave := False;
     end
     else
     begin
       //Término - FHBS - SOL 161550 KIN 1717512
       Result := FFormSeleciona.ShowModal;

       case Result of
         mrCancel : FValoresChave.Clear;
         mrOk:
           Begin
              _RegistroAtual := 0;

              FValoresChave.Clear;
              if FCamposVisiveis > 0 then
                 for i := 0 to FCamposChave.Count-1 do
                     FValoresChave.Add(FFormSeleciona.CdsSeleciona.Fields[FCamposVisiveis+i].AsString);
           end;
       end;
     end;

     FRetornouValor := (FValoresChave.Count > 0) and (FValoresChave[0] <> '');
end;

procedure TMontaSelect.CriaForm(FFormSeleciona:TfrmMontaSelect);
var i,j : integer;
begin
     with FFormSeleciona do
     begin
          PageControl.ActivePage := tbsEscolha;
          Paineis := TList.Create;
          if FDescricao <> nil then
             for i := 0 to FDescricao.Count-1 do
             begin
                  j := Paineis.Add(TObject(TPainelCampo.CreateTipo(FFormSeleciona, FTipoDeDado[i], FSensivelACaixa[i],i, strToIntDef(FOperComparador[i], -1), FApenasLetraENum[i] )));   //edilaine - SOL 161550 KIN 1717512
                  with TPainelCampo(Paineis[j]) do
                  begin
                       DescCampo.Caption := FDescricao[i];
                       NomeCampo := FColunas[i];
                       if j > 0 then
                          TPainelCampo(Paineis[j]).Top := TPainelCampo(Paineis[j-1]).Top + TPainelCampo(Paineis[j-1]).Height+3;
                  end;
             end;

          PageControlChange(Self);
     end;
end;

procedure TMontaSelect.Busca;
begin
   bExisteFiltro := False;

   Screen.Cursor := crHourGlass;
   FFormSeleciona.CdsSeleciona.Close;

   fCampoParaOrdenacao := FFormSeleciona.BuscaFieldName;
   fOrderAscendente    := (FFormSeleciona.ImgBotao.Tag = 1);

   FText := MontaSQL;

   If (fCampoParaOrdenacao <> '') And (FFormSeleciona.CdsSeleciona.Active) Then
      MudaOrdem(fCampoParaOrdenacao)
   Else
   Begin
      If (Padroes = nil) Or (Not fExibePergunta) Then
         AbreQuery
      Else
         If (bExisteFiltro) Or
            ((Not bExisteFiltro) And
             (MsgDlg('Não foram selecionado(s) filtro(s) para a "Busca"' + (#13+#10) + 'por isso a sua pesquisa pode demorar a ser exibida. Deseja Continuar ?','Atenção',mtConfirmation, [mbYes,mbNo],0)= mrYes)) then
             AbreQuery;
   End;

   Screen.Cursor := crDefault;
end;

procedure TMontaSelect.Cancela;
var i : integer;
begin
     with FFormSeleciona do
     begin
          FValoresChave.Clear;
          CdsSeleciona.Close;

          for i := 0 to (Paineis.Count-1) do

          begin
             if (TPainelCampo(Paineis[i]).TipoDado = 'D') then
                TPainelCampo(Paineis[i]).DateCompara.clear
             else if (TPainelCampo(Paineis[i]).TipoDado = 'L') then
                  TPainelCampo(Paineis[i]).LkpCompara.Clear
             else
                 TPainelCampo(Paineis[i]).edCompara.clear;
          end;


          PageControl.ActivePage := tbsEscolha;
          PageControlChange(Self);
     end;
end;

function TMontaSelect.GetDataForComponentState(sSql: String): OleVariant;
Var
   lQry: TwwQuery;
   lPvd: TDataSetProvider;
   lCds: TClientDataSet;
begin
   If  (csDesigning In Componentstate) Or
       (Padroes = nil) Then
   Begin
     lQry := TwwQuery.Create(nil);
     lQry.DataBaseName := 'BaseDados';
     lQry.Sql.Text := sSql;

     lPvd := TDataSetProvider.Create(nil);
     lPvd.DataSet := lQry;

     lCds := TClientDataSet.Create(nil);
     lCds.SetProvider(lPvd);

     Try
       lCds.Open;
       Result := lCds.Data;

       lQry.Free;
       lPvd.Free;
       lCds.Free;
     Except
       lQry.Free;
       lPvd.Free;
       lCds.Free;
       Raise;
     End;
   End
   Else
   Begin
     Result := Padroes.GetDataPacket(sSql);
   End;
end;

procedure TMontaSelect.AbreQuery;
var
  i:integer;
  vIndexDef : TIndexDef;
	strSQL: string;
begin
     with FFormSeleciona do
     begin




          CdsSeleciona.IndexDefs.Clear;
          CdsSeleciona.IndexName := '';
          CdsSeleciona.IndexFieldNames := '';


					strSQL := FText;
					DoBeforeOpenCds(strSQL, FSelectedParams);
					CdsSeleciona.Data := GetDataForComponentState(strSQL);

					DoAfterOpenCds(CdsSeleciona);



          For i := 0 to CdsSeleciona.FieldCount-1 do
          Begin
             if i < FCamposVisiveis then
             Begin
                CdsSeleciona.Fields[i].DisplayLabel := TPainelCampo(Paineis[i]).DescCampo.caption;

                vIndexDef := CdsSeleciona.IndexDefs.AddIndexDef;
                vIndexDef.Name := CdsSeleciona.Fields[i].FieldName + 'ASC';
                vIndexDef.Fields := CdsSeleciona.Fields[i].FieldName;
                vIndexDef.Options := [];

                vIndexDef := CdsSeleciona.IndexDefs.AddIndexDef;
                vIndexDef.Name := CdsSeleciona.Fields[i].FieldName + 'DESC';
                vIndexDef.Fields := CdsSeleciona.Fields[i].FieldName;
                vIndexDef.Options := [ixDescending];
             End
             else
                CdsSeleciona.Fields[i].Visible := false;

          End;

          PageControl.ActivePage := tbsLista;
          PageControlChange(Self);

         for i:= 0 to FColunas.Count-1 do
         begin
              if (i < FMascaras.Count) and (FMascaras[i] <> '') then
              begin
                   if AnsiUpperCase(FTipodeDado[i]) = 'C' then  // TStringField
                      TStringField(CdsSeleciona.FieldByName(FNomesCampos[i])).EditMask := FMascaras[i];
                   if AnsiUpperCase(FTipodeDado[i]) = 'N' then  // TNumericField
                      TNumericField(CdsSeleciona.FieldByName(FNomesCampos[i])).DisplayFormat := FMascaras[i];
                   if AnsiUpperCase(FTipodeDado[i]) = 'D' then  // TDateField
                      TNumericField(CdsSeleciona.FieldByName(FNomesCampos[i])).DisplayFormat := FMascaras[i];
                   TField(CdsSeleciona.FieldByName(FNomesCampos[i])).DisplayWidth := TField(CdsSeleciona.FieldByName(FNomesCampos[i])).DisplayWidth +5;
              end;

              if (i < FLarguras.Count) and (FLarguras[i] <> '') and (FLarguras[i] <> '0')then
              try
                 TField(CdsSeleciona.FieldByName(FNomesCampos[i])).DisplayWidth := StrToInt(FLarguras[i]);
              except

              end;
         end;

     end;
end;


procedure TMontaSelect.MudaOrdem(AFieldName: String);
var
   sOrd:string;
begin
     if FCampoOrderBy = AFieldName then
     begin
         If (fCampoParaOrdenacao <> '') Then
         Begin
           if fOrderAscendente then
              sOrd := ' ASC '
           else
              sOrd := ' DESC ';
         End
         Else
         Begin
           FAscOrderBy := not FAscOrderBy;
           if FAscOrderBy then
              sOrd := ' ASC '
           else
              sOrd := ' DESC ';
         End;
     end
     else
     Begin
         If (fCampoParaOrdenacao <> '') Then
         Begin
           if fOrderAscendente then
              sOrd := ' ASC '
           else
              sOrd := ' DESC ';
         End
         Else
           FAscOrderBy := true;
     End;



     If FAscOrderBy Then
        FFormSeleciona.CdsSeleciona.IndexName := AFieldName + 'ASC'
     Else
        FFormSeleciona.CdsSeleciona.IndexName := AFieldName + 'DESC';

     fCampoOrderBy := AFieldName;
     fCampoParaOrdenacao := AFieldName;

     FFormSeleciona.CdsSeleciona.First;


end;


function TMontaSelect.MontaSQL : string;
var i,
    iCampos : integer;
    sSql : TStrings;
    bTemWhere : Boolean;
    CampoTemp,
    ColunaTemp,
    sTextoValor: string;
    iPosAs : integer;
begin
     sSql := TStringList.create;
     FNomesCampos.Clear;
     FNomesColunas.Clear;
     FLinhaOrderBy := -1;
     FCampoOrderBy := '_';
     //FAscOrderBy := true; Everson Cunha - SIG50898
     FCamposVisiveis := 0;
     sSQL.Add('SELECT ');

     If fUsaDistinct Then sSQL.Add('DISTINCT ');

     {Inclui os campos que aparecem na tabela}
     iCampos := 0;
     For i := 0 to FColunas.Count-1 do
     begin
        iPosAS := Pos(' AS ', AnsiUpperCase(FColunas[i]));
        if iPosAS = 0 then
        begin
               sSQL.Add(AnsiUpperCase('   '+FColunas[i])+' AS C'+TRIM(IntToStr(iCampos)));
               CampoTemp := 'C'+TRIM(IntToStr(iCampos));
               ColunaTemp := FColunas[i];
          end
          else
          begin
               sSQL.Add('   '+FColunas[i]);
               CampoTemp := Copy(AnsiUpperCase(FColunas[i]), iPosAS+4, 50);
               ColunaTemp := Copy(AnsiUpperCase(FColunas[i]), 1, iPosAS);
          end;

          FNomesCampos.Add(CampoTemp)  ;
          FNomesColunas.Add(ColunaTemp);
          Inc(iCampos);

          if i <> FColunas.Count-1 then
             sSQL[sSql.Count-1] :=  sSQL[sSql.Count-1]+',';

          Inc(FCamposVisiveis);
     end;

     {Inclui os campos CHAVE}
     For i := 0 to FCamposChave.Count-1 do
     begin
          sSQL[sSql.Count-1] :=  sSQL[sSql.Count-1]+',';
          if Pos(' AS ', AnsiUpperCase(FCamposChave[i])) = 0 then
             sSQL.Add('   '+FCamposChave[i]+' AS C'+TRIM(IntToStr(iCampos)))
          else
              sSQL.Add('   '+FCamposChave[i]);
          Inc(iCampos);
     end;

     sSQl.Add('FROM');
     For i := 0 to FTabelas.Count-1 do
     begin
          sSQL.Add('   '+FTabelas[i]);
          if i <> FTabelas.Count-1 then
             sSQL[sSql.Count-1] :=  sSQL[sSql.Count-1]+',';
     end;

     { Where do filtro colocado pelo Desenvolvedor}
     bTemWhere := false;
     For i := 0 to FFiltro.Count-1 do
     begin
          if not bTemWhere then
             sSql.Add('WHERE ');

          bTemWhere := true;
          sSQL.Add('   ( '+ FFiltro[i] + ' )');
          if i <> FFiltro.Count-1 then
             sSQL[sSql.Count-1] :=  sSQL[sSql.Count-1]+' AND';

     end;

     if FFormSeleciona <> nil then
     begin

          FSelectedParams.Clear;
          { Where dos criterios colocados pelo usuario}
          For i := 0 to FColunas.Count-1 do
          begin


               if (Trim(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex]) = 'IS NULL') or
                  (Trim(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex]) = 'IS NOT NULL') or
                  (Trim(ListaOperNumCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex]) = 'IS NULL') or
                  (Trim(ListaOperNumCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex]) = 'IS NOT NULL') then
               begin
                    bExisteFiltro := True;

                    if not bTemWhere then
                       sSql.Add('WHERE ')
                    else
                        sSQL[sSql.Count-1] :=  sSQL[sSql.Count-1]+' AND';
                    bTemWhere := true;

                    if AnsiUpperCase(FTipodeDado[i]) = 'C' then
                    Begin


                       FSelectedParams.Values[FNomesColunas[i]] := TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text;

                       If TPainelCampo(FFormSeleciona.Paineis[i]).CheckCase.Checked Then
                       begin
                         If AnsiUpperCase(FComparaMaiuscula[i]) = 'S' Then  // edilaine - SOL 161550 KIN 1717512
                            sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[AnsiUpperCase(TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text)])+')')
                         else // edilaine - SOL 161550 KIN 1717512
                            sSQL.Add('   ( LOWER('+ FNomesColunas[i] +') '+Format(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[AnsiLowerCase(TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text)])+')')
                       end
                       Else
                          sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text])+')');
                    End;

                    if (AnsiUpperCase(FTipodeDado[i]) = 'N') or (AnsiUpperCase(FTipodeDado[i]) ='$') then
                    begin

                       FSelectedParams.Values[FNomesColunas[i]] := TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text;
                       sTextoValor := TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text;
                       CharReplace(sTextoValor,',','.');
                       sSQL.Add('   ('+FNomesColunas[i]+' '+  Format(ListaOperNumCompara[TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[AnsiLowerCase(sTextoValor)]) + ')');
                    end
                    else
                      if AnsiUpperCase(FTipodeDado[i]) = 'D' then
                      begin

                        FSelectedParams.Values[FNomesColunas[i]] := 'TO_DATE('''+FormatDateTime('dd/mm/yyyy', TPainelCampo(FFormSeleciona.Paineis[i]).DateCompara.Date)+''', ''dd/mm/yyyy'')';
                        sSQL.Add('   ('+FNomesColunas[i]+' '+Format(ListaOperNumCompara[TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],['TO_DATE('''+FormatDateTime('dd/mm/yyyy', TPainelCampo(FFormSeleciona.Paineis[i]).DateCompara.Date)+''', ''dd/mm/yyyy'')'])+')');
                      end

                      else if (AnsiUpperCase(FTipoDeDado[i]) = 'L') then
                           begin
                             FSelectedParams.Values[FNomesColunas[i]] := TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value;
                             if TPainelCampo(FFormSeleciona.Paineis[i]).CheckCase.Checked Then
                             begin
                               If AnsiUpperCase(FComparaMaiuscula[i]) = 'S' Then  // edilaine - SOL 161550 KIN 1717512
                                 sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[0],[AnsiUpperCase(TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value)])+')')
                               else // edilaine - SOL 161550 KIN 1717512
                                 sSQL.Add('   ( LOWER('+ FNomesColunas[i] +') '+Format(ListaOperCharCompara[0],[AnsiLowerCase(TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value)])+')')
                             end
                             else
                                sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[0],[TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value])+')');
                           end;
               end
               else
               begin
                 if ((AnsiUpperCase(FTipodeDado[i]) = 'D')  and (TPainelCampo(FFormSeleciona.Paineis[i]).DateCompara.Text <> '')) or
                    ((AnsiUpperCase(FTipodeDado[i]) <> 'D') and (TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text <> '')) or
                    ((AnsiUpperCase(FTipoDeDado[i]) = 'L') and (TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Text <> '')) then
                 begin
                      bExisteFiltro := True;

                      if not bTemWhere then
                         sSql.Add('WHERE ')
                      else
                          sSQL[sSql.Count-1] :=  sSQL[sSql.Count-1]+' AND';
                      bTemWhere := true;

                      if AnsiUpperCase(FTipodeDado[i]) = 'C' then
                      Begin

                         FSelectedParams.Values[FNomesColunas[i]] := TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text;

                         If TPainelCampo(FFormSeleciona.Paineis[i]).CheckCase.Checked Then
                         begin
                           If AnsiUpperCase(FComparaMaiuscula[i]) = 'S' Then  // edilaine - SOL 161550 KIN 1717512
                              sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[AnsiUpperCase(TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text)])+')')
                           else
                              sSQL.Add('   ( LOWER('+ FNomesColunas[i] +') '+Format(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[AnsiLowerCase(TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text)])+')')
                         end   // edilaine - SOL 161550 KIN 1717512
                         Else
                            sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[ TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text])+')');
                      End;

                      if (AnsiUpperCase(FTipodeDado[i]) = 'N') or (AnsiUpperCase(FTipodeDado[i]) ='$') then
                      begin

                         FSelectedParams.Values[FNomesColunas[i]] := TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text;
                         sTextoValor := TPainelCampo(FFormSeleciona.Paineis[i]).edCompara.Text;
                         CharReplace(sTextoValor,',','.');
                         sSQL.Add('   ('+FNomesColunas[i]+' '+  Format(ListaOperNumCompara[TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],[AnsiLowerCase(sTextoValor)]) + ')');
                      end
                      else
                        if AnsiUpperCase(FTipodeDado[i]) = 'D' then
                        begin

                          FSelectedParams.Values[FNomesColunas[i]] := 'TO_DATE('''+FormatDateTime('dd/mm/yyyy', TPainelCampo(FFormSeleciona.Paineis[i]).DateCompara.Date)+''', ''dd/mm/yyyy'')';
                          sSQL.Add('   ('+FNomesColunas[i]+' '+Format(ListaOperNumCompara[TPainelCampo(FFormSeleciona.Paineis[i]).cmbCompara.ItemIndex],['TO_DATE('''+FormatDateTime('dd/mm/yyyy', TPainelCampo(FFormSeleciona.Paineis[i]).DateCompara.Date)+''', ''dd/mm/yyyy'')'])+')');
                        end

                      else if (AnsiUpperCase(FTipoDeDado[i]) = 'L') then
                           begin
                             FSelectedParams.Values[FNomesColunas[i]] := TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value;
                             if TPainelCampo(FFormSeleciona.Paineis[i]).CheckCase.Checked Then
                             begin
                               If AnsiUpperCase(FComparaMaiuscula[i]) = 'S' Then  // edilaine - SOL 161550 KIN 1717512
                                  sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[0],[AnsiUpperCase(TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value)])+')')
                               else
                                  sSQL.Add('   ( LOWER('+ FNomesColunas[i] +') '+Format(ListaOperCharCompara[0],[AnsiLowerCase(TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.Value)])+')')
                             end     // edilaine - SOL 161550 KIN 1717512
                             else
                                sSQL.Add('   ( '+ FNomesColunas[i] +' '+Format(ListaOperCharCompara[0],[TPainelCampo(FFormSeleciona.Paineis[i]).lkpCompara.DisplayValue])+')');
                           end;
                 end;
               end;

          end;

          if FAscOrderBy then  //Everson Cunha - SIG50898
            FLinhaOrderBy := sSQL.Add( ' ORDER BY '+FNomesCampos[0]+' ASC')
          else
            FLinhaOrderBy := sSQL.Add( ' ORDER BY '+FNomesCampos[0]+' DESC'); //Everson Cunha - SIG50898

          //FAscOrderBy := true; //Everson Cunha - SIG50898

          FCampoOrderBy := FNomesCampos[0];
     end;

     Result := sSql.Text  ;

     sSQL.free;
end;


{ TParams }
{ TParamsProperty }
procedure TParamsProperty.Edit;
var ParamsMontaEditor : TfrmMSParamsEditor;
    TempMonta : TMontaSelect;
begin
     ParamsMontaEditor := TfrmMSParamsEditor.Create(Application);
     TempMonta := TMontaSelect(GetComponent(0));
     try
        ParamsMontaEditor.Componente := TempMonta;
        ParamsMontaEditor.ShowModal;
     finally
            ParamsMontaEditor.Free;
            Modified;
     end;
end;

function TParamsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{TMontaEditor}
procedure TMontaEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'PARAMS') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TMontaEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

function TMontaEditor.GetVerb(Index: Integer): string;
begin
  Case Index of
    0:  Result := 'Parâmetros';
    1:  Result := 'Executar';
    else Result := '';
  End;
end;

procedure TMontaEditor.ExecuteVerb(Index: Integer);
begin
  Case Index of
   0: Edit;
   1: begin
      if (Component is TMontaSelect) and
         (TMontaSelect(Component) <> nil) then
      begin
        with TMontaSelect.Create(Application) do
         try
           Caption := TMontaSelect(Component).Caption;
           Colunas.Text := TMontaSelect(Component).Colunas.Text;
           TipodeDado.Text := TMontaSelect(Component).TipodeDado.Text;
           Descricao.Text := TMontaSelect(Component).Descricao.Text ;
           SensivelACaixa.Text := TMontaSelect(Component).SensivelACaixa.Text;
           Tabelas.Text := TMontaSelect(Component).Tabelas.Text;
           CamposChave.Text := TMontaSelect(Component).CamposChave.Text;
           Filtro.Text := TMontaSelect(Component).Filtro.Text;
           Mascaras.Text := TMontaSelect(Component).Mascaras.Text;
           Larguras.Text := TMontaSelect(Component).Larguras.Text;
           OperComparador.Text := TMontaSelect(Component).OperComparador.Text;
           DataBaseName := TMontaSelect(Component).DataBaseName;
           RepeteConsulta := TMontaSelect(Component).RepeteConsulta;
           UsaDistinct := TMontaSelect(Component).UsaDistinct;
           SalvaConsulta := TMontaSelect(Component).SalvaConsulta;
           ExibePergunta := TMontaSelect(Component).ExibePergunta;
           MultiSelect := TMontaSelect(Component).MultiSelect;

           //Inicio - edilaine - SOL 161550 KIN 1717512
           ApenasLetraENum.Text  := TMontaSelect(Component).ApenasLetraENum.Text;
           ComparaMaiuscula.Text := TMontaSelect(Component).ComparaMaiuscula.Text;
           //Termino - edilaine - SOL 161550 KIN 1717512
           
           //amf 17.01.2007 21376
           LookupSQL.Text          := TMontaSelect(Component).LookUpSQL.Text;
           LookupCampoChave.Text   := TMontaSelect(Component).LookupCampoChave.Text;
           LookupCampoExibe.Text   := TMontaSelect(Component).LookupCampoExibe.Text;
           //amf 17.01.2007 21376

           Executar;
         finally
           free;
         end;
      end;
    end;
  end;
end;

{MsTemplate}

constructor TMsTemplate.Create(Aowner:TMontaSelect);
Begin
    bAtribuiId := True;
    Inherited Create;
    fOwner := Aowner;
    fIdConsulta := 0;
End;

Procedure TMsTemplate.SetIdConsulta(Value :LongInt);
Begin
   If bAtribuiId Then
      fIdConsulta := Value;

   bAtribuiId := False;
End;

Procedure TMsTemplate.SetDataBaseSettings(Value :TParams);
Begin
   fDataBaseSettings.Assign(Value);
End;

procedure TMsDataBaseSettings.Edit;
var
  FrmDbs : TFrmMsDataBaseSetings;
  MsTmpl : TMsTemplate;
begin
     MsTmpl := TMsTemplate(GetComponent(0));
     FrmDbs := TFrmMsDataBaseSetings.Create(Application);
     try
        FrmDbs.Componente := MsTmpl.Owner;
        FrmDbs.ShowModal;
        MsTmpl.bAtribuiId := True;
        MsTmpl.SetIdConsulta(FrmDbs.IdConsulta);
     finally
        FrmDbs.Free;
        Modified;
     end;
end;

function TMsDataBaseSettings.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure Register;
begin
  RegisterComponents('CM', [TMontaSelect]);
  RegisterComponentEditor(TMontaSelect, TMontaEditor);
  RegisterPropertyEditor(TypeInfo(TParams), TMontaSelect, 'Params', TParamsProperty);
  RegisterPropertyEditor(TypeInfo(TParams), TMsTemplate, 'DataBaseSettings', TMsDataBaseSettings);
end;

procedure TMontaSelect.SetAscOrderBy(const Value: boolean);
begin
  FAscOrderBy := Value;
end;

function TMontaSelect.GetSelCount: Integer;
begin
  if (FFormSeleciona = nil) then
    result := 0
  else
    result := FFormSeleciona.dbgLista.SelectedList.Count;
end;

function TMontaSelect.GetNextSelected: Boolean;
Var
  i: Integer;
begin
  if (FFormSeleciona <> nil) And
     (_RegistroAtual < GetSelCount) And
     (GetSelCount > 0) then
  begin
     FFormSeleciona.CdsSeleciona.GotoBookmark(FFormSeleciona.dbgLista.SelectedList.Items[_RegistroAtual]);

     FValoresChave.Clear;
     if FCamposVisiveis > 0 then
          for i := 0 to FCamposChave.Count-1 do
              FValoresChave.Add(FFormSeleciona.CdsSeleciona.Fields[FCamposVisiveis+i].AsString);

     inc(_RegistroAtual);

     Result := (_RegistroAtual <= GetSelCount);
  end
  else
  begin
    _RegistroAtual := 0;
    result := false;
  End;
end;

procedure TMontaSelect.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
end;

procedure TMontaSelect.SetAfterOpenCds(const Value: TAfterOpenCds);
begin
  FAfterOpenCds := Value;
end;

procedure TMontaSelect.SetBeforeOpenCds(const Value: TBeforeOpenCds);
begin
  FBeforeOpenCds := Value;
end;

procedure TMontaSelect.DoAfterOpenCds(lCds: TClientDataSet);
begin
	if (not (csDesigning In Componentstate)) And Assigned(fAfterOpenCds) then
		 fAfterOpenCds(lCds);
end;

procedure TMontaSelect.DoBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
begin
	if (not (csDesigning In Componentstate)) And Assigned(FBeforeOpenCds) then
		 FBeforeOpenCds(sqlText, strListParams);
end;

procedure TMontaSelect.SetOperComparador(s: TStrings);
begin
  FOperComparador.Assign(s);
end;

procedure TMontaSelect.SetLookUpSQL(Value: TStrings);
begin
  if Value <> nil then
  FLookUpSQL.Assign(Value);
end;

procedure TMontaSelect.SetLookUpCampoChave(Value: TStrings);
begin
  FLookupCampoChave.Assign(Value);
end;

procedure TMontaSelect.SetLookupCampoExibe(Value: TStrings);
begin
  FLookupCampoExibe.Assign(Value);
end;



function TMontaSelect.GetResultLookup(
  sSql: String): OleVariant;
begin
  Result := GetDataForComponentState(sSQL);
end;

//Início - FHBS - SOL 161550 KIN 1717512
procedure TMontaSelect.ForcaValoresChave(aValores: array of Variant);
var
  I: Integer;
begin
  FValoresChave.Clear;
  for I := Low(aValores) to High(aValores) do
    FValoresChave.Add(aValores[I]);

  FForcaValoresChave := True;
end;
//Término - FHBS - SOL 161550 KIN 1717512

//Inicio - edilaine - SOL 161550 KIN 1717512
procedure TMontaSelect.SetApenasLetraENum(s:TStrings);
begin
  FApenasLetraENum.Assign(s);
end;

procedure TMontaSelect.SetComparaMaiuscula(s:TStrings);
begin
  FComparaMaiuscula.Assign(s);
end;
//Termino - edilaine - SOL 161550 KIN 1717512

end.
