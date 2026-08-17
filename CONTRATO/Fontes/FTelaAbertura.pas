unit FTelaAbertura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  Wwdatsrc, DBCtrls,JPEG, ImgList, UDinamico;

type
  TfrmTelaAbertura = class(TfrmOkCancelar)
    ilPequenos: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    btnAssinatura: TBitBtn;
    btnDataBase: TBitBtn;
    btnDataPrevEncer: TBitBtn;
    btnDataEncer: TBitBtn;
    Panel1: TPanel;
    tvContratos: TTreeView;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel3: TPanel;
    ds: TwwDataSource;
    qry: TwwQuery;
    Dock974: TDock97;
    qryObjeto: TwwQuery;
    qryItem: TwwQuery;
    btnTodos: TBitBtn;
    ScrollBox1: TScrollBox;
    redtContratoInfo: TRichEdit;
    qryImagem: TwwQuery;
    qryContraparte: TwwQuery;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    btnPaginaInicial: TBitBtn;
    btnPaginaAnterior: TBitBtn;
    btnProximaPagina: TBitBtn;
    btnUltimaPagina: TBitBtn;
    edtPagina: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtTotalPaginas: TEdit;
    ckImagem: TCheckBox;
    qryImagemIMAGEM: TBlobField;
    qryContImagem: TwwQuery;
    dsContImagem: TwwDataSource;
    Bevel1: TBevel;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape3: TShape;
    Label6: TLabel;
    btnFullScreen: TBitBtn;
    btnNormalScreen: TBitBtn;
    Imagem: TImage;
    qryItemIDITEM: TFloatField;
    qryItemTIPOCOBRANCA: TStringField;
    qryItemEXTRA: TFloatField;
    qryObjetoIDOBJETO: TFloatField;
    qryItemNOMEOBJETO: TStringField;
    qryItemNOME_ITEM: TStringField;
    qryObjetoNOMEOBJETO: TStringField;
    Dock973: TDock97;
    procedure btnAssinaturaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDataBaseClick(Sender: TObject);
    procedure btnDataPrevEncerClick(Sender: TObject);
    procedure btnDataEncerClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvContratosClick(Sender: TObject);
    procedure Dock975Resize(Sender: TObject);
    procedure btnPaginaInicialClick(Sender: TObject);
    procedure btnPaginaAnteriorClick(Sender: TObject);
    procedure btnProximaPaginaClick(Sender: TObject);
    procedure btnUltimaPaginaClick(Sender: TObject);
    procedure ckImagemClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
    procedure btnNormalScreenClick(Sender: TObject);
    procedure qryContImagemAfterScroll(DataSet: TDataSet);
  private
    Dados : TField_GWF;
    { Private declarations }
  public
    { Public declarations }
     procedure MontaArvore(sql : string);
  end;

var
  frmTelaAbertura: TfrmTelaAbertura;

implementation

{$R *.DFM}
uses uSistema;

