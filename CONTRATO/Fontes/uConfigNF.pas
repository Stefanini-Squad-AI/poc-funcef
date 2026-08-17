unit uConfigNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uGimp,
  wwQuery, uExtensoCM, uSistema, uFuncaoGeral;
Const
   MaxCampos = 24;
Type
   TBeforePrintLinhas = procedure (var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer) of object;
Type
  TConfigNfDevol = class(TComponent)
  private
    FBeforePrintLinhas: TBeforePrintLinhas;
    // Propriedades locais
    _ValorCampo    : Array[1..MaxCampos] of String;
    _Gimp          : TGimp;
    _qry           : TwwQuery;
    _qryDet        : TwwQuery;
    FModeloNota    : Real;
    FModulo        : Real;
    FModeloAtivo   : Boolean;
    FDataBaseName  : String;

    FNumNota    : String;
    FNatServ    : String;
    FDataEmis   : String;
    FVlrTotal   : String;
    FNumOrdem   : String;
    FDataVenc   : String;
    FDesconto   : String;
    FCondEspec  : String;
    FNomeCli    : String;
    FEndereco   : String;
    FBairro     : String;
    FMunicipio  : String;
    FUF         : String;
    FCEP        : String;
    FPracaPgto  : String;
    FCNPJ       : String;
    FInscricao  : String;
    FVlrExtenso : String;
    FDescProd   : String;
    FUnidMedida : String;
    FQuantidade : String;
    FVlrUnit    : String;
    FIRRF       : String;
    FVlrLiquido : String;

    procedure SetModeloNota(const Value: Real);
    procedure SetModuloNota(const Value: Real);
    procedure SetBeforePrintLinhas(const Value: TBeforePrintLinhas);
    procedure SetDataBaseName(const Value: String);

    procedure SetNumNota(const Value: String);
    procedure SetNatServ(const Value: String);
    procedure SetDataEmis(const Value: String);
    procedure SetVlrTotal(const Value: String);
    procedure SetNumOrdem(const Value: String);
    procedure SetDataVenc(const Value: String);
    procedure SetDesconto(const Value: String);
    procedure SetCondEspec(const Value: String);
    procedure SetNomeCli(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetMunicipio(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetPracaPgto(const Value: String);
    procedure SetFCNPJ(const Value: String);
    procedure SetInscricao(const Value: String);
    procedure SetVlrExtenso(const Value: String);
    procedure SetDescProd(const Value: String);
    procedure SetUnidMedida(const Value: String);
    procedure SetQuantidade(const Value: String);
    procedure SetVlrUnit(const Value: String);
    procedure SetIRRF(const Value: String);
    procedure SetVlrLiquido(const Value: String);
  Public

    property NumNota     : String read  FNumNota     write SetNumNota;
    property NatServ     : String read  FNatServ     write SetNatServ;
    property DataEmis    : String read  FDataEmis    write SetDataEmis;
    property VlrTotal    : String read  FVlrTotal    write SetVlrTotal;
    property NumOrdem    : String read  FNumOrdem    write SetNumOrdem;
    property DataVenc    : String read  FDataVenc    write SetDataVenc;
    property Desconto    : String read  FDesconto    write SetDesconto;
    property CondEspec   : String read  FCondEspec   write SetCondEspec;
    property NomeCli     : String read  FNomeCli     write SetNomeCli;
    property Endereco    : String read  FEndereco    write SetEndereco;
    property Bairro      : String read  FBairro      write SetBairro;
    property Municipio   : String read  FMunicipio   write SetMunicipio;
    property UF          : String read  FUF          write SetUF;
    property CEP         : String read  FCEP         write SetCEP;
    property PracaPgto   : String read  FPracaPgto   write SetPracaPgto;
    property CNPJ        : String read  FCNPJ        write SetFCNPJ;
    property Inscricao   : String read  FInscricao   write SetInscricao;
    property VlrExtenso  : String read  FVlrExtenso  write SetVlrExtenso;
    property DescProd    : String read  FDescProd    write SetDescProd;
    property UnidMedida  : String read  FUnidMedida  write SetUnidMedida;
    property Quantidade  : String read  FQuantidade  write SetQuantidade;
    property VlrUnit     : String read  FVlrUnit     write SetVlrUnit;
    property IRRF        : String read  FIRRF        write SetIRRF;
    property VlrLiquido  : String read  FVlrLiquido  write SetVlrLiquido;

    property ModeloNota        : Real    read FModeloNota   write SetModeloNota;
    property ModuloNota        : Real    read FModulo       write SetModuloNota;
    property ModeloAtivo       : Boolean read FModeloAtivo;
    property DataBaseName      : String  read FDataBaseName write SetDataBaseName;
    property BeforePrintLinhas : TBeforePrintLinhas read FBeforePrintLinhas write SetBeforePrintLinhas;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function  Inicializar: Boolean;
    procedure Finalizar;
    procedure ImprimeNota;
    procedure AtivaModeloNota(const Value: Boolean);
    procedure ImprimeMapa;
    procedure DoBeforePrintLinhas(var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer);
  End;

implementation

{ TConfigNfDevol }

constructor TConfigNfDevol.Create(AOwner: TComponent);
begin
   inherited;
   _Gimp   := TGimp.Create(AOwner);
   _Gimp.MostraPrinterSetup := True;
   _Qry    := TwwQuery.Create(AOwner);
   _QryDet := TwwQuery.Create(AOwner);

   FNumNota    :='';   //1
   FNatServ    :='';   //2
   FDataEmis   :='';   //3
   FVlrTotal   :='';   //4
   FNumOrdem   :='';   //5
   FDataVenc   :='';   //6
   FDesconto   :='';   //7
   FCondEspec  :='';   //8
   FNomeCli    :='';   //9
   FEndereco   :='';   //10
   FBairro     :='';   //11
   FMunicipio  :='';   //12
   FUF         :='';   //13
   FCEP        :='';   //14
   FPracaPgto  :='';   //15
   FCNPJ       :='';   //16
   FInscricao  :='';   //17
   FVlrExtenso :='';   //18
   FDescProd   :='';   //19
   FUnidMedida :='';   //20
   FQuantidade :='';   //21
   FVlrUnit    :='';   //22
   FIRRF       :='';   //23
   FVlrLiquido :='';   //24
end;

destructor TConfigNfDevol.Destroy;
begin
  _Gimp.Free;
  _Qry.Free;
  _QryDet.Free;
  inherited;
end;

procedure TConfigNfDevol.AtivaModeloNota;
begin
   if (FModeloNota<1) or (FModulo<1) then
      FModeloAtivo:=False
   else
      FModeloAtivo:=True;

   if FModeloAtivo then
    begin
       if _qry.Active then _qry.Close;
          _qry.Sql.Text :=' SELECT * '+
                          ' FROM                    '+
                          '    MODNOTAFISCAL         '+
                          ' WHERE                   '+
                          '    (IDMODELONF = '+FloatToStr(FModeloNota)+') AND '+
                          '    (IDMODULO = '+FloatToStr(FModulo)+') ';
         _qry.Open;

       if _qryDet.Active then _qryDet.Close;
          _qryDet.Sql.Text :=' SELECT  * '+
                             ' FROM '+
                             '    COMPNOTAFISCAL '+
                             ' WHERE '+
                             '      (IDMODELONF = '+FloatToStr(FModeloNota)+')'+
                             ' ORDER BY LINHA, COLUNA ';
          _qryDet.Open;
    end
   else
    begin
       if _qry.Active then _qryDet.Close;
       if _qryDet.Active then _qry.Close;
    end;
end;

procedure TConfigNfDevol.DoBeforePrintLinhas(var CodProduto, DescProduto,
  UnidMedida: String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI,
  ValorIPI: Double; var CanPrint: Boolean; iItemDet: Integer);
begin

if Assigned(BeforePrintLinhas) then
    BeforePrintLinhas(CodProduto, DescProduto, UnidMedida,Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI, CanPrint, iItemDet);

end;

procedure TConfigNfDevol.Finalizar;
begin
    _Gimp.Finalizar;
end;

procedure TConfigNfDevol.ImprimeMapa;
var
  X: Integer;
begin
  _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cRESETCONDENSADO);
  _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cDRAFT);
  for X := 1 to 64 do
    if (X mod 2) = 0 then
      _Gimp.ImprimirTexto('.........10........20........30........40........50........60........70........80')
    else
      if X < 10 then
        _Gimp.ImprimirTexto('L 0' + IntToStr(X) + '.....10........20........30........40........50........60........70........80')
      else
        _Gimp.ImprimirTexto('L ' + IntToStr(X) + '.....10........20........30........40........50........60........70........80');
  _Gimp.ImprimirTexto('_');
