unit FConsultaContratosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TREdit,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, DBCtrls,
  ImgList, uCtrlUsuXContrato, uCtrlImagemContr;

type
  PPosicao = ^TRegPosicao;
  TRegPosicao = record
                   sContrato  : String;
                   sNumLinha  : String;
                   sTipoLinha : String;
                end;

  TfrmConsultaContratosMT = class(TfrmOkCancelar)
    pnlImagemContr: TPanel;
    sbImagemContrato: TScrollBox;
    pnlDescricaoContr: TPanel;
    pnlNavegador: TPanel;
    btnPaginaInicial: TBitBtn;
    btnPaginaAnterior: TBitBtn;
    btnProximaPagina: TBitBtn;
    btnUltimaPagina: TBitBtn;
    btnFullScreen: TBitBtn;
    btnNormalScreen: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cbMostraImagem: TCheckBox;
    Splitter1: TSplitter;
    tvContratos: TTreeView;
    Splitter2: TSplitter;
    riedContratoInfo: TRichEdit;
    pnlTopo: TPanel;
    rgLegenda: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgFiltro: TRadioGroup;
    rgOrdenacao: TRadioGroup;
    dbrePagina: TDBRealEdit;
    spTeste: TCMSqlParams;
    dsImagemContr: TDataSource;
    redTotalPag: TRealEdit;
    dbiImagem: TDBImage;
    cdsImagemContr: TCMClientDataSet;
    dsContratos: TDataSource;
    cdsContratos: TCMClientDataSet;
    ilImagens: TImageList;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvContratosClick(Sender: TObject);
    procedure cdsContratosAfterScroll(DataSet: TDataSet);
    procedure dsImagemContrDataChange(Sender: TObject; Field: TField);
    procedure btnPaginaInicialClick(Sender: TObject);
    procedure btnPaginaAnteriorClick(Sender: TObject);
    procedure btnProximaPaginaClick(Sender: TObject);
    procedure btnUltimaPaginaClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
    procedure btnNormalScreenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure rgOrdenacaoClick(Sender: TObject);
    procedure cbMostraImagemClick(Sender: TObject);
  private
    { Private declarations }
    CtrlUsuXContrato : TCtrlUsuXContrato;
    CtrlImagemContr : TCtrlImagemContr;
    procedure ExibeDescricao;
    procedure MontaTreeView;
  public
    { Public declarations }
  end;

var
  frmConsultaContratosMT: TfrmConsultaContratosMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmConsultaContratosMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlUsuXContrato:=TCtrlUsuXContrato.Create;
   CtrlUsuXContrato.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlImagemContr:=TCtrlImagemContr.Create;
   CtrlImagemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   cdsContratos.Data:=CtrlUsuXContrato.ListDadosContrxUsuxObjxItem(Sistema.IdEmpresa,
                                                                   Sistema.IdUsuario);
   cdsImagemContr.Data:=CtrlImagemContr.ListImagensContr(-1); //vazio
   MontaTreeView;
end;

procedure TfrmConsultaContratosMT.FormShow(Sender: TObject);
begin
   inherited;
   Self.WindowState:=wsMaximized;
end;

procedure TfrmConsultaContratosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlUsuXContrato.Free;
   CtrlImagemContr.Free;
end;

procedure TfrmConsultaContratosMT.rgFiltroClick(Sender: TObject);
var
   sFiltro1 : String;
   sFiltro2 : String;