procedure TfrmTelaAbertura.MontaArvore(sql : string);
var
cnode,dnode,enode : ttreenode;
tmpdata : tdata;
begin
  application.ProcessMessages;
  dados.ClearAll;
  tmpdata.idcontrato     := 0;
  tmpdata.idobjeto       := 0;
  tmpdata.iditem         := 0;
  tmpdata.Contraparte    := '';
  tmpdata.TipodeContrato := '0';
  tmpdata.VlrBase        := 0;
  tmpdata.Descricao      := '';
  tmpdata.Aviso          := 0;
  qry.close;
  qry.SQL.clear;
  qry.SQL.Add(sql);
  qry.open;
  qry.first;
  while not qry.eof do begin
     qryContraparte.close;
     qryContraparte.ParamByName('idforcli').AsFloat := qry.fieldbyName('idforcli').AsFloat;
     qryContraparte.open;
     CNode := TVContratos.Items.AddChild(nil,qry.fieldbyname('NOMECONTRATO').AsString);
     tmpdata.idcontrato    := qry.fieldbyname('IDCONTRATO').AsInteger;
     tmpdata.Processo      := qry.fieldbyname('CODCONTRATOEMPR').AsString;
     tmpdata.Contraparte   := qryContraparte.fieldbyname('RAZAOSOCIAL').AsString;
     tmpdata.TipodeContrato:= qry.fieldbyname('TIPOCONTRATO').AsString;
     tmpdata.VlrBase       := qry.fieldbyname('VALORBASECONTRATO').AsFloat;
     tmpdata.Descricao     := qry.fieldbyname('DESCRICAOCONTRATO').AsString;
     tmpdata.observacao    := qry.fieldbyname('OBSERVACAO').AsString;
     tmpdata.Assinatura    := qry.fieldbyname('DATAASSINATURA').AsDateTime;
     tmpdata.Base          := qry.fieldbyname('DATABASECONTRATO').AsDateTime;
     tmpdata.PrevEncer     := qry.fieldbyname('DATAPREVENCERRA').AsDateTime;
     tmpdata.Aviso         := qry.fieldbyname('AVISO').AsInteger;
     tmpdata.TipoItem      := '00';
     tmpdata.idobjeto      := 0;
     tmpdata.iditem        := 0;
     tvContratos.SetFocus;

     if (Qry.FieldByname('DATAPREVENCERRA').AsDateTime <= now) then
      begin
         cnode.ImageIndex    := 8;
         cnode.SelectedIndex := 8;
         tmpdata.Encerrado   := true;
      end
     else
      if ((Qry.FieldByname('DATAPREVENCERRA').AsDateTime - Qry.FieldByname('AVISO').AsFloat)<= now)then
       begin
          cnode.ImageIndex    := 9;
          cnode.SelectedIndex := 9;
          tmpdata.Encerrado   := true;
       end
      else
       begin
          cnode.ImageIndex    := 0;
          cnode.SelectedIndex := 3;
          tmpdata.Encerrado   := false;
       end;
       
     cnode.Data := dados.novo(tmpdata);
     qryObjeto.Close;
     qryObjeto.paramByName('IDCONTRATO').AsInteger :=  qry.fieldbyname('IDCONTRATO').AsInteger;
     qryObjeto.open;
     qryObjeto.first;
     while not qryObjeto.eof do
     begin
        dNode := TVContratos.Items.AddChild(cnode,qryObjeto.fieldbyname('NOMEOBJETO').AsString);
        tmpdata.idcontrato    := qry.fieldbyname('IDCONTRATO').AsInteger;
        tmpdata.Processo      := qry.fieldbyname('CODCONTRATOEMPR').AsString;
        tmpdata.Contraparte   := qryContraparte.fieldbyname('RAZAOSOCIAL').AsString;
        tmpdata.TipodeContrato:= qry.fieldbyname('TIPOCONTRATO').AsString;
        tmpdata.VlrBase       := qry.fieldbyname('VALORBASECONTRATO').AsFloat;
        tmpdata.Descricao     := qry.fieldbyname('DESCRICAOCONTRATO').AsString;
        tmpdata.Assinatura    := qry.fieldbyname('DATAASSINATURA').AsDateTime;
        tmpdata.Base          := qry.fieldbyname('DATABASECONTRATO').AsDateTime;
        tmpdata.PrevEncer     := qry.fieldbyname('DATAPREVENCERRA').AsDateTime;
        tmpdata.observacao    := qry.fieldbyname('OBSERVACAO').AsString;
        tmpdata.idobjeto      := qryObjeto.fieldbyname('IDOBJETO').AsInteger;
        tmpdata.Aviso         := qry.fieldbyname('AVISO').AsInteger;
        tmpdata.iditem        := 0;
        tmpdata.TipoItem      := '00';
        dnode.ImageIndex      := 1;
        dnode.SelectedIndex   := 4;
        dnode.Data            := dados.novo(tmpdata);
        qryItem.Close;
        qryItem.paramByName('IDOBJETO').AsInteger := qryObjeto.fieldbyname('IDOBJETO').AsInteger;
        qryItem.open;
        qryItem.first;
        while not qryItem.eof do
        begin
           eNode := TVContratos.Items.AddChild(dnode,qryItem.fieldbyname('NOME_ITEM').AsString);
           tmpdata.idcontrato    := qry.fieldbyname('IDCONTRATO').AsInteger;
           tmpdata.Processo      := qry.fieldbyname('CODCONTRATOEMPR').AsString;
           tmpdata.Contraparte   := qryContraparte.fieldbyname('RAZAOSOCIAL').AsString;
           tmpdata.TipodeContrato:= qry.fieldbyname('TIPOCONTRATO').AsString;
           tmpdata.VlrBase       := qry.fieldbyname('VALORBASECONTRATO').AsFloat;
           tmpdata.Descricao     := qry.fieldbyname('DESCRICAOCONTRATO').AsString;
           tmpdata.Assinatura    := qry.fieldbyname('DATAASSINATURA').AsDateTime;
           tmpdata.Base          := qry.fieldbyname('DATABASECONTRATO').AsDateTime;
           tmpdata.PrevEncer     := qry.fieldbyname('DATAPREVENCERRA').AsDateTime;
           tmpdata.observacao    := qry.fieldbyname('OBSERVACAO').AsString;
           tmpdata.idobjeto      := qryObjeto.fieldbyname('IDOBJETO').AsInteger;
           tmpdata.iditem        := qryItem.fieldbyname('IDITEM').AsInteger;
           tmpdata.TipoItem      := qryItem.fieldbyname('TIPOCOBRANCA').AsString;
           tmpdata.Aviso         := qry.fieldbyname('AVISO').AsInteger;
           if qryItem.FieldByName('EXTRA').AsInteger = 0 then
            begin
               enode.ImageIndex    := 10;
               enode.SelectedIndex := 5;
            end
           else
            begin
               enode.ImageIndex    := 2;
               enode.SelectedIndex := 5;
            end;
           enode.Data := dados.novo(tmpdata);
           qryItem.next;
        end;
        qryObjeto.next;
     end;
     qry.next;
  end;