end;

procedure TConfigNfDevol.ImprimeNota;
Const
     INICIODET = 16;
     FINDET = 24;
Type
     TItemsNota = record
        FLGALINHAMENTO : string;
        IDCAMPONFDEVOL : Integer;
        COLUNA         : Integer;
        TAMANHO        : Integer;
     end;
Var
    iLinhaAnterior : Integer;
    iLinha         : Integer;
    x,i            : Integer;
    ItemsNota      : Array[1..9] Of TItemsNota;
    bComecaItems   : Boolean;
    sTexto         : String;
    sLinha         : String;

    CodProduto, DescProduto, UnidMedida :String;
    Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double;
    CanPrint: Boolean;
    iItemDet: Integer;
begin
 bComecaItems   := False;
 iLinhaAnterior := 0;
 iLinha         := 0;
 If (not _qry.IsEmpty) and (not _qryDet.IsEmpty) and (FModeloNota > 0) Then
     Begin
        _Gimp.Condensado := (_qry.FieldByName('FLGCONDENSADO').AsString = 'S');
        _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cRESETCONDENSADO);
        _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cDRAFT);
        //Verfica a posição dos campos do modelo selecionado.
        _QryDet.First;
        while not _QryDet.EOF Do
        Begin
           iLinha := _QryDet.FieldByName('LINHA').AsInteger;
           If (_QryDet.FieldByName('LINHA').AsInteger <> 0) And
              (_QryDet.FieldByName('COLUNA').AsInteger <> 0)
           Then
           Begin
              If iLinha <> iLinhaAnterior Then
              Begin
                 _Gimp.ImprimirTexto(sLInha);
                 sLInha := '';
                 // Imprime os Items da Nota
                 If bComecaItems Then
                 Begin
                    iItemDet := 0;
                    Repeat
                       CanPrint := False;
                       CodProduto := '';
                       DescProduto := '';
                       UnidMedida := '';
                       Quantidade := 0;
                       ValorUnit := 0;
                       ValorTotal := 0;
                       ICMS := 0;
                       IPI := 0;
                       ValorIPI := 0;

                       DoBeforePrintLinhas(CodProduto, DescProduto, UnidMedida,Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI, CanPrint, iItemDet);

                       sLInha := '';
                       If CanPrint Then
                       begin
                           If Trim(DescProduto) <> '' Then
                           Begin
                             _ValorCampo[INICIODET    ] := CodProduto;
                             _ValorCampo[INICIODET + 1] := DescProduto;
                             _ValorCampo[INICIODET + 2] := UnidMedida;
                             _ValorCampo[INICIODET + 3] := FormatFloat('#,##0.00',Quantidade);
                             _ValorCampo[INICIODET + 4] := FormatFloat('#,##0.00',ValorUnit);
                             _ValorCampo[INICIODET + 5] := FormatFloat('#,##0.00',ValorTotal);
                             _ValorCampo[INICIODET + 6] := FormatFloat('#,##0.00',ICMS);
                             _ValorCampo[INICIODET + 7] := FormatFloat('#,##0.00',IPI);
                             _ValorCampo[INICIODET + 8] := FormatFloat('#,##0.00',ValorIPI);
                             // Monta a Linha do detalhe
                             For x := 1 To 9 Do
                             Begin
                                //Alinhamento do Campo se Esquerda ou Direita
                                If ItemsNota[x].FLGALINHAMENTO = 'D' then
                                  sTexto := FuncaoGeral.AD(_ValorCampo[x + (INICIODET - 1)], ItemsNota[x].TAMANHO)
                                Else
                                  sTexto := FuncaoGeral.AE(_ValorCampo[x + (INICIODET - 1)], ItemsNota[x].TAMANHO);
                                //Verifica se é o primeiro campo.
                                If (ItemsNota[x].COLUNA - Length(sLInha)) >= 0 then
                                  sLInha := sLInha + FuncaoGeral.AE(' ', ItemsNota[x].COLUNA - Length(sLInha)) + sTexto
                                Else
                                  sLInha := sLInha + FuncaoGeral.AE(' ',Length(sLInha) -  ItemsNota[x].COLUNA) + sTexto;
                            End;

                            _Gimp.ImprimirTexto(sLinha);
                            sLInha := '';
                            Inc(iLinhaAnterior);
                            Inc(iItemDet);
                          End;
                       End;
                    Until Not CanPrint;
                 End;
                 //SAlta
                 for X := iLinhaAnterior to (iLinha - 2) do
                    _Gimp.ImprimirTexto('_');
              End;
              bComecaItems := (_qryDet.FieldByName('IDCAMPONFDEVOL').AsInteger in [INICIODET..FINDET]);
              i            := _qryDet.FieldByName('IDCAMPONFDEVOL').AsInteger;
              If i in [INICIODET..FINDET] Then
              Begin
                 ItemsNota[i - (INICIODET-1)].IDCAMPONFDEVOL  := _qryDet.FieldByName('IDCAMPONFDEVOL').AsInteger;
                 ItemsNota[i - (INICIODET-1)].TAMANHO         := _qryDet.FieldByName('TAMANHO').AsInteger;
                 ItemsNota[i - (INICIODET-1)].COLUNA          := _qryDet.FieldByName('COLUNA').AsInteger;
                 ItemsNota[i - (INICIODET-1)].FLGALINHAMENTO  := _qryDet.FieldByName('FLGALINHAMENTO').AsString;
              End
              Else
              Begin
                //Alinhamento do Campo se Esquerda ou Direita
                If _qryDet.FieldByName('FLGALINHAMENTO').AsString = 'D' then
                  sTexto := FuncaoGeral.ad(_ValorCampo[i], _qryDet.FieldByName('TAMANHO').AsInteger)
                Else
                  sTexto := FuncaoGeral.AE(_ValorCampo[i], _qryDet.FieldByName('TAMANHO').AsInteger);
                //Verifica se é o primeiro campo.
                If (_qryDet.FieldByName('COLUNA').AsInteger - Length(sLInha)) > 0 then
                  sLInha := sLInha + FuncaoGeral.AE(' ', _qryDet.FieldByName('COLUNA').AsInteger - Length(sLInha)) + sTexto
                Else
                  sLInha := sLInha + FuncaoGeral.AE(' ', _qryDet.FieldByName('COLUNA').AsInteger) + sTexto;
              End;
           End;
           iLinhaAnterior := _QryDet.FieldByName('LINHA').AsInteger;
           _qryDet.Next;
        End;
     End;

     if sLInha <> '' then
       _Gimp.ImprimirTexto(sLInha);

     for X := iLinha to (64) do
       _Gimp.ImprimirTexto('_');
