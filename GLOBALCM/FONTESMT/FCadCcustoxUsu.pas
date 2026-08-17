//******************************************************************************
//Data     : 05/02/2007
//Pendência: 24394
//Descrição: Removido o filtro 'CENTCUST.IDPLANCENTCUST' do montaselect.
//******************************************************************************
// 18/01/2006 - P: 15256 --------------------------------------
// Atualizado em: 03/11/2003 - pendência 15149
//                10/12/2003 - pendência 15772
unit FCadCcustoxUsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, usistema, uCtrlUsrCCusto, dBaseDados, uCmSqlParams;

type
  TFrmCadCcustoxUsu = class(TFrmCadastroMT)
    wwDbGridUSU: TwwDBGrid;
    DbGridSel: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    CdsUsuario: TCMClientDataSet;
    DsUsuario: TwwDataSource;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    EditCodigo: TEdit;
    EditCentro: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);

  private
    { Private declarations }
    iIdCodCentroCusto : Integer;
    sCodCentCusto : string; //  10/12/2003 - pendência 15772
    CtrlUsrCCusto : TCtrlUsrCCusto;
    procedure InsereTodosUsusarios(const soSelecionado : Boolean);
    procedure ExcluiTodosUsusarios(const soSelecionado : Boolean);
  public
    { Public declarations }
  end;

var
  FrmCadCcustoxUsu: TFrmCadCcustoxUsu;

implementation

{$R *.DFM}

procedure TFrmCadCcustoxUsu.FormCreate(Sender: TObject);
begin
  inherited;
  iIdCodCentroCusto := -1;
  sCodCentCusto := ''; // 10/12/2003 - pendência 15772
  MontaSelect.Filtro.Add('CENTCUST.IDEMPRESA = '+ IntToStr(sistema.IdEmpresa));
  CtrlUsrCCusto := TCtrlUsrCCusto.Create;
  CtrlUsrCCusto.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CtrlUsrCCusto.cds := cds;
 end;

procedure TFrmCadCcustoxUsu.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // 10/12/2003
  if MontaSelect.RetornouValor then
  begin
    iIdCodCentroCusto:= StrToIntDef(MontaSelect.ValoresChave[0], -1);
    sCodCentCusto    := trim(MontaSelect.ValoresChave[0]); // 10/12/2003 - pendência 15772
    EditCodigo.Text  := MontaSelect.ValoresChave[2]; // P: 15256
    EditCentro.Text  := MontaSelect.ValoresChave[1];
    cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(iIdCodCentroCusto, sistema.IdEmpresa);
    Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(iIdCodCentroCusto, sistema.IdEmpresa);
  //início - pendência 15149
    if cds.IsEmpty then
      sbtnInserirClick(sender);
  //fim - pendência 15149
  end;
end;

procedure TFrmCadCcustoxUsu.FormDestroy(Sender: TObject);
begin
  CtrlUsrCCusto.Free;

  inherited;
end;

procedure TFrmCadCcustoxUsu.bbtnConfirmarClick(Sender: TObject);
begin
  CtrlUsrCCusto.Commit;
  //início - pendência 15149
  DbGridSel.UnselectAll;
  wwDbGridUSU.UnselectAll;
  //fim - pendência 15149
  cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(strToInt(MontaSelect.ValoresChave[0]), sistema.IdEmpresa);
  Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(strToInt(MontaSelect.ValoresChave[0]), sistema.IdEmpresa);
  inherited;
  try
    CtrlUsrCCusto.StartTransaction;
  except end;
  bbtnCancelarClick(self);
end;

procedure TFrmCadCcustoxUsu.sbtnInserirClick(Sender: TObject);
begin
  if not MontaSelect.RetornouValor then
  begin
    MontaSelect.Executar;
  end;
  if MontaSelect.RetornouValor then
  begin
    iIdCodCentroCusto:= StrToInt(MontaSelect.ValoresChave[0]);
    sCodCentCusto    := trim(MontaSelect.ValoresChave[0]); //início - 10/12/2003 - pendência 15772
    EditCodigo.Text  := MontaSelect.ValoresChave[0];
    EditCentro.Text  := MontaSelect.ValoresChave[1];
    cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(strToInt(MontaSelect.ValoresChave[0]), sistema.IdEmpresa);
    Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(strToInt(MontaSelect.ValoresChave[0]), sistema.IdEmpresa);
  end
  else
  begin
    showMessage('Deve-se Selecionar um Centro de Custo');
    bbtnCancelarClick(sender);
    exit;
  end;
  inherited;
  try
    CtrlUsrCCusto.StartTransaction;
  except end;
end;

procedure TFrmCadCcustoxUsu.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  try
    CtrlUsrCCusto.StartTransaction;
  except end;
end;

procedure TFrmCadCcustoxUsu.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterarClick(sender);
end;

procedure TFrmCadCcustoxUsu.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  if wwDbGridUSU.SelectedList.Count > 1 then
  begin
    InsereTodosUsusarios(true);
    //início - pendência 15149
    cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(iIdCodCentroCusto, sistema.IdEmpresa);
    DbGridSel.UnselectAll;
    wwDbGridUSU.UnselectAll;
    //fim - pendência 15149
  end
  else
  begin
    try
      CtrlUsrCCusto.StartTransaction;
    except end;
    //início - 10/12/2003 - pendência 15772
    CtrlUsrCCusto.IncluiUSCCUSTO(cdsUsuario.FieldByName('IDUSUARIO').asString,
                                        sCodCentCusto, intToStr(Sistema.IdEmpresa));
    //fim - 10/12/2003 - pendência 15772

    //início - pendência 15149
    cdsUsuario.Delete;
    //fim -  pendência 15149
  end;

  Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(iIdCodCentroCusto, sistema.IdEmpresa);