begin
   sFiltro1:='(FLGFIMCONTRATO = ''E'') OR '+
             '(DATAPREVENCERRA < '''+
               FormatDateTime('dd/mm/yyyy',Now)+''' )';
   sFiltro2:='((DATAPREVENCERRA-AVISO) <= '''+
                FormatDateTime('dd/mm/yyyy',Now)+''' ) AND '+
             '(DATAPREVENCERRA >='''+
               FormatDateTime('dd/mm/yyyy',Now)+''' )';

   case rgFiltro.ItemIndex of
      0: begin
            cdsContratos.Filtered:=False;
            cdsContratos.Filter:='';
         end;
      1: begin
            cdsContratos.Filtered:=False;
            cdsContratos.Filter:=sFiltro1;
            cdsContratos.Filtered:=True;
         end;
      2: begin
            cdsContratos.Filtered:=False;
            cdsContratos.Filter:=sFiltro2;
            cdsContratos.Filtered:=True;
         end;
      3: begin
            cdsContratos.Filtered:=False;
            cdsContratos.Filter:='(FLGFIMCONTRATO = ''S'') AND '+
                                 'NOT('+sFiltro1+') AND '+
                                 'NOT('+sFiltro2+') ';
            cdsContratos.Filtered:=True;
         end;
      4: begin
            cdsContratos.Filtered:=False;
            cdsContratos.Filter:='FLGFIMCONTRATO = ''N''';
            cdsContratos.Filtered:=True;
         end;
   end;
   MontaTreeView;
end;

procedure TfrmConsultaContratosMT.rgOrdenacaoClick(Sender: TObject);
begin
   case rgOrdenacao.ItemIndex of
      0: cdsContratos.IndexName:='IndNome';
      1: cdsContratos.IndexName:='IndDataAss';
      2: cdsContratos.IndexName:='IndDataBase';
      3: cdsContratos.IndexName:='IndDataPrevEnc';
   end;
   MontaTreeView;
end;

procedure TfrmConsultaContratosMT.cbMostraImagemClick(Sender: TObject);
begin
   if cbMostraImagem.Checked then
    begin
       cdsImagemContr.Data:=CtrlImagemContr.ListImagensContr(cdsContratos.FieldByName('IDCONTRATO').AsFloat);
       cdsImagemContr.First;
    end
   else
    cdsImagemContr.EmptyDataSet;
end;

procedure TfrmConsultaContratosMT.cdsContratosAfterScroll(
  DataSet: TDataSet);
begin
   if not(cbMostraImagem.Checked) then Exit;
   cdsImagemContr.Close;
   cdsImagemContr.Data:=CtrlImagemContr.ListImagensContr(cdsContratos.FieldByName('IDCONTRATO').AsFloat);
   cdsImagemContr.First;
end;

procedure TfrmConsultaContratosMT.dsImagemContrDataChange(Sender: TObject;
  Field: TField);
begin
   btnPaginaInicial.Enabled:=(cdsImagemContr.RecordCount>0);
   btnPaginaAnterior.Enabled:=(cdsImagemContr.RecordCount>0);
   btnProximaPagina.Enabled:=(cdsImagemContr.RecordCount>0);
   btnUltimaPagina.Enabled:=(cdsImagemContr.RecordCount>0);
   btnFullScreen.Enabled:=(cdsImagemContr.RecordCount>0);
   btnNormalScreen.Enabled:=(cdsImagemContr.RecordCount>0);
   redTotalPag.Value:=cdsImagemContr.RecordCount;
end;

procedure TfrmConsultaContratosMT.tvContratosClick(Sender: TObject);
begin
   cdsContratos.Locate('NUMLINHA',
                       StrToFloat(PPosicao(tvContratos.Selected.Data)^.sNumLinha),[]);
   ExibeDescricao;
end;

procedure TfrmConsultaContratosMT.btnPaginaInicialClick(Sender: TObject);
begin
   cdsImagemContr.First;
end;

procedure TfrmConsultaContratosMT.btnPaginaAnteriorClick(Sender: TObject);
begin
   if (cdsImagemContr.Bof) then Exit;
   cdsImagemContr.Prior;
end;

procedure TfrmConsultaContratosMT.btnProximaPaginaClick(Sender: TObject);
begin
   if (cdsImagemContr.Eof) then Exit;
   cdsImagemContr.Next;
end;

procedure TfrmConsultaContratosMT.btnUltimaPaginaClick(Sender: TObject);
begin
   cdsImagemContr.Last;
end;

procedure TfrmConsultaContratosMT.btnFullScreenClick(Sender: TObject);
begin
   pnlDescricaoContr.Visible:=False;
   pnlTopo.Visible:=False;
end;

procedure TfrmConsultaContratosMT.btnNormalScreenClick(Sender: TObject);
begin
   pnlTopo.Visible:=True;
   pnlDescricaoContr.Visible:=True;