end;

function TConfigNfDevol.Inicializar: Boolean;
begin
   Result := _Gimp.Inicializar;
end;

procedure TConfigNfDevol.SetBairro(const Value: String);
begin
   FBairro:=Value;
   _ValorCampo[11]:=Value;
end;

procedure TConfigNfDevol.SetBeforePrintLinhas(
  const Value: TBeforePrintLinhas);
begin
   FBeforePrintLinhas := Value;
end;

procedure TConfigNfDevol.SetCEP(const Value: String);
begin
   FCEP:=Value;
   _ValorCampo[14]:=Value;
end;

procedure TConfigNfDevol.SetCondEspec(const Value: String);
begin
   FCondEspec:=Value;
   _ValorCampo[8]:=Value;
end;

procedure TConfigNfDevol.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
  if _Qry.Active then
     _Qry.CLOSE;
  if _QryDet.Active then
     _QryDet.CLOSE;

  _Qry.DataBaseName := Value;
  _QryDet.DataBaseName := Value;
  _Gimp.DataBaseName := Value;
end;

procedure TConfigNfDevol.SetDataEmis(const Value: String);
begin
   FDataEmis:=Value;
   _ValorCampo[3]:=Value;   
end;

procedure TConfigNfDevol.SetDataVenc(const Value: String);
begin
   FDataVenc:=Value;
   _ValorCampo[6]:=Value;