end;

procedure TFrmCadCcustoxUsu.InsereTodosUsusarios(const soSelecionado : Boolean);
begin
  try
    CtrlUsrCCusto.StartTransaction;
  except end;

  if soSelecionado then
    cdsUsuario.DisableControls;

  cdsUsuario.First;
  // todos
  while (not cdsUsuario.Eof) and (not soSelecionado) do
  begin
  //início -  10/12/2003 - pendência 15772
    CtrlUsrCCusto.IncluiUSCCUSTO(cdsUsuario.FieldByName('IDUSUARIO').asString,
                                 sCodCentCusto, intToStr(Sistema.IdEmpresa));
  //fim -  10/12/2003 - pendência 15772

    cdsUsuario.Next;
  end;

  // multiselect
  while (not cdsUsuario.Eof) and (soSelecionado) do
  begin
    if (wwDbGridUSU.IsSelectedRecord) then
    begin
    //início - 10/12/2003 - pendência 15772

      CtrlUsrCCusto.IncluiUSCCUSTO(cdsUsuario.FieldByName('IDUSUARIO').asString,
                                   sCodCentCusto, intToStr(Sistema.IdEmpresa));
    //fim -  10/12/2003 - pendência 15772

    end;
    cdsUsuario.Next;
  end;

  cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(iIdCodCentroCusto, sistema.IdEmpresa);
  Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(iIdCodCentroCusto, sistema.IdEmpresa);

  if soSelecionado then
    cdsUsuario.EnableControls;

  wwDbGridUSU.UnselectAll;
end;


procedure TFrmCadCcustoxUsu.ExcluiTodosUsusarios(const soSelecionado : Boolean);
begin
  try
    CtrlUsrCCusto.StartTransaction;
  except end;

  if soSelecionado then
    cds.DisableControls;

  cds.First;
  // todos
  while (not cds.Eof) and (not soSelecionado) do
  begin
    //início -  10/12/2003 - pendência 15772
    CtrlUsrCCusto.ExcluiUSCCUSTO(cds.FieldByName('IDUSUARIO').asString,
                                 sCodCentCusto, intToStr(Sistema.IdEmpresa));
    //fim -  10/12/2003 - pendência 15772

    cds.Next;
  end;

  // multiselect
  while (not cds.Eof) and (soSelecionado) do
  begin
    if (DbGridSel.IsSelectedRecord) then
    begin
      //início  10/12/2003 - pendência 15772
      CtrlUsrCCusto.ExcluiUSCCUSTO(cds.FieldByName('IDUSUARIO').asString,
                                   sCodCentCusto, intToStr(Sistema.IdEmpresa));
      //fim - 10/12/2003 - pendência 15772
    end;
    cds.Next;
  end;

  cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(iIdCodCentroCusto, sistema.IdEmpresa);
  Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(iIdCodCentroCusto, sistema.IdEmpresa);

  if soSelecionado then
    cds.EnableControls;

  DbGridSel.UnselectAll;
end;


procedure TFrmCadCcustoxUsu.bbtnCancelarClick(Sender: TObject);
begin
  CtrlUsrCCusto.RollBack;
  cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(iIdCodCentroCusto, sistema.IdEmpresa);
  Cds.Data         := CtrlUsrCCusto.ListaUsuariosInCC(iIdCodCentroCusto, sistema.IdEmpresa);
  inherited;
end;

procedure TFrmCadCcustoxUsu.bbtnSairClick(Sender: TObject);
begin
  try
    CtrlUsrCCusto.StartTransaction;
  except end;
  inherited;
end;

procedure TFrmCadCcustoxUsu.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  if DbGridSel.SelectedList.Count > 1 then
  begin
    ExcluiTodosUsusarios(true);
    //início  pendência 15149
    Cds.Data := CtrlUsrCCusto.ListaUsuariosInCC(iIdCodCentroCusto, sistema.IdEmpresa);
    DbGridSel.UnselectAll;
    wwDbGridUSU.UnselectAll;
    //fim - pendência 15149
  end
  else
  begin
    try
      CtrlUsrCCusto.StartTransaction;
    except end;
     //início -  10/12/2003 - pendência 15772
     CtrlUsrCCusto.ExcluiUSCCUSTO(cds.FieldByName('IDUSUARIO').asString,
                                 sCodCentCusto, intToStr(Sistema.IdEmpresa));
     //fim - 10/12/2003 - pendência 15772

     //início - pendência 15149
     cds.Delete;
     //fim -  pendência 15149
  end;

  cdsUsuario.Data  := CtrlUsrCCusto.ListaUsuariosNotInCC(iIdCodCentroCusto, sistema.IdEmpresa);

end;

procedure TFrmCadCcustoxUsu.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  InsereTodosUsusarios(false);
end;

procedure TFrmCadCcustoxUsu.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  ExcluiTodosUsusarios(false);
end;

end.