end;

procedure TfrmConsultaContratosMT.MontaTreeView;
var
   rIDContratoAnt : Double;
   rIDItemAnt     : Double;
   rIDObjetoAnt   : Double;
   PPLinha        : PPosicao;
   Grupo          : array [1..3] of TTreeNode;
begin
   cdsContratos.First;

   tvContratos.Visible:=False;
   tvContratos.Items.Clear;

   rIDContratoAnt:=0;
   rIDContratoAnt:=0;
   rIDItemAnt:=0;

   while not(cdsContratos.Eof) do
   begin
      if (cdsContratos.FieldByName('IDCONTRATO').AsFloat<>rIDContratoAnt) then
       begin
          rIDContratoAnt:=cdsContratos.FieldByName('IDCONTRATO').AsFloat;
          rIDItemAnt:=0;
          rIDObjetoAnt:=0;

          New(PPLinha);
          PPLinha^.sContrato:=cdsContratos.FieldByName('NOMECONTRATO').AsString;
          PPLinha^.sNumLinha:=FloatToStr(cdsContratos.FieldByName('NUMLINHA').AsFloat);
          PPLinha^.sTipoLinha:='C';
          Grupo[1]:=tvContratos.Items.AddObject(nil,
                                                cdsContratos.FieldByName('NOMECONTRATO').AsString,
                                                PPLinha);

          if (cdsContratos.FieldByName('FLGFIMCONTRATO').AsString='N') then
           begin
              Grupo[1].ImageIndex:=3;
              Grupo[1].SelectedIndex:=9;
           end
          else
           if (cdsContratos.FieldByname('DATAPREVENCERRA').AsDateTime<now) or
              (cdsContratos.FieldByname('FLGFIMCONTRATO').AsString='E') then
            begin
               Grupo[1].ImageIndex:=0;
               Grupo[1].SelectedIndex:=6;
            end
           else
            if (now >= (cdsContratos.FieldByname('DATAPREVENCERRA').AsDateTime -
                        cdsContratos.FieldByname('AVISO').AsFloat)) and
               (now <= cdsContratos.FieldByname('DATAPREVENCERRA').AsDateTime) then
             begin
                Grupo[1].ImageIndex:=1;
                Grupo[1].SelectedIndex:=7;
             end
            else
             begin
                Grupo[1].ImageIndex:=2;
                Grupo[1].SelectedIndex:=8;
             end;
       end;

      if (cdsContratos.FieldByName('IDITEM').AsFloat<>rIDItemAnt) and
         not(cdsContratos.FieldByName('IDITEM').IsNull) then
       begin
          rIDItemAnt:=cdsContratos.FieldByName('IDITEM').AsFloat;
          rIDObjetoAnt:=0;

          New(PPLinha);
          PPLinha^.sContrato:=cdsContratos.FieldByName('NOMECONTRATO').AsString;
          PPLinha^.sNumLinha:=FloatToStr(cdsContratos.FieldByName('NUMLINHA').AsFloat);
          PPLinha^.sTipoLinha:='I';
          Grupo[2]:=tvContratos.Items.AddChildObject(Grupo[1],
                                                     cdsContratos.FieldByName('NOMECONTRATO').AsString,
                                                     PPLinha);
          Grupo[2].ImageIndex:=4;
          Grupo[2].SelectedIndex:=10;
       end;

      if (cdsContratos.FieldByName('IDOBJETO').AsFloat<>rIDObjetoAnt) and
         not(cdsContratos.FieldByName('IDOBJETO').IsNull) then
       begin
          rIDObjetoAnt:=cdsContratos.FieldByName('IDOBJETO').AsFloat;

          New(PPLinha);
          PPLinha^.sContrato:=cdsContratos.FieldByName('NOMECONTRATO').AsString;
          PPLinha^.sNumLinha:=FloatToStr(cdsContratos.FieldByName('NUMLINHA').AsFloat);
          PPLinha^.sTipoLinha:='O';
          Grupo[3]:=tvContratos.Items.AddChildObject(Grupo[2],
                                                     cdsContratos.FieldByName('NOMECONTRATO').AsString,
                                                     PPLinha);
          Grupo[3].ImageIndex:=5;
          Grupo[3].SelectedIndex:=10;
       end;

      cdsContratos.Next;
   end;
   tvContratos.Visible:=True;
