package fl.controls
{
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.events.ComponentEvent;
   import fl.managers.IFocusManager;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   
   public class TextInput extends UIComponent implements IFocusManagerComponent
   {
      
      private static var defaultStyles:Object = {
         "upSkin":"TextInput_upSkin",
         "disabledSkin":"TextInput_disabledSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":0,
         "embedFonts":false
      };
      
      public static var createAccessibilityImplementation:Function;
       
      
      protected var _html:Boolean = false;
      
      protected var _savedHTML:String;
      
      protected var background:DisplayObject;
      
      protected var _editable:Boolean = true;
      
      public var textField:TextField;
      
      public function TextInput()
      {
         _editable = true;
         _html = false;
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return defaultStyles;
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         if(focusTarget != null)
         {
            focusTarget.drawFocus(param1);
            return;
         }
         super.drawFocus(param1);
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == textField || super.isOurFocus(param1);
      }
      
      protected function handleKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            dispatchEvent(new ComponentEvent(ComponentEvent.ENTER,true));
         }
      }
      
      public function set text(param1:String) : void
      {
         textField.text = param1;
         _html = false;
         invalidate(InvalidationType.DATA);
         invalidate(InvalidationType.STYLES);
      }
      
      protected function updateTextFieldType() : void
      {
         textField.type = enabled && editable?TextFieldType.INPUT:TextFieldType.DYNAMIC;
         textField.selectable = enabled;
      }
      
      public function get selectionEndIndex() : int
      {
         return textField.selectionEndIndex;
      }
      
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         var _loc2_:* = null;
         if(param1.target == this)
         {
            stage.focus = textField;
         }
         _loc2_ = focusManager;
         if(editable && _loc2_)
         {
            _loc2_.showFocusIndicator = true;
            if(textField.selectable && textField.selectionBeginIndex == textField.selectionBeginIndex)
            {
               setSelection(0,textField.length);
            }
         }
         super.focusInHandler(param1);
         if(editable)
         {
            setIMEMode(true);
         }
      }
      
      public function get selectionBeginIndex() : int
      {
         return textField.selectionBeginIndex;
      }
      
      public function set alwaysShowSelection(param1:Boolean) : void
      {
         textField.alwaysShowSelection = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         updateTextFieldType();
      }
      
      protected function setEmbedFont() : *
      {
         var _loc1_:* = null;
         _loc1_ = getStyleValue("embedFonts");
         if(_loc1_ != null)
         {
            textField.embedFonts = _loc1_;
         }
      }
      
      public function get horizontalScrollPosition() : int
      {
         return textField.scrollH;
      }
      
      public function set condenseWhite(param1:Boolean) : void
      {
         textField.condenseWhite = param1;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         textField.displayAsPassword = param1;
      }
      
      public function set horizontalScrollPosition(param1:int) : void
      {
         textField.scrollH = param1;
      }
      
      public function get restrict() : String
      {
         return textField.restrict;
      }
      
      public function get textWidth() : Number
      {
         return textField.textWidth;
      }
      
      public function get textHeight() : Number
      {
         return textField.textHeight;
      }
      
      public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         updateTextFieldType();
      }
      
      public function get maxChars() : int
      {
         return textField.maxChars;
      }
      
      public function get length() : int
      {
         return textField.length;
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return textField.getLineMetrics(param1);
      }
      
      public function get imeMode() : String
      {
         return _imeMode;
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         if(editable)
         {
            setIMEMode(false);
         }
      }
      
      public function set htmlText(param1:String) : void
      {
         if(param1 == "")
         {
            text = "";
            return;
         }
         _html = true;
         _savedHTML = param1;
         textField.htmlText = param1;
         invalidate(InvalidationType.DATA);
         invalidate(InvalidationType.STYLES);
      }
      
      public function get text() : String
      {
         return textField.text;
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      public function get condenseWhite() : Boolean
      {
         return textField.condenseWhite;
      }
      
      public function get alwaysShowSelection() : Boolean
      {
         return textField.alwaysShowSelection;
      }
      
      override protected function draw() : void
      {
         var _loc1_:* = null;
         if(isInvalid(InvalidationType.STYLES,InvalidationType.STATE))
         {
            drawTextFormat();
            drawBackground();
            _loc1_ = getStyleValue("embedFonts");
            if(_loc1_ != null)
            {
               textField.embedFonts = _loc1_;
            }
            invalidate(InvalidationType.SIZE,false);
         }
         if(isInvalid(InvalidationType.SIZE))
         {
            drawLayout();
         }
         super.draw();
      }
      
      protected function handleTextInput(param1:TextEvent) : void
      {
         param1.stopPropagation();
         dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT,true,false,param1.text));
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         tabChildren = true;
         textField = new TextField();
         addChild(textField);
         updateTextFieldType();
         textField.addEventListener(TextEvent.TEXT_INPUT,handleTextInput,false,0,true);
         textField.addEventListener(Event.CHANGE,handleChange,false,0,true);
         textField.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown,false,0,true);
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         textField.setSelection(param1,param2);
      }
      
      public function get displayAsPassword() : Boolean
      {
         return textField.displayAsPassword;
      }
      
      public function appendText(param1:String) : void
      {
         textField.appendText(param1);
      }
      
      public function set restrict(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            param1 = null;
         }
         textField.restrict = param1;
      }
      
      public function get htmlText() : String
      {
         return textField.htmlText;
      }
      
      protected function drawBackground() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         _loc1_ = background;
         _loc2_ = !!enabled?"upSkin":"disabledSkin";
         background = getDisplayObjectInstance(getStyleValue(_loc2_));
         if(background == null)
         {
            return;
         }
         addChildAt(background,0);
         if(_loc1_ != null && _loc1_ != background && contains(_loc1_))
         {
            removeChild(_loc1_);
         }
      }
      
      override public function setFocus() : void
      {
         stage.focus = textField;
      }
      
      protected function drawLayout() : void
      {
         var _loc1_:Number = NaN;
         _loc1_ = Number(getStyleValue("textPadding"));
         if(background != null)
         {
            background.width = width;
            background.height = height;
         }
         textField.width = width - 2 * _loc1_;
         textField.height = height - 2 * _loc1_;
         textField.x = textField.y = _loc1_;
      }
      
      public function set maxChars(param1:int) : void
      {
         textField.maxChars = param1;
      }
      
      public function get maxHorizontalScrollPosition() : int
      {
         return textField.maxScrollH;
      }
      
      protected function drawTextFormat() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc1_ = UIComponent.getStyleDefinition();
         _loc2_ = !!enabled?_loc1_.defaultTextFormat as TextFormat:_loc1_.defaultDisabledTextFormat as TextFormat;
         textField.setTextFormat(_loc2_);
         _loc3_ = getStyleValue(!!enabled?"textFormat":"disabledTextFormat") as TextFormat;
         if(_loc3_ != null)
         {
            textField.setTextFormat(_loc3_);
         }
         else
         {
            _loc3_ = _loc2_;
         }
         textField.defaultTextFormat = _loc3_;
         setEmbedFont();
         if(_html)
         {
            textField.htmlText = _savedHTML;
         }
      }
      
      protected function handleChange(param1:Event) : void
      {
         param1.stopPropagation();
         dispatchEvent(new Event(Event.CHANGE,true));
      }
   }
}