end;


procedure TfrmTelaAbertura.FormActivate(Sender: TObject);
begin
  inherited;
   tvcontratos.Items.Clear;
   MontaArvore('SELECT IDCONTRATO,IDFORCLI,NOMECONTRATO,CODCONTRATOEMPR,'+
               'TIPOCONTRATO,VALORBASECONTRATO,DATAPREVENCERRA,'+
               'DATABASECONTRATO,DATAASSINATURA,DESCRICAOCONTRATO,OBSERVACAO,AVISO '+
               'FROM CONTRATOCONTR '+
               'WHERE IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
               'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')'+
               'ORDER BY NOMECONTRATO');

end;

procedure TfrmTelaAbertura.btnAssinaturaClick(Sender: TObject);
begin
  inherited;
  tvcontratos.Items.Clear;
  MontaArvore('SELECT '+
              '   IDCONTRATO, '+
              '   IDFORCLI, '+
              '   NOMECONTRATO, '+
              '   CODCONTRATOEMPR, '+
              '   TIPOCONTRATO, '+
              '   VALORBASECONTRATO, '+
              '   DATAPREVENCERRA, '+
              '   DATABASECONTRATO, '+
              '   DATAASSINATURA,  '+
              '   DESCRICAOCONTRATO, '+
              '   OBSERVACAO,AVISO '+
              'FROM '+
              '   CONTRATOCONTR '+
              'WHERE '+
              '   (FLGFIMCONTRATO IN (''E'',''N'')) AND '+
              '   (IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
              '                   WHERE (IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')))'+
              'ORDER BY DATAASSINATURA');
end;