end;

procedure TConfigNfDevol.SetDesconto(const Value: String);
begin
   FDesconto:=Value;
   _ValorCampo[7]:=Value;
end;

procedure TConfigNfDevol.SetDescProd(const Value: String);
begin
   FDescProd:=Value;
   _ValorCampo[19]:=Value;
end;

procedure TConfigNfDevol.SetEndereco(const Value: String);
begin
   FEndereco:=Value;
   _ValorCampo[10]:=Value;
end;

procedure TConfigNfDevol.SetFCNPJ(const Value: String);
begin
   FCNPJ:=Value;
   _ValorCampo[16]:=Value;
end;

procedure TConfigNfDevol.SetInscricao(const Value: String);
begin
   FInscricao:=Value;
   _ValorCampo[17]:=Value;
end;

procedure TConfigNfDevol.SetIRRF(const Value: String);
begin
   FIRRF:=Value;
   _ValorCampo[23]:=Value;
end;

procedure TConfigNfDevol.SetModeloNota(const Value: Real);
begin
   FModeloNota := Value;
end;

procedure TConfigNfDevol.SetModuloNota(const Value: Real);
begin
   FModulo:=Value;
end;

procedure TConfigNfDevol.SetMunicipio(const Value: String);
begin
   FMunicipio:=Value;
   _ValorCampo[12]:=Value;