end;

procedure TfrmConsultaContratosMT.ExibeDescricao;
begin
   riedContratoInfo.Lines.Clear;
   riedContratoInfo.DefAttributes.Color := clred;
   riedContratoInfo.DefAttributes.Style:= [fsBold];

   if  (cdsContratos.FieldByName('FLGFIMCONTRATO').AsString='E') then
        riedContratoInfo.Lines.Add('Encerramento em '+
            FormatDateTime('dd/mm/yyyy',cdsContratos.FieldByName('DATAPREVENCERRA').AsDateTime));

   riedContratoInfo.DefAttributes.Color := clNavy;
   riedContratoInfo.DefAttributes.Style:= [];

   riedContratoInfo.Lines.Add('Número do Processo................:'+
       cdsContratos.FieldByName('CODCONTRATOEMPR').AsString);

   riedContratoInfo.Lines.Add('Contraparte..............................:'+
       cdsContratos.FieldByName('RAZAOSOCIAL').AsString);

   if (cdsContratos.FieldByName('TIPOCONTRATO').AsString='A') then
       riedContratoInfo.Lines.Add('Tipo de Contrato.......................:Cliente');

   if (cdsContratos.FieldByName('TIPOCONTRATO').AsString='P') then
       riedContratoInfo.Lines.Add('Tipo de Contrato.......................:Fornecedor');

   riedContratoInfo.Lines.Add('Data de Assinatura...................:'+
                    FormatDateTime('dd/mm/yyyy',cdsContratos.FieldByName('DATAASSINATURA').AsDateTime));

   riedContratoInfo.Lines.Add('Data Base................................:'+
                    FormatDateTime('dd/mm/yyyy',cdsContratos.FieldByName('DATABASECONTRATO').AsDateTime));

   riedContratoInfo.Lines.Add('Data Prevista de Encerramento..:'+
                    FormatDateTime('dd/mm/yyyy',cdsContratos.FieldByName('DATAPREVENCERRA').AsDateTime));

   riedContratoInfo.Lines.Add('Valor Base...............................:  '+
                    FormatFloat('#,##0.00',cdsContratos.FieldByName('VALORBASECONTRATO').AsFloat));

   riedContratoInfo.Lines.Add('Aviso de vencimento/encerramento (dias)..:  '+
                    FormatFloat('#000',cdsContratos.FieldByName('AVISO').AsFloat));

   if (PPosicao(tvContratos.Selected.Data)^.sTipoLinha='I') then
      case cdsContratos.FieldByName('TIPOCOBRANCA').AsString[1] of
         'P':case cdsContratos.FieldByName('TIPOCOBRANCA').AsString[2] of
                'S':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Periódica sem medição de quantidade');
                'Q':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Periódica com medição de quantidade');
                'V':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Periódica com medição de valor');
             end;
        'E':case cdsContratos.FieldByName('TIPOCOBRANCA').AsString[2] of
               'Q':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Eventual por apontamento de quantidade');
               'V':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Eventual por apontamento de valor');
            end;
        'A':case cdsContratos.FieldByName('TIPOCOBRANCA').AsString[2] of
               'S':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Ligado a atividade sem medição');
               'Q':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Ligado a atividade com medição de Quantidade');
               'V':riedContratoInfo.Lines.Add('Tipo de Cobrança do Item..........: Ligado a atividade com medição de Valor');
            end;
        end;

   riedContratoInfo.Lines.Add('');
   riedContratoInfo.Lines.Add('Descrição do Contrato:');
   riedContratoInfo.Lines.Add('');
   riedContratoInfo.Lines.Add(cdsContratos.FieldByName('DESCRICAOCONTRATO').AsString);
   riedContratoInfo.Lines.Add('');
   riedContratoInfo.Lines.Add('Observações:');
   riedContratoInfo.Lines.Add('');
   riedContratoInfo.Lines.Add(cdsContratos.FieldByName('OBSERVACAO').AsString);
end;

end.
