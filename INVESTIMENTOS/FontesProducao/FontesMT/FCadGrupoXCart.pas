unit FCadGrupoXCart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, TB97Ctls, ComCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, ImgList,
  Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, uCtrlAcessoCarteira, uCtrlPadroes, uMensErro, wwdblook;

type
  TfrmCadGrupoXCart = class(TfrmOkCancelarInv)
    PnlSelecao: TPanel;
    pnlPortfolio: TPanel;
    Panel9: TPanel;
    pnlTipoInvestimento: TPanel;
    Panel5: TPanel;
    pnlBotoes: TPanel;
    btnPassaUm: TToolbarButton97;
    btnVoltaUm: TToolbarButton97;
    btnPassaTodos: TToolbarButton97;
    btnVoltaTodos: TToolbarButton97;
    pnlEspacoSuperior: TPanel;
    dbgGrupoXCart: TwwDBGrid;
    dbgCartDisp: TwwDBGrid;
    ds: TwwDataSource;
    cds: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    dsCartDisp: TwwDataSource;
    cdsCartDisp: TCMClientDataSet;
    CMSqlParamsCartDisp: TCMSqlParams;
    pnlGrupo: TPanel;
    dblGrupoAcesso: TwwDBLookupCombo;
    Label6: TLabel;
    cdsGrupoAcesso: TCMClientDataSet;
    CMSqlParamsGrupo: TCMSqlParams;
    procedure FormShow(Sender: TObject);
    procedure dbgGrupoXCartDblClick(Sender: TObject);
    procedure dbgCartDispDblClick(Sender: TObject);
    procedure btnPassaUmClick(Sender: TObject);
    procedure btnVoltaUmClick(Sender: TObject);
    procedure btnPassaTodosClick(Sender: TObject);
    procedure btnVoltaTodosClick(Sender: TObject);

    procedure GridZebrado(Sender: TObject; Field: TField; State: TGridDrawState;
                          Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure MudaLinha(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblGrupoAcessoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

  private
    { Private declarations }
    bModificado: Boolean;
    function SelCartxGrupo(iGrupo: Integer = -1): Boolean;
    function InsereCarteira: Boolean;
    function ExcluiCarteira: Boolean;
    function InsereTodasCarteiras: Boolean;
    function ExcluiTodasCarteiras: Boolean;
  public
    { Public declarations }
    CtrlAcessoCarteira: TCtrlAcessoCarteira;
  end;

var
  frmCadGrupoXCart: TfrmCadGrupoXCart;

implementation


{$R *.DFM}

procedure TfrmCadGrupoXCart.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlAcessoCarteira := TCtrlAcessoCarteira.Create;
   CtrlAcessoCarteira.InitializeAs(Padroes);
   CtrlAcessoCarteira.cdsGrupoXCart := cds;
end;

procedure TfrmCadGrupoXCart.FormShow(Sender: TObject);
begin
   inherited;
   cdsGrupoAcesso.Data := CtrlAcessoCarteira.ListaGrupos;
   SelCartxGrupo(0);
end;

function TfrmCadGrupoXCart.SelCartxGrupo(iGrupo: Integer = -1): Boolean;
begin
   if Trim(dblGrupoAcesso.Text) <> '' then
   begin
      if iGrupo > 0 then
      begin
         cdsGrupoAcesso.Locate('IDGRUPO', iGrupo, []);
         dblGrupoAcesso.Text := cdsGrupoAcesso.FieldByName('NOMEGRUPO').AsString;
         dblGrupoAcesso.PerformSearch;
      end;
      cds.Data := CtrlAcessoCarteira.ListaGrupoXCart(cdsGrupoAcesso.FieldByName('IDGRUPO').AsInteger);
      cdsCartDisp.Data := CtrlAcessoCarteira.ListaCarteiras(cdsGrupoAcesso.FieldByName('IDGRUPO').AsInteger);
      CtrlAcessoCarteira.GrupoAtual := cdsGrupoAcesso.FieldByName('IDGRUPO').AsInteger;
      CtrlAcessoCarteira.NomeGrupoAtual := cdsGrupoAcesso.FieldByName('NOMEGRUPO').AsString;
   end
   else
   begin
      cds.Data := CtrlAcessoCarteira.ListaGrupoXCart(0);
      cdsCartDisp.Data := CtrlAcessoCarteira.ListaCarteiras(0);
      CtrlAcessoCarteira.GrupoAtual := 0;
      CtrlAcessoCarteira.NomeGrupoAtual := '';
   end;
   bModificado := False;
end;

procedure TfrmCadGrupoXCart.dblGrupoAcessoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if not bModificado then
      SelCartxGrupo(0)
   else
   begin
      if MsgDlg('Discarta as alterações efetuadas neste grupo?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         SelCartxGrupo(0)
      else
      begin
         cdsGrupoAcesso.Locate('IDGRUPO', CtrlAcessoCarteira.GrupoAtual, []);
         dblGrupoAcesso.Text := CtrlAcessoCarteira.NomeGrupoAtual;
      end;
   end;
end;

function TfrmCadGrupoXCart.InsereCarteira: Boolean;
begin
   try
      if not cdsCartDisp.IsEmpty then
      begin
         cds.Insert;
         cds.FieldByName('DESCCARTINVEST').AsString := cdsCartDisp.FieldByName('DESCCARTINVEST').AsString;
         cds.FieldByName('IDGRUPO').AsInteger := CtrlAcessoCarteira.GrupoAtual;
         cds.FieldByName('IDCARTEIRAINVEST').AsInteger := cdsCartDisp.FieldByName('IDCARTEIRAINVEST').AsInteger;
         cds.Post;
         bModificado := True;

         cdsCartDisp.Delete;
      end;
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível adicionar a Carteira','Mensagem do Sistema',mtWarning,[mbOk],0);
         ModalResult := mrCancel;
      end;
   end;
end;

function TfrmCadGrupoXCart.InsereTodasCarteiras: Boolean;
begin
   try //Finally
      cdsCartDisp.DisableControls;
      cds.DisableControls;
      try //Except
         cdsCartDisp.First;
         while not cdsCartDisp.Eof do
         begin
            cds.Insert;
            cds.FieldByName('DESCCARTINVEST').AsString := cdsCartDisp.FieldByName('DESCCARTINVEST').AsString;
            cds.FieldByName('IDGRUPO').AsInteger := CtrlAcessoCarteira.GrupoAtual;
            cds.FieldByName('IDCARTEIRAINVEST').AsInteger := cdsCartDisp.FieldByName('IDCARTEIRAINVEST').AsInteger;
            cds.Post;
            bModificado := True;
            cdsCartDisp.Delete;
         end;
      except
         on E:Exception do
         begin
            MsgDlg('Não foi possível adicionar uma Carteira','Mensagem do Sistema',mtWarning,[mbOk],0);
            ModalResult := mrCancel;
         end;
      end;
   finally
      cdsCartDisp.EnableControls;
      cds.EnableControls;
   end;
end;

function TfrmCadGrupoXCart.ExcluiCarteira: Boolean;
begin
   try
      if not cds.IsEmpty then
      begin
         cdsCartDisp.Insert;
         cdsCartDisp.FieldByName('DESCCARTINVEST').AsString := cds.FieldByName('DESCCARTINVEST').AsString;
         cdsCartDisp.FieldByName('IDGRUPO').Clear;
         cdsCartDisp.FieldByName('IDCARTEIRAINVEST').AsInteger := cds.FieldByName('IDCARTEIRAINVEST').AsInteger;
         cdsCartDisp.Post;

         cds.Delete;
         bModificado := True;
      end;
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível retirar a Carteira','Mensagem do Sistema',mtWarning,[mbOk],0);
         ModalResult := mrCancel;
      end;
   end;
end;

function TfrmCadGrupoXCart.ExcluiTodasCarteiras: Boolean;
begin
   try //Finally
      cdsCartDisp.DisableControls;
      cds.DisableControls;
      try //Except
         cds.First;
         while not cds.Eof do
         begin
            cdsCartDisp.Insert;
            cdsCartDisp.FieldByName('DESCCARTINVEST').AsString := cds.FieldByName('DESCCARTINVEST').AsString;
            cdsCartDisp.FieldByName('IDGRUPO').Clear;
            cdsCartDisp.FieldByName('IDCARTEIRAINVEST').AsInteger := cds.FieldByName('IDCARTEIRAINVEST').AsInteger;
            cdsCartDisp.Post;
            cds.Delete;
            bModificado := True;
         end;
      except
         on E:Exception do
         begin
            MsgDlg('Não foi possível retirar uma Carteira','Mensagem do Sistema',mtWarning,[mbOk],0);
            ModalResult := mrCancel;
         end;
      end;
   finally
      cdsCartDisp.EnableControls;
      cds.EnableControls;
   end;
end;

procedure TfrmCadGrupoXCart.dbgGrupoXCartDblClick(Sender: TObject);
begin
  inherited;
  ExcluiCarteira;
end;

procedure TfrmCadGrupoXCart.dbgCartDispDblClick(Sender: TObject);
begin
  inherited;
  InsereCarteira;
end;

procedure TfrmCadGrupoXCart.btnPassaUmClick(Sender: TObject);
begin
  inherited;
  ExcluiCarteira;
end;

procedure TfrmCadGrupoXCart.btnVoltaUmClick(Sender: TObject);
begin
  inherited;
  InsereCarteira;
end;

procedure TfrmCadGrupoXCart.btnPassaTodosClick(Sender: TObject);
begin
  inherited;
  ExcluiTodasCarteiras;
end;

procedure TfrmCadGrupoXCart.btnVoltaTodosClick(Sender: TObject);
begin
  inherited;
  InsereTodasCarteiras;
end;

procedure TfrmCadGrupoXCart.GridZebrado(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  // Se a Celula atual pertence a linha selecionada
  if (Sender as TwwDBGrid).CalcCellRow = (Sender as TwwDBGrid).GetActiveRow then
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end
  else
  begin
     // Se a celula atual não está selecionada nem fixada
     if (not (gdSelected in State)) and (not (gdFixed in State)) then
     begin
        if not Highlight then
        begin
           // linhas ímpares = amarelo, linhas pares = branco
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := $00C0FFFF // amarelo bebê
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     // Se a celula atual é a selecionada
     if State = [gdSelected] then
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

procedure TfrmCadGrupoXCart.MudaLinha(Sender: TObject);
begin
  // Acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadGrupoXCart.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not CtrlAcessoCarteira.GravaGrupoXCart then
  begin
     MsgDlg('Não foi possível atualizar as Carteiras deste grupo' + #13 +
            'Mensagem: ' + CtrlAcessoCarteira.MessageInfo,
            'Mensagem do Sistema', mtWarning, [mbOk], 0);
  end
  else
     bModificado := False;
end;

procedure TfrmCadGrupoXCart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlAcessoCarteira);
end;

procedure TfrmCadGrupoXCart.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   SelCartxGrupo(0);
end;

end.
