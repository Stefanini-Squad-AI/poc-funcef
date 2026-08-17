unit fMTInvRegNaoEncontrados;

{
-------------------------------------------------------------------------------
 ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------------------------------
-------------------------------------------------------------------------------
 Nº SOL......: 172256
 Nº KINTANA..: 1547763
 Data........: 02/08/2012
 Responsável.: Vander Campos
 Descrição...: A pesquisa de Novo Conjunto depende da seleção de uma Nova
               localização. O sistema não apresenta uma mensagem informando
               isso, apresenta um erro.
-------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, MontaSelect, StdCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, uCMClientDataSet,
  DBClient, wwdbedit, Wwdatsrc,
  uCMTypes, uCtrlPadroes, uCtrlInventarioBens, uCtrlConjunto, uCtrlLocalizacoes,
  IvEMulti;

type
  TfrmMTInvRegNaoEncontrados = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    Label6: TLabel;
    dbeSelLocal: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    Label8: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    dsLocal: TwwDataSource;
    dsConjunto: TwwDataSource;
    cdsLocal: TCMClientDataSet;
    cdsConjunto: TCMClientDataSet;
    MSLocal: TMontaSelect;
    MSConjunto: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
  private
    { Private declarations }
    InventarioBens : TCtrlInventarioBens;
    Conjunto       : TCtrlConjunto;
    Localizacao    : TCtrlLocalizacoes;
  public
    { Public declarations }
    iPessoa, iLocal, iConjunto : Integer;
  end;

var
  frmMTInvRegNaoEncontrados: TfrmMTInvRegNaoEncontrados;

implementation

{$R *.DFM}

uses uMensErro, uSistema, fMTCadConjunto;

procedure TfrmMTInvRegNaoEncontrados.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.IDEMPRESA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   iPessoa   := -1;
   iLocal    := -1;
   iConjunto := -1;
end;
//========================================================================================
procedure TfrmMTInvRegNaoEncontrados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   if not cdsLocal.IsEmpty    then iPessoa   := cdsLocal.FieldByName('IDPESSOA').AsInteger;
   if not cdsLocal.IsEmpty    then iLocal    := cdsLocal.FieldByName('IDLOCALIZACAO').AsInteger;
   if not cdsConjunto.IsEmpty then iConjunto := cdsConjunto.FieldByName('IDCONJUNTO').AsInteger;
   //-------------------------------------------------------------------------------------
   InventarioBens.Free;
   Localizacao.Free;
   Conjunto.Free;
end;
//========================================================================================
procedure TfrmMTInvRegNaoEncontrados.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]),
                                                    StrToFloat(MSLocal.ValoresChave[0]));
      cdsConjunto.Data := InventarioBens.ListaConjuntoxLocal(cdsLocal.FieldByName('IDPESSOA').AsFloat,
                                                             cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
      if cdsConjunto.RecordCount > 1 then
         cdsConjunto.Data := InventarioBens.ListaConjuntoxLocal(Sistema.IdEmpresa, 0);
   end;
end;
//========================================================================================
procedure TfrmMTInvRegNaoEncontrados.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;

   // Vander - SOL: 172256 - KTN: 1547763
   if (cdsLocal.IsEmpty) Then
   Begin
     MsgDlg('Informe a Nova Localização.', 'Erro', mtError, [mbOK], 0);
     Exit;
   End;


   //-------------------------------------------------------------------------------------
   // Códigos de iibFlgPlaca
   //-------------------------------------------------------------------------------------
   // 0 - Resultado não informado
   // 1 - Ok
   // 2 - Placa não encontrada
   // 3 - Placa EM outro Local
   // 4 - Placa DE outro Local
   // 5 - Placa não cadastrada
   //-------------------------------------------------------------------------------------
   if not cdsLocal.FieldByName('IDLOCALIZACAO').IsNull then
   begin
      MSConjunto.Filtro.Strings[3] := 'CONJUNTO.IDLOCALIZACAO = ' + cdsLocal.FieldByName('IDLOCALIZACAO').AsString;
   end else
   begin
      MSConjunto.Filtro.Strings[3] := '1=1';
   end;
   //-------------------------------------------------------------------------------------
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSConjunto.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTInvRegNaoEncontrados.bbtnGeraConjuntoClick(Sender: TObject);
var
   fIdPessoa, fIdConjunto : Extended;

begin
   inherited;
   Application.CreateForm(TfrmMTCadConjunto,frmMTCadConjunto);
   frmMTCadConjunto.FormStyle := FsNormal;
   frmMTCadConjunto.Visible   := False;
   frmMTCadConjunto.Top       := 76;
   frmMTCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   fIdConjunto := frmMTCadConjunto.fUltIdConjunto;
   fIdPessoa   := frmMTCadConjunto.fUltIdPessoa;
   frmMTCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   cdsConjunto.Data := Conjunto.ListaConjunto(fIdPessoa, fIdConjunto);
   cdsLocal.Data := Localizacao.ListaLocalizacao(fIdPessoa,
                                                 cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
end;

end.