end;

procedure TConfigNfDevol.SetNatServ(const Value: String);
begin
   FNatServ:=Value;
   _ValorCampo[2]:=Value;
end;

procedure TConfigNfDevol.SetNomeCli(const Value: String);
begin
   FNomeCli:=Value;
   _ValorCampo[9]:=Value;
end;

procedure TConfigNfDevol.SetNumNota(const Value: String);
begin
   FNumNota:=Value;
   _ValorCampo[1]:=Value;
end;

procedure TConfigNfDevol.SetNumOrdem(const Value: String);
begin
   FNumOrdem:=Value;
   _ValorCampo[5]:=Value;
end;

procedure TConfigNfDevol.SetPracaPgto(const Value: String);
begin
   FPracaPgto:=Value;
   _ValorCampo[15]:=Value;
end;

procedure TConfigNfDevol.SetQuantidade(const Value: String);
begin
   FQuantidade:=Value;
   _ValorCampo[21]:=Value;
end;

procedure TConfigNfDevol.SetUF(const Value: String);
begin
   FUF:=Value;
   _ValorCampo[13]:=Value;
end;

procedure TConfigNfDevol.SetUnidMedida(const Value: String);
begin
   FUnidMedida:=Value;
   _ValorCampo[20]:=Value;
end;

procedure TConfigNfDevol.SetVlrExtenso(const Value: String);
begin
   FVlrExtenso:=Value;
   _ValorCampo[18]:=Value;
end;

procedure TConfigNfDevol.SetVlrLiquido(const Value: String);
begin
   FVlrLiquido:=Value;
   _ValorCampo[24]:=Value;
end;

procedure TConfigNfDevol.SetVlrTotal(const Value: String);
begin
   FVlrTotal:=Value;
   _ValorCampo[4]:=Value;
end;

procedure TConfigNfDevol.SetVlrUnit(const Value: String);
begin
   FVlrUnit:=Value;
   _ValorCampo[22]:=Value;
end;

end.