procedure TfrmTelaAbertura.btnDataBaseClick(Sender: TObject);
begin
  inherited;
  tvcontratos.Items.Clear;
  MontaArvore('SELECT '+
              '   IDCONTRATO, '+
              '   IDFORCLI, '+
              '   NOMECONTRATO, '+
              '   CODCONTRATOEMPR, '+
              '   TIPOCONTRATO, '+
              '   VALORBASECONTRATO, '+
              '   DATAPREVENCERRA,'+ 
              '   DATABASECONTRATO, '+
              '   DATAASSINATURA, '+
              '   DESCRICAOCONTRATO, '+
              '   OBSERVACAO,AVISO '+
              'FROM '+
              '   CONTRATOCONTR '+
              'WHERE '+
              '   (FLGFIMCONTRATO IN (''E'',''N'')) AND '+
              '   (IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
              '                  WHERE (IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+'))) '+
              'ORDER BY DATABASECONTRATO');
end;

procedure TfrmTelaAbertura.btnDataPrevEncerClick(Sender: TObject);
begin
  inherited;
  tvcontratos.Items.Clear;
  MontaArvore('SELECT '+
              '   IDCONTRATO, '+
              '   CODCONTRATOEMPR, '+
              '   IDFORCLI, '+
              '   NOMECONTRATO, '+
              '   TIPOCONTRATO, '+
              '   VALORBASECONTRATO, '+
              '   DATAPREVENCERRA, '+
              '   DATABASECONTRATO, '+
              '   DATAASSINATURA, '+
              '   DESCRICAOCONTRATO, '+
              '   OBSERVACAO,AVISO '+
              'FROM '+
              '   CONTRATOCONTR '+
              'WHERE '+
              '   (FLGFIMCONTRATO IN (''E'',''N'')) AND '+
              '   (IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
              '                  WHERE (IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+'))) '+
              'ORDER BY DATAPREVENCERRA');
end;

procedure TfrmTelaAbertura.btnDataEncerClick(Sender: TObject);
begin
  inherited;
  tvcontratos.Items.Clear;
  MontaArvore('SELECT '+
              '   IDCONTRATO, '+
              '   IDFORCLI, '+
              '   CODCONTRATOEMPR,'+
              '   NOMECONTRATO, '+
              '   TIPOCONTRATO, '+
              '   VALORBASECONTRATO,'+
              '   DATAPREVENCERRA, '+
              '   DATABASECONTRATO, '+
              '   DATAASSINATURA,'+
              '   DESCRICAOCONTRATO, '+
              '   OBSERVACAO,AVISO '+
              'FROM '+
              '   CONTRATOCONTR '+
              'WHERE '+
              '   (FLGFIMCONTRATO = ''S'') AND '+
              '   (IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
              '                   WHERE (IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+'))) '+
              'ORDER BY DATAEFETENCERRA');
end;

procedure TfrmTelaAbertura.btnTodosClick(Sender: TObject);
begin
  inherited;
  tvcontratos.Items.Clear;
  MontaArvore('SELECT '+
              '   IDCONTRATO, '+
              '   IDFORCLI, '+
              '   NOMECONTRATO, '+
              '   CODCONTRATOEMPR, '+
              '   TIPOCONTRATO, '+
              '   VALORBASECONTRATO, '+
              '   DATAPREVENCERRA,'+
              '   DATABASECONTRATO, '+
              '   DATAASSINATURA, '+
              '   DESCRICAOCONTRATO, '+
              '   OBSERVACAO,AVISO '+
              'FROM '+
              '   CONTRATOCONTR '+
              'WHERE '+
              '   (IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
              '                   WHERE (IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+'))) '+
              'ORDER BY NOMECONTRATO');
end;

procedure TfrmTelaAbertura.FormCreate(Sender: TObject);
begin
  inherited;
  Dados := TField_GWF.Create;
  if not qryObjeto.Prepared then qryObjeto.Prepare;
  if not qryItem.Prepared then qryItem.Prepare;
  if not qryContraparte.Prepared then qryContraparte.Prepare;
end;

procedure TfrmTelaAbertura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dados.ClearAll;
end;

procedure TfrmTelaAbertura.tvContratosClick(Sender: TObject);
var
tmpdata : tData;
campo :PCampo;
begin
  inherited;
  redtContratoInfo.Lines.Clear;
  redtContratoInfo.DefAttributes.Color := clNavy;
  redtContratoInfo.DefAttributes.Style:= [];
  campo := tvContratos.Selected.Data;
  tmpdata := campo.dados;
  if tmpdata.Encerrado then begin
     redtContratoInfo.lines.add('Encerramento em '+datetimetostr(tmpdata.PrevEncer));
  end;
  redtContratoInfo.Lines.Add('Número do Processo................:'+tmpdata.Processo);
  redtContratoInfo.Lines.Add('Contraparte..............................:'+tmpdata.Contraparte);
  if trim(tmpdata.TipodeContrato) = 'A'then  redtContratoInfo.Lines.Add('Tipo de Contrato.......................:Cliente');
  if trim(tmpdata.TipodeContrato) = 'P'then  redtContratoInfo.Lines.Add('Tipo de Contrato.......................:Fornecedor');
  redtContratoInfo.Lines.Add('Data de Assinatura...................:'+datetimetostr( tmpdata.Assinatura));
  redtContratoInfo.Lines.Add('Data Base................................:'+datetimetostr(tmpdata.Base));
  redtContratoInfo.Lines.Add('Data Prevista de Encerramento..:'+datetimetostr(tmpdata.PrevEncer));
  redtContratoInfo.Lines.Add('Valor Base...............................:  '+FormatFloat('#0.00',tmpdata.VlrBase));
  redtContratoInfo.Lines.Add('Aviso de vencimento/encerramento (dias)..:  '+FormatFloat('#000',tmpdata.Aviso));
  case tmpdata.TipoItem[1] of
  'P':case tmpdata.TipoItem[2] of
      'S':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Periódica sem medição de quantidade');
      'Q':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Periódica com medição de quantidade');
      'V':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Periódica com medição de valor');
      end;
  'E':case tmpdata.TipoItem[2] of
      'Q':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Eventual por apontamento de quantidade');
      'V':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Eventual por apontamento de valor');
      end;
  'A':case tmpdata.TipoItem[2] of
      'S':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Ligado a atividade sem medição');
      'Q':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Ligado a atividade com medição de Quantidade');
      'V':redtContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Ligado a atividade com medição de Valor');
      end;
  end;
  redtContratoInfo.Lines.Add('');
  redtContratoInfo.Lines.Add('Descrição do Contrato:');
  redtContratoInfo.Lines.Add('');
  redtContratoInfo.Lines.Add(tmpdata.Descricao);
  redtContratoInfo.Lines.Add('');
  redtContratoInfo.Lines.Add('Observações:');
  redtContratoInfo.Lines.Add('');
  redtContratoInfo.Lines.Add(tmpdata.observacao);
  if tmpdata.Encerrado then begin
     redtContratoInfo.SelStart := 0;
     redtContratoInfo.SelLength := length('Encerramento em '+datetimetostr(tmpdata.PrevEncer));
     redtContratoInfo.SelAttributes.Color := clred;
     redtContratoInfo.SelAttributes.Style:= [fsBold];
     redtContratoInfo.SelLength := 0;
  end;
  if tmpdata.idobjeto = 0 then begin
     qryContImagem.close;
     qryContImagem.ParamByName('idcontrato').AsFloat := tmpdata.idcontrato;
     if ckImagem.Checked and (tvContratos.Selected.Level = 0) then begin
        qryContImagem.open;
        edtPagina.text := '1';
        edtTotalPaginas.text := qryContImagem.FieldByName('QUANTIDADE').AsString;
        qryImagem.Close;
        qryImagem.ParamByName('IDIMAGEM').AsFloat := qryContImagem.FieldByName('IDIMAGEM').AsFloat;
        qryImagem.open;
        qryImagemIMAGEM.SaveToFile('c:\temp\c&p~tmp'+qryContImagem.FieldByName('EXTENSAO').AsString);
        imagem.Picture.LoadFromFile('c:\temp\c&p~tmp'+qryContImagem.FieldByName('EXTENSAO').AsString);
        deletefile('c:\temp\c&p~tmp'+qryContImagem.FieldByName('EXTENSAO').AsString);
        qryImagem.close;
        Imagem.Width := Imagem.Picture.Width;
        Imagem.Height:= Imagem.Picture.Height;
     end;
  end;
end;

procedure TfrmTelaAbertura.Dock975Resize(Sender: TObject);
begin
  inherited;
  if Dock975.Height = 0 then imagem.Top := 0
  else imagem.Top := 29;
end;

procedure TfrmTelaAbertura.btnPaginaInicialClick(Sender: TObject);
begin
  inherited;
  qryContImagem.First;
  edtPagina.text := '1';
end;

procedure TfrmTelaAbertura.btnPaginaAnteriorClick(Sender: TObject);
begin
  inherited;
  qryContImagem.Prior;
  edtPagina.text := qryContImagem.FieldByName('pagina').AsString;
end;

procedure TfrmTelaAbertura.btnProximaPaginaClick(Sender: TObject);
begin
  inherited;
  qryContImagem.Next;
  edtPagina.text := qryContImagem.FieldByName('pagina').AsString;
end;

procedure TfrmTelaAbertura.btnUltimaPaginaClick(Sender: TObject);
begin
  inherited;
  qryContImagem.Last;
  edtPagina.text := qryContImagem.FieldByName('quantidade').AsString;
end;

procedure TfrmTelaAbertura.ckImagemClick(Sender: TObject);
begin
  inherited;
  if not ckImagem.Checked then begin
     qryImagem.close;
     qryContImagem.close;
  end;
end;

procedure TfrmTelaAbertura.btnFullScreenClick(Sender: TObject);
begin
  inherited;
  Toolbar971.Visible := false;
  tvContratos.Visible := False;
  redtContratoInfo.Visible := false;
  panel1.visible := false;
  panel3.visible := false;
  panel2.Height := pnlfundo.Height-5;
  Dock972.AllowDrag := false;
  if not ckImagem.Checked then begin
     imagem.Width := scrollbox1.Width;
     imagem.height := scrollbox1.height;
  end;
end;
procedure TfrmTelaAbertura.btnNormalScreenClick(Sender: TObject);
begin
  inherited;
  Toolbar971.Visible := true;
  tvContratos.Visible := true;
  redtContratoInfo.Visible := true;
  panel1.visible := true;
  panel3.visible := true;
  panel2.Height := 102;
  Dock972.AllowDrag := true;
  if not ckImagem.Checked then begin
     imagem.Width := scrollbox1.Width;
     imagem.height := scrollbox1.height;
  end;
end;

procedure TfrmTelaAbertura.qryContImagemAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryImagem.Close;
  qryImagem.ParamByName('IDIMAGEM').AsFloat := qryContImagem.FieldByName('IDIMAGEM').AsFloat;
  qryImagem.open;
  qryImagemIMAGEM.SaveToFile('c:\temp\c&p~tmp'+qryContImagem.FieldByName('EXTENSAO').AsString);
  imagem.Picture.LoadFromFile('c:\temp\c&p~tmp'+qryContImagem.FieldByName('EXTENSAO').AsString);
  deletefile('c:\temp\c&p~tmp'+qryContImagem.FieldByName('EXTENSAO').AsString);
  qryImagem.close;
  Imagem.Width := Imagem.Picture.Width;
  Imagem.Height:= Imagem.Picture.Height;
end;

end.





